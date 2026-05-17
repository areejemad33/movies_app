import 'package:dio/dio.dart';

class ApiManager {
  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: "https://movies-api.accel.li/api/v2/",
    ),
  );
}