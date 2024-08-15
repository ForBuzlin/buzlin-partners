import 'package:auto_route/auto_route.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:proste_indexed_stack/proste_indexed_stack.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/presentation/styles/style.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:venderuzmart/application/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import '../pages.dart';
import 'widgets/custom_bottom_bar.dart';

@RoutePage()
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<IndexedStackChild> list = [
    IndexedStackChild(child: const DashboardPage(), preload: true),
    IndexedStackChild(child: const SchedulePage(), preload: false),
    IndexedStackChild(child: const OrdersHomePage(), preload: false),
  ];
  List<IndexedStackChild> masterList = [
    IndexedStackChild(child: const DashboardPage(), preload: true),
    IndexedStackChild(child: const SchedulePage(), preload: false),
  ];

  @override
  void initState() {
    FirebaseMessaging.instance.requestPermission(
      sound: true,
      alert: true,
      badge: false,
    );
    FirebaseMessaging.onBackgroundMessage((RemoteMessage message) async {
      await Firebase.initializeApp();
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {});
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      AppHelpers.successSnackBar(
        context,
        text:
            "${AppHelpers.getTranslation(TrKeys.id)} #${message.notification?.title ?? ''} ${message.notification?.body ?? ''}",
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
      final state = ref.watch(mainProvider);
      final notifier = ref.read(mainProvider.notifier);
      return CustomScaffold(
        drawer: (colors) => Drawer(
          width: MediaQuery.sizeOf(context).width/1.5,
          backgroundColor: colors.transparent,
          child: const ProfilePage(),
        ),
        backgroundColor: state.selectedIndex == 4 ? Style.white : null,
        body: (c) => ProsteIndexedStack(
          index: state.selectedIndex,
          children: AppHelpers.getUserRole == TrKeys.master ? masterList : list,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: (colors) => CustomBottomBar(
            activeIndex: state.selectedIndex, onTap: notifier.selectIndex),
      );
    });
  }
}
