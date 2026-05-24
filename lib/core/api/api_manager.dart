import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ApiManager {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: "https://movies-api.accel.li/api/v2/",
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      headers: {
        "Content-Type": "application/json",
      },
    ),
  );
}