import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:venderuzmart/presentation/pages/initial/no_internet.dart';
import 'package:venderuzmart/presentation/styles/theme/theme/theme.dart';
import 'package:venderuzmart/presentation/styles/theme/theme/theme_wrapper.dart';
import 'helper/keyboard_dismisser.dart';

class CustomScaffold extends StatefulWidget {
  final Widget Function(CustomColorSet colors) body;
  final Widget? Function(CustomColorSet colors)? endDrawer;
  final Widget? Function(CustomColorSet colors)? floatingActionButton;
  final Widget? Function(CustomColorSet colors)? bottomNavigationBar;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final PreferredSizeWidget? Function(CustomColorSet colors)? appBar;
  final Widget? Function(CustomColorSet colors)? drawer;
  final Color? backgroundColor;
  final bool bgImage;
  final bool extendBody;

  const CustomScaffold(
      {super.key,
      required this.body,
      this.appBar,
      this.floatingActionButton,
      this.floatingActionButtonLocation,
      this.drawer,
      this.backgroundColor,
      this.bottomNavigationBar,
      this.bgImage = false,
      this.extendBody = false, this.endDrawer})
      ;

  @override
  State<CustomScaffold> createState() => _CustomScaffoldState();
}

class _CustomScaffoldState extends State<CustomScaffold>
    with WidgetsBindingObserver {
  StreamSubscription? connectivitySubscription;
  ValueNotifier<bool> isNetworkDisabled = ValueNotifier(false);

  void _checkCurrentNetworkState() {
    Connectivity().checkConnectivity().then((connectivityResult) {
      isNetworkDisabled.value = connectivityResult == ConnectivityResult.none;
    });
  }

  initStateFunc() {
    _checkCurrentNetworkState();
    connectivitySubscription = Connectivity().onConnectivityChanged.listen(
      (ConnectivityResult result) {
        isNetworkDisabled.value = result == ConnectivityResult.none;
      },
    );
  }

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    initStateFunc();
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      _checkCurrentNetworkState();
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    connectivitySubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        ThemeWrapper(builder: (colors, controller) {
          return KeyboardDismisser(
            child: Scaffold(
              extendBody: widget.extendBody,
              drawer: widget.drawer?.call(colors),
              endDrawer: widget.endDrawer?.call(colors),
              resizeToAvoidBottomInset: false,
              appBar: widget.appBar?.call(colors),
              backgroundColor: widget.backgroundColor ?? colors.backgroundColor,
              body: widget.body(colors),
              floatingActionButton: widget.floatingActionButton?.call(colors),
              floatingActionButtonLocation: widget.floatingActionButtonLocation,
              bottomNavigationBar: widget.bottomNavigationBar?.call(colors),
            ),
          );
        }),
        ValueListenableBuilder(
          valueListenable: isNetworkDisabled,
          builder: (_, bool networkDisabled, __) => Visibility(
            visible: networkDisabled,
            child: const NoInternetPage(),
          ),
        ),
      ],
    );
  }
}
