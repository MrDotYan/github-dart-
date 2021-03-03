import 'dart:convert';

import 'package:dio/dio.dart';

Dio dio = new Dio();

class HttpUtils {
  HttpUtils() {
    // 在构造函数里面添加拦截器
    dio.interceptors.add(CustomInterceptors());
  }

  Future get(path, query) async {
    Response resp;
    try {
      resp = await dio.get(path, queryParameters: query);

      if (resp.statusCode == 200) {
        String val = resp.toString();
        return jsonDecode(val);
      } else {
        String val = resp.toString();
        return jsonDecode(val);
      }
    } catch (error) {
      return error;
    }
  }

  Future post(path, data) async {
    Response resp;
    try {
      resp = await dio.post(path, data: data);
      if (resp.statusCode == 200) {
        String val = resp.toString();
        return jsonDecode(val);
      } else {
        String val = resp.toString();
        return jsonDecode(val);
      }
    } catch (error) {
      return error;
    }
  }

  Future put(path, data) async {
    Response resp;
    try {
      resp = await dio.put(path, data: data);
      if (resp.statusCode == 200) {
        String val = resp.toString();
        return jsonDecode(val);
      } else {
        String val = resp.toString();
        return jsonDecode(val);
      }
    } catch (error) {
      return error;
    }
  }
}

Future getToken() async {
  return 'asdksfksdfdk';
}

class CustomInterceptors extends InterceptorsWrapper {
  @override
  Future onRequest(RequestOptions options) async {
    final token = await getToken();
    options.connectTimeout = 30000;
    options.receiveTimeout = 30000;

    options.headers["Authorization"] = "Bearer $token";
    options.headers['content-type'] = "application/x-www-form-urlencoded";
    print('------------------------请求开始------------------------');
    print('- 请求方式：${options?.method}');
    print('- 请求数据: ${options?.data}');
    print('- 请求头信息：${options.headers}');
    return super.onRequest(options);
  }

  @override
  Future onResponse(Response response) {
    print('------------------------请求结束------------------------');
    return super.onResponse(response);
  }

  @override
  Future onError(DioError err) {
    print('------------------------请求出错------------------------');
    print('- 错误类型：${err.type}');
    print('- 错误信息：${err.message}');
    print('- error: $err');
    return super.onError(err);
  }
}
