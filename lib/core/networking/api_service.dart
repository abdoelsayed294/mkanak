
import 'package:dio/dio.dart';
import 'package:mkanak/core/networking/api_constants.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String? baseUrl}) = _ApiService;

  // @POST(ApiConstants.login)
  // Future<LoginResponseDto> login(@Body() LoginRequestDto body);
}
