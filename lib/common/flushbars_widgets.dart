import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

successFlush(
    {String title = '', String msg = '', required BuildContext context}) {
  return Flushbar(
    margin: const EdgeInsets.all(8),
    borderRadius: BorderRadius.circular(10),
    title: title,
    message: msg,
    icon: const Icon(
      Icons.check_circle_outline_rounded,
      size: 28.0,
      color: Colors.green,
    ),
    duration: const Duration(seconds: 3),
    leftBarIndicatorColor: Colors.green,
  )..show(context);
}

errorFlush(
    {String title = '', String msg = '', required BuildContext context}) {
  return Flushbar(
    margin: const EdgeInsets.all(8),
    borderRadius: BorderRadius.circular(10),
    title: title,
    message: msg,
    icon: const Icon(
      Icons.error,
      size: 28.0,
      color: Colors.red,
    ),
    duration: const Duration(seconds: 3),
    leftBarIndicatorColor: Colors.red,
  )..show(context);
}

socialTimerReminder({required BuildContext context}) {
  debugPrint('Social Timer Reminder');
  return Flushbar(
    flushbarPosition: FlushbarPosition.TOP,
    margin: const EdgeInsets.all(8),
    borderRadius: BorderRadius.circular(10),
    // title: title,
    message: "Just a heads up, You've got 1 minute of access left!",
    icon: const Icon(
      Icons.hourglass_bottom_rounded,
      size: 25.0,
      color: Colors.red,
    ),
    duration: const Duration(seconds: 5),
    leftBarIndicatorColor: Colors.red,
  )..show(context);
}
