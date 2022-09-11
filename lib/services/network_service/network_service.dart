import 'package:dio/dio.dart';
import 'interceptor.dart';

class NetworkService {
  /// Base Url */
  static bool isTester = true;
  static String SERVER_DEVELOPMENT = "https://coinranking1.p.rapidapi.com";

  /// Apis */
  static String API_LIST = "/coins";

  /// Headers */
  static Map<String, String> get headers {
    Map<String, String> headers = {
      'Accept': '*/*',
      'Content-Type': 'application/json',
      'Accept-Version': 'v1',
      'X-RapidAPI-Key': '30b03f6a28msh1aa528b4a94fbc8p16b49ejsnf86a15c15f1d',
    };
    return headers;
  }

  /// BaseOptions */
  static final BaseOptions _baseDioOptions = BaseOptions(
    baseUrl: SERVER_DEVELOPMENT,
    headers: headers,
    connectTimeout: 40000,
    receiveTimeout: 40000,
    contentType: 'application/json',
    responseType: ResponseType.json,
  );

  static final Dio _dio = Dio(_baseDioOptions)
    ..interceptors.add(DioInterceptor());

  /* Dio Requests */
  static Future GET() async {
    Map<String, dynamic> map = {};
    Response response =  await _dio.get(NetworkService.API_LIST, queryParameters: map);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.data;
    }
    return null;
  }
}
