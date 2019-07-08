import 'dart:ui';

import 'package:flutter/widgets.dart';

class LifecycleEventHandler extends WidgetsBindingObserver {
  final Future<void> Function() inactiveCallBack;
  final Future<void> Function() pauseCallBack;
  final Future<void> Function() suspendingCallBack;
  final Future<void> Function() resumeCallBack;

  LifecycleEventHandler({this.inactiveCallBack, this.pauseCallBack, this.suspendingCallBack, this.resumeCallBack});

  @override
  Future<Null> didChangeAppLifecycleState(AppLifecycleState state) async {
    switch (state) {
      case AppLifecycleState.inactive:
        if (inactiveCallBack != null) {
          await inactiveCallBack();
        }
        break;
      case AppLifecycleState.paused:
        if (pauseCallBack != null) {
          await pauseCallBack();
        }
        break;
      case AppLifecycleState.suspending:
        if (suspendingCallBack != null) {
          await suspendingCallBack();
        }
        break;
      case AppLifecycleState.resumed:
        if (resumeCallBack != null) {
          await resumeCallBack();
        }
        break;
    }
  }
}

class MetricsChangeHandler extends WidgetsBindingObserver {
  @override
  void didChangeMetrics() {
    print("---------------------didChangeMetrics");
  }

  @override
  void didChangeTextScaleFactor() {
    print("---------------------didChangeTextScaleFactor");
  }

  @override
  void didChangePlatformBrightness() {
    print("---------------------didChangePlatformBrightness");
  }

  @override
  void didChangeAccessibilityFeatures() {
    print("---------------------didChangeAccessibilityFeatures");
  }
}

class LoacaleChangeHandler extends WidgetsBindingObserver {
  @override
  void didChangeLocales(List<Locale> locale) {
    print("---------------------didChangeLocales");
  }
}

class TransitionHandler extends WidgetsBindingObserver {
  Future<bool> didPopRoute() {
    print("---------------------didPopRoute");
    return super.didPopRoute();
  }

  Future<bool> didPushRoute(String route) {
    print("---------------------didPushRoute");
    return super.didPushRoute(route);
  }
}
