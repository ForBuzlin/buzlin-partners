import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_archive/flutter_archive.dart';

abstract class ArchiveFormat {
  ArchiveFormat._();
  static Directory appDataDir = Directory.systemTemp;

  static const dataFilesBaseDirectoryName = "store";

  static Future startZip() async {
    debugPrint("Start test");
    // test createFromDirectory
    // case 1
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result?.files.first.path != null) {
      var zipFile = await testZip(
          includeBaseDirectory: false,
          progress: true,
          fileName: result?.files.first.name ?? '');
      debugPrint(zipFile.path);
    }
    // await _testUnzip(zipFile, zipIncludesBaseDirectory: false);
    // await _testUnzip(zipFile, progress: true);
    // // case 2
    // zipFile = await _testZip(includeBaseDirectory: true, progress: false);
    // await _testUnzip(zipFile, zipIncludesBaseDirectory: true);
    //
    // // test createFromFiles
    // // case 1
    // zipFile = await _testZipFiles(includeBaseDirectory: false);
    // await _testUnzip(zipFile, zipIncludesBaseDirectory: false);
    // // case 2
    // zipFile = await _testZipFiles(includeBaseDirectory: true);
    // await _testUnzip(zipFile, zipIncludesBaseDirectory: true);

    debugPrint("DONE!");
  }

  static Future<File> testZip(
      {required bool includeBaseDirectory,
      bool progress = false,
      required String fileName}) async {
    debugPrint("_appDataDir=${appDataDir.path}");
    final storeDir =
        Directory("${appDataDir.path}${"/$dataFilesBaseDirectoryName"}");

    createTestFiles(storeDir, fileName);

    final zipFile = createZipFile("digital.zip");
    debugPrint("Writing to zip file: ${zipFile.path}");

    int onProgressCallCount1 = 0;

    try {
      await ZipFile.createFromDirectory(
        sourceDir: storeDir,
        zipFile: zipFile,
        recurseSubDirs: true,
        includeBaseDirectory: includeBaseDirectory,
        onZipping: progress
            ? (fileName, isDirectory, progress) {
                ++onProgressCallCount1;
                debugPrint('Zip #1:');
                debugPrint('progress: ${progress.toStringAsFixed(1)}%');
                debugPrint('isDirectory: $isDirectory');
                return ZipFileOperation.includeItem;
              }
            : null,
      );
      assert(!progress || onProgressCallCount1 > 0);
    } on PlatformException catch (e) {
      debugPrint("$e");
    }
    return zipFile;
  }

  static Future<File> testZipFiles(
      {required bool includeBaseDirectory, required String fileName}) async {
    debugPrint("_appDataDir=${appDataDir.path}");
    final storeDir =
        Directory("${appDataDir.path}${"/$dataFilesBaseDirectoryName"}");

    final testFiles = createTestFiles(storeDir, fileName);

    final zipFile = createZipFile("testZipFiles.zip");
    debugPrint("Writing files to zip file: ${zipFile.path}");

    try {
      await ZipFile.createFromFiles(
          sourceDir: storeDir,
          files: testFiles,
          zipFile: zipFile,
          includeBaseDirectory: includeBaseDirectory);
    } on PlatformException catch (e) {
      debugPrint("$e");
    }
    return zipFile;
  }

  static Future testUnzip(File zipFile,
      {bool progress = false,
      bool zipIncludesBaseDirectory = false,
      required String fileName}) async {
    debugPrint("_appDataDir=${appDataDir.path}");

    final destinationDir = Directory("${appDataDir.path}/unzip");

    if (destinationDir.existsSync()) {
      debugPrint("Deleting existing unzip directory: ${destinationDir.path}");
      destinationDir.deleteSync(recursive: true);
    }

    debugPrint("Extracting zip to directory: ${destinationDir.path}");
    destinationDir.createSync();
    // test concurrent extraction
    final extractFutures = <Future>[];
    int onExtractingCallCount1 = 0;
    int onExtractingCallCount2 = 0;
    try {
      extractFutures.add(ZipFile.extractToDirectory(
          zipFile: zipFile,
          destinationDir: destinationDir,
          onExtracting: progress
              ? (zipEntry, progress) {
                  ++onExtractingCallCount1;
                  debugPrint('Extract #1:');
                  debugPrint('progress: ${progress.toStringAsFixed(1)}%');
                  debugPrint('isDirectory: ${zipEntry.isDirectory}');
                  debugPrint(
                      'modificationDate: ${zipEntry.modificationDate!.toLocal().toIso8601String()}');
                  debugPrint('uncompressedSize: ${zipEntry.uncompressedSize}');
                  debugPrint('compressedSize: ${zipEntry.compressedSize}');
                  debugPrint(
                      'compressionMethod: ${zipEntry.compressionMethod}');
                  debugPrint('crc: ${zipEntry.crc}');
                  return ZipFileOperation.includeItem;
                }
              : null));

      await Future.wait<void>(extractFutures);
      assert(onExtractingCallCount1 == onExtractingCallCount2);
      assert(!progress || onExtractingCallCount1 > 0);
    } on PlatformException catch (e) {
      debugPrint("$e");
    }

    // verify unzipped files
    if (zipIncludesBaseDirectory) {
      _verifyFiles(
          Directory("${destinationDir.path}/$dataFilesBaseDirectoryName"),
          fileName);
    } else {
      _verifyFiles(destinationDir, fileName);
    }
  }

  static File createZipFile(String fileName) {
    final zipFilePath = "${appDataDir.path}/$fileName";
    final zipFile = File(zipFilePath);

    if (zipFile.existsSync()) {
      debugPrint("Deleting existing zip file: ${zipFile.path}");
      zipFile.deleteSync();
    }
    return zipFile;
  }

  static List<File> createTestFiles(Directory storeDir, String fileName) {
    if (storeDir.existsSync()) {
      storeDir.deleteSync(recursive: true);
    }
    storeDir.createSync();
    final files = <File>[];
    final file = File("${storeDir.path}/$fileName");
    file.createSync(recursive: true);
    debugPrint("Writing file: ${file.path}");
    file.writeAsStringSync(fileName);
    files.add(file);

    // verify created files
    _verifyFiles(storeDir, fileName);

    return files;
  }

  static void _verifyFiles(Directory filesDir, String fileName) {
    debugPrint("Verifying files at: ${filesDir.path}");
    final extractedItems = filesDir.listSync(recursive: true);
    for (final item in extractedItems) {
      debugPrint("extractedItem: ${item.path}");
    }
    assert(extractedItems.whereType<File>().length == 1,
        "Invalid number of files");
    final file = File('${filesDir.path}/$fileName');
    debugPrint("Verifying file: ${file.path}");
    assert(file.existsSync(), "File not found: ${file.path}");
    final content = file.readAsStringSync();
    assert(content == fileName, "Invalid file content: ${file.path}");
    debugPrint("All files ok");
  }
}
