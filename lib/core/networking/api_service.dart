import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:roadapp/core/networking/api_constants.dart';
import 'package:roadapp/features/auth/data/models/login_request_body.dart';
import 'package:roadapp/features/auth/data/models/login_response.dart';
part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstants.login)
  Future<LoginResponse> login(
      @Body() LoginRequestBody loginRequestBody,
      );
  // @POST(ApiConstants.verifyLogin)
  // Future<UserResponse> verifyLogin(
  //     @Body() OTPRequestBody otpRequestBody,
  //     );
  // @POST(ApiConstants.validateToken)
  // Future<SecondUserResponse> validateToken(
  //     @Header("Authorization") String token,
  //     );
  // @POST(ApiConstants.resetPasswordViaEmail)
  // Future<ResetPasswordResponse> resetPasswordViaEmail(
  //     @Body() ResetPasswordEmailBody resetPasswordEmailBody,
  //     );
  // @POST(ApiConstants.resetPasswordVerification)
  // Future<UserResponse> resetPasswordVerification(
  //     @Body() OTPRequestBody otpRequestBody,
  //     );
  // @POST(ApiConstants.newPassword)
  // Future<NewPasswordResponse> setNewPassword(
  //     @Header("Authorization") String token,
  //     @Body() NewPasswordRequestBody newPasswordRequestBody,
  //     );
  // @GET(ApiConstants.getAllClassRoomVisits)
  // Future<ClassVisitsResponse> getAllClassRoomVisits(
  //     @Header("Authorization") String token,
  //     @Path("schoolId") int? schoolId,
  //     );
}