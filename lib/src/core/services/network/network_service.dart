// ignore_for_file: overridden_fields

import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import '../../../../src/core/mixins/show_bar.dart';
import '../../../core/services/network/response_parser.dart';
import '../../base/model/base_model.dart';
import '../../exports/constants_exports.dart';
import 'network_exception.dart';

class NetworkService with DioMixin, ShowBar {
  NetworkService._init() {
    httpClientAdapter = IOHttpClientAdapter();
    interceptors.add(
      InterceptorsWrapper(
        // gelen hatalara göre ne yapacağını burada belirliyoruz
        onError: NetworkException.instance.onError(),
      ),
    );
  }

  static NetworkService? _instance;

  static NetworkService? get instance {
    _instance ??= NetworkService._init();
    return _instance;
  }

  @override
  final BaseOptions options = BaseOptions(
    baseUrl: EndPointConstants.baseUrl,
    connectTimeout: const Duration(seconds: 30),
    sendTimeout: const Duration(seconds: 30),
  );

  Future<R?> send<T extends BaseModel?, R>(
    String path, {
    required HttpTypes type,
    // eğer geriye bir cevap dönmeyecekse bu kısmı null gönderiyoruz
    required T? parseModel,
    dynamic data,
    String? contentType,
    // pagination ile gelen liste elemanları varsa
    bool? isPagination,
    // baseUrl farklı ise burada değiştiriyoruz
    String? baseUrl,
    // access token yerine farklı token kullanılabilir
    String? token,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      options.baseUrl = baseUrl ?? EndPointConstants.baseUrl;
      final response = await request<dynamic>(
        path,
        data: data,
        options: Options(
          method: type.name,
          headers: {
            Headers.contentTypeHeader: contentType ?? Headers.jsonContentType,
          },
        ),
      );

      if (parseModel == null) {
        return null;
      }
      return responseParser<T, R>(parseModel as BaseModel<T>, response.data);
    } catch (error) {
      // Dio tarafında ya da sunucu tarafında bir hata yoksa burada oluşturuyoruz
      log('Network Service Request Error $error');
      showErrorBar(error, title: 'Error about app');
    }
    return null;
  }
}
