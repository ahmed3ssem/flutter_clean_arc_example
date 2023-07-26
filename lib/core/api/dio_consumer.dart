import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_clean_arc_example/core/api/api_consumer.dart';
import 'package:flutter_clean_arc_example/core/api/app_interceptor.dart';
import 'package:flutter_clean_arc_example/injection_container.dart' as di;
import 'package:flutter_clean_arc_example/core/api/end_points.dart';
import 'package:flutter_clean_arc_example/core/api/status_code.dart';

class DioConsumer implements ApiConsumer{

  final Dio client;

  DioConsumer({required this.client}){
    (client.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate =
        (HttpClient dioClient) {
      dioClient.badCertificateCallback =
      ((X509Certificate cert, String host, int port) => true);
      return dioClient;
    };
    client.options
    ..baseUrl = EndPoints.baseUrl
    ..responseType = ResponseType.plain
    ..followRedirects = false
    ..validateStatus = (status){
      return status! < StatusCode.internalServerError;
    };
    client.interceptors.add(di.sl<AppInterceptor>());
    if(kDebugMode){
      client.interceptors.add(di.sl<LogInterceptor>());
    }
  }


  @override
  Future get(String path, {Map<String, dynamic>? queryParams}) {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  Future post(String path, {Map<String, dynamic>? queryParams, Map<String, dynamic>? body}) {
    // TODO: implement post
    throw UnimplementedError();
  }

  @override
  Future put(String path, {Map<String, dynamic>? queryParams, Map<String, dynamic>? body}) {
    // TODO: implement put
    throw UnimplementedError();
  }
  
}