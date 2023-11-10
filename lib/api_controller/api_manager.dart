import 'dart:convert';
import 'dart:developer';
import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutte_app/common/flushbars_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ApiManager {
  static bool showLog = true;

  Future<dynamic> callGetApi(BuildContext context, String webLink,
      bool showLoading, String token) async {
    if (showLoading) {
      showLoader(context, true);
    }

    Dio dio = Dio();
    try {
      final Response response;
      if (token == '') {
        response = await dio.get(webLink);
      } else {
        response = await dio.get(webLink,
            options: Options(headers: {'Authorization': token}));
      }
      var data = response.data;

      if (showLoading) {
        showLoader(context, false);
      }

      if (showLog) {
        log('\n\n**************************URL**************************\n\n$webLink\n\n');
        print(42);
        log('\n\n**************************RESPONSE**************************\n\n$data\n\n');
      }
      return data;
    } on DioError catch (error) {
      debugPrint('dio Error >> || $error');
      if (showLoading) {
        showLoader(context, false);
      }
      log(error.toString());
      if (DioErrorType.receiveTimeout == error.type ||
          DioErrorType.connectTimeout == error.type) {
        log('Server is not reachable. Please verify your internet connection and try again');
        errorFlush(
            context: context,
            title: "Server Unreachable",
            msg:
                "Server is not reachable. Please verify your internet connection and try again");
      } else if (DioErrorType.response == error.type) {
        if (error.response!.statusCode == 404) {
          log('Url is not found or Page is missing. Please check Url.');
        } else if (error.response!.statusCode == 500) {
          log('Internal Sever Error');
          errorFlush(
              context: context,
              title: "Server Unreachable",
              msg: "Internal Server Error");
        } else if (error.message.contains('SocketException')) {
          log('Please check your internet connection and try again');
          errorFlush(
              context: context,
              title: "Internet Unavailable",
              msg: "Please check your internet connection and try again");
        }
      }
    }
  }

  // Post API
  Future<dynamic> callPostApi(BuildContext context, String webLink,
      Object params, bool showLoading, String token) async {
    if (showLoading) {
      showLoader(context, true);
    }

    Dio dio = Dio();
    try {
      final Response response;
      if (token == '') {
        response = await dio.post(webLink,
            data: params,
            options: Options(headers: {'Content-Type': 'application/json'}));
      } else {
        response = await dio.post(webLink,
            data: params,
            options: Options(headers: {
              'Authorization': ' Bearer $token',
              //'Authorization': token,
              'Content-Type': 'application/json'
            }));
      }
      var data = response.data;
      debugPrint('data Response >>>>>> $data');
      if (showLoading) {
        showLoader(context, false);
      }
      if (showLog) {
        log('\n\n**************************URL**************************\n\n$webLink\n\n');
        log('\n\n**************************REQUESTS**************************\n\n${jsonEncode(params)}\n\n');
        log('\n\n**************************RESPONSE**************************\n\n$data\n\n');
      }
      return data;
    } on DioError catch (error) {
      if (showLoading) {
        showLoader(context, false);
      }
      debugPrint('DIO ERROR>>>> $error');
      // print(error);
      if (DioErrorType.receiveTimeout == error.type ||
          DioErrorType.connectTimeout == error.type) {
        log('Server is not reachable. Please verify your internet connection and try again');
        errorFlush(
            context: context,
            title: "Server Unreachable",
            msg:
                "Server is not reachable. Please verify your internet connection and try again");
      } else if (DioErrorType.response == error.type) {
        if (error.response!.statusCode == 404) {
          log('Url is not found or Page is missing. Please check Url.');
        } else if (error.response!.statusCode == 500) {
          log('Internal Sever Error');
          errorFlush(
              context: context,
              title: "Server Unreachable",
              msg: "Internal Server Error");
        } else if (error.message.contains('SocketException')) {
          log('Please check your internet connection and try again');
          errorFlush(
              context: context,
              title: "Server Unreachable",
              msg: "Internal Server Error");
        }
      }
    }
  }

  //Loader
  static void showLoader(BuildContext context, bool show) {
    if (show) {
      showDialog(
          barrierColor: Colors.black.withOpacity(0.0),
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                  child: Container(
                    width: 80.0,
                    height: 80.0,
                    decoration:
                        BoxDecoration(color: Colors.grey.withOpacity(0.3)),
                    child: const Center(
                      child: SpinKitFadingCircle(
                        color: Colors.red,
                        size: 60,
                      ),
                    ),
                  ),
                ),
              ),
            );
          });
    } else {
      Navigator.of(context, rootNavigator: true).pop('');
    }
  }
}
