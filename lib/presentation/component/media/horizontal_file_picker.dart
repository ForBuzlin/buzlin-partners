// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_archive/flutter_archive.dart';
import 'package:remixicon/remixicon.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/application/products/convert/convert_provider.dart';
import 'package:venderuzmart/infrastructure/services/archive_format.dart';
import 'package:venderuzmart/presentation/styles/style.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:file_picker/file_picker.dart';
import '../buttons/animation_button_effect.dart';

class HorizontalFilePicker extends ConsumerStatefulWidget {
  const HorizontalFilePicker({super.key}) ;

  @override
  ConsumerState<HorizontalFilePicker> createState() =>
      _HorizontalFilePickerState();
}

class _HorizontalFilePickerState extends ConsumerState<HorizontalFilePicker> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(convertProvider);
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: REdgeInsets.only(left: 4),
            child: Text(
              AppHelpers.getTranslation(TrKeys.digitalProduct),
              style: Style.interNormal(),
            ),
          ),
          6.verticalSpace,
          Container(
              height: 164.h,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24.r),
              ),
              child: ButtonEffectAnimation(
                onTap: () async {
                  FilePickerResult? result;
                  try {
                    result = await FilePicker.platform.pickFiles();
                    if (result?.files.first.path != null) {
                      if (result?.files.first.path != null) {
                        File zipFile = await convertToZip(
                          fileName: result?.files.first.name ?? '',
                        );
                        debugPrint(zipFile.path);
                        ref.read(convertProvider.notifier)
                          ..setFile(zipFile)
                          ..setName(result?.files.first.name ?? '');
                      }
                    }
                  } catch (e, s) {
                    debugPrint('===> trying to select file $e $s');
                  }
                },
                child: Container(
                  width: double.infinity,
                  height: 180.h,
                  decoration: BoxDecoration(
                    color: Style.white,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  padding: REdgeInsets.symmetric(vertical: 8),
                  child: state.progress == 0
                      ? Column(
                          children: [
                            12.verticalSpace,
                            Icon(
                              Remix.upload_cloud_2_line,
                              color: Style.primary,
                              size: 36.r,
                            ),
                            16.verticalSpace,
                            Text(
                              AppHelpers.getTranslation(TrKeys.digital),
                              style: Style.interSemi(
                                size: 14,
                                color: Style.black,
                                letterSpacing: -0.3,
                              ),
                            ),
                            Text(
                              AppHelpers.getTranslation(TrKeys.recommendedSize),
                              style: Style.interRegular(
                                size: 14,
                                color: Style.black,
                                letterSpacing: -0.3,
                              ),
                            )
                          ],
                        )
                      : Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              4.verticalSpace,
                              CircularPercentIndicator(
                                animation: true,
                                radius: 56.r,
                                lineWidth: 4.0,
                                percent: state.progress / 100,
                                center: Text(state.progress.toString()),
                                progressColor: Style.primary,
                                footer: Column(
                                  children: [
                                    4.verticalSpace,
                                    Padding(
                                      padding:
                                          REdgeInsets.symmetric(horizontal: 16),
                                      child: AutoSizeText(
                                        state.name ?? " ",
                                        style: Style.interNormal(size: 15.r),
                                        maxLines: 1,
                                        minFontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                ),
              )),
        ],
      ),
    );
  }

  Future<File> convertToZip(
      {bool includeBaseDirectory = false, required String fileName}) async {
    debugPrint("_appDataDir=${ArchiveFormat.appDataDir.path}");
    final storeDir = Directory(
        "${ArchiveFormat.appDataDir.path}${"/${ArchiveFormat.dataFilesBaseDirectoryName}"}");
    ArchiveFormat.createTestFiles(storeDir, fileName);
    final zipFile = ArchiveFormat.createZipFile("digital.zip");
    debugPrint("Writing to zip file: ${zipFile.path}");
    int onProgressCallCount1 = 0;
    try {
      await ZipFile.createFromDirectory(
          sourceDir: storeDir,
          zipFile: zipFile,
          recurseSubDirs: true,
          includeBaseDirectory: includeBaseDirectory,
          onZipping: (fileName, isDirectory, progress) {
            ++onProgressCallCount1;
            debugPrint('Zip #1:');
            ref.read(convertProvider.notifier).changeProgress(progress);
            debugPrint('progress: ${progress.toStringAsFixed(1)}%');
            return ZipFileOperation.includeItem;
          });
      assert(onProgressCallCount1 > 0);
    } on PlatformException catch (e) {
      debugPrint("$e");
    }
    return zipFile;
  }
}
