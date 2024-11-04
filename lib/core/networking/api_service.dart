import 'package:dio/dio.dart';
import 'package:roadapp/core/networking/api_constants.dart';
import 'package:roadapp/features/auth/data/models/login_request_body.dart';
import 'package:roadapp/features/auth/data/models/login_response.dart';
import 'package:roadapp/features/auth/data/models/client_register_request_body.dart';
import 'package:roadapp/features/auth/data/models/client_register_response.dart';
import 'package:roadapp/features/auth/data/models/provider_register_request_body.dart';
import 'package:roadapp/features/auth/data/models/provider_register_response.dart';
import 'package:roadapp/features/password_recovery/data/model/get_code_request_body.dart';
import 'package:roadapp/features/password_recovery/data/model/send_code_reset_response.dart';
import 'package:roadapp/features/password_recovery/data/model/send_code_response.dart';
import 'package:roadapp/features/password_recovery/data/model/send_email_response.dart';
import 'package:roadapp/features/password_recovery/data/model/verify_email_request_body.dart';
import 'package:roadapp/features/password_recovery/data/model/verify_email_reset_request_body.dart';
import 'package:roadapp/features/vehicles/data/models/add_vehicle_request_body.dart';
import 'package:roadapp/features/vehicles/data/models/add_vehicle_response.dart';
import 'package:roadapp/features/vehicles/data/models/brands_response.dart';
import 'package:roadapp/features/vehicles/data/models/vehicles_response.dart';
import 'package:retrofit/retrofit.dart';
part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstants.login)
  Future<LoginResponse> login(@Body() LoginRequestBody loginRequestBody);

  @POST(ApiConstants.clientSignUp)
  Future<ClientRegisterResponse> clientRegister(
      @Body() ClientRegisterRequestBody requestBody);

  @POST(ApiConstants.providerSignUp)
  Future<ProviderRegisterResponse> providerRegister(
      @Body() ProviderRegisterRequestBody requestBody);

  @POST(ApiConstants.verifyEmail)
  Future<SendCodeResponse> verifyEmail(
      @Header("Authorization") String token,
      @Body() VerifyEmailRequestBody body);

  @POST(ApiConstants.verifyResetPassword)
  Future<SendCodeResetResponse> verifyEmailToReset(
      @Body() VerifyEmailResetRequestBody body);

  @POST(ApiConstants.resetPassword)
  Future<SendEmailResponse> getCode(
      @Body() GetCodeRequestBody body);

  @GET(ApiConstants.vehicles)
  Future<VehiclesResponse> fetchVehicles(
      @Header("Authorization") String token);

  @GET(ApiConstants.vehiclesBrands)
  Future<BrandsResponse> fetchBrands(
      @Header("Authorization") String token);

  @POST(ApiConstants.createVehicle)
  Future<AddVehicleResponse> addVehicle(
      @Header("Authorization") String token,
      @Body() AddVehicleRequestBody body);

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