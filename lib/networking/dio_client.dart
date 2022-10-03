import 'package:dio/dio.dart';

import 'logging_interceptor.dart';

class DioClient {
 // static final Dio dio = Dio();
 static final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://fakestoreapi.com',
      connectTimeout: 5000,
      receiveTimeout: 3000,
    ),
  )..interceptors.add(Logging());
}