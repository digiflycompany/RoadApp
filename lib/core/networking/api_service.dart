import 'package:dio/dio.dart';
import 'package:roadapp/core/networking/api_constants.dart';
import 'package:roadapp/features/account/data/models/account_response.dart';
import 'package:roadapp/features/account/data/models/update_profile_request_body.dart';
import 'package:roadapp/features/account/data/models/update_profile_response.dart';
import 'package:roadapp/features/auth/data/models/login_request_body.dart';
import 'package:roadapp/features/auth/data/models/login_response.dart';
import 'package:roadapp/features/auth/data/models/client_register_request_body.dart';
import 'package:roadapp/features/auth/data/models/client_register_response.dart';
import 'package:roadapp/features/auth/data/models/provider_register_request_body.dart';
import 'package:roadapp/features/auth/data/models/provider_register_response.dart';
import 'package:roadapp/features/business_models/data/models/product_request_body.dart';
import 'package:roadapp/features/calendar/data/models/add_memo_request_body.dart';
import 'package:roadapp/features/calendar/data/models/add_memo_response.dart';
import 'package:roadapp/features/calendar/data/models/memos_response.dart';
import 'package:roadapp/features/favorite/data/models/add_to_fav_response.dart';
import 'package:roadapp/features/favorite/data/models/fav_response.dart';
import 'package:roadapp/features/favorite/data/models/unfav_response.dart';
import 'package:roadapp/features/fuel_consuming_rate/data/model/add_rate_request_body.dart';
import 'package:roadapp/features/fuel_consuming_rate/data/model/add_rate_response.dart';
import 'package:roadapp/features/fuel_consuming_rate/data/model/fuel_rates_response.dart';
import 'package:roadapp/features/home/data/models/ads_response.dart';
import 'package:roadapp/features/home/data/models/country_model.dart';
import 'package:roadapp/features/maintenance_center_details/data/models/booking_product_request.dart';
import 'package:roadapp/features/notification/data/models/notificaton_response.dart';
import 'package:roadapp/features/password_recovery/data/model/get_code_request_body.dart';
import 'package:roadapp/features/password_recovery/data/model/send_code_reset_response.dart';
import 'package:roadapp/features/password_recovery/data/model/send_code_response.dart';
import 'package:roadapp/features/password_recovery/data/model/send_email_response.dart';
import 'package:roadapp/features/password_recovery/data/model/verify_email_request_body.dart';
import 'package:roadapp/features/password_recovery/data/model/verify_email_reset_request_body.dart';
import 'package:roadapp/features/reserve_appointment/data/models/reservations_response.dart';
import 'package:roadapp/features/spare_parts_center_details/data/models/booking_spare_parts.dart';
import 'package:roadapp/features/vehicles/data/models/add_vehicle_request_body.dart';
import 'package:roadapp/features/vehicles/data/models/add_vehicle_response.dart';
import 'package:roadapp/features/vehicles/data/models/brands_response.dart';
import 'package:roadapp/features/vehicles/data/models/vehicles_response.dart';
import 'package:retrofit/retrofit.dart';
import '../../features/business_models/data/models/maintenance_response_model.dart';
import '../../features/business_models/data/models/product_response.dart';
import '../../features/business_models/data/models/profile_data_response.dart';
import '../../features/business_models/data/models/receipt_request_body.dart';
import '../../features/business_models/data/models/request_examination_body.dart';
import '../../features/business_models/data/models/response_examination.dart';
import '../../features/maintenance _report/data/models/list_reports_model.dart';
import '../../features/maintenance_centers/data/models/maintenance_center_model.dart';
import '../../features/maintenance_service/data/models/maintenance_service_model.dart';
import '../../features/road_services/data/models/road_service_model.dart';
import '../../features/maintenance _report/data/models/report_request.dart';
import '../../features/search/data/models/car_brand_model.dart';
import '../../features/search/data/models/countries_model.dart';
import '../../features/spare_parts/data/models/produt_response.dart';
import '../../features/spare_parts_centers/presentation/data/models/spare_parts_center_response.dart';

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
  Future<SendCodeResponse> verifyEmail(@Header("Authorization") String token,
      @Body() VerifyEmailRequestBody body);

  @POST(ApiConstants.verifyResetPassword)
  Future<SendCodeResetResponse> verifyEmailToReset(
      @Body() VerifyEmailResetRequestBody body);

  @POST(ApiConstants.resetPassword)
  Future<SendEmailResponse> getCode(@Body() GetCodeRequestBody body);

  @GET(ApiConstants.vehicles)
  Future<VehiclesResponse> fetchVehicles(@Header("Authorization") String token,
      @Query("page") int page, @Query("limit") int limit);

  @GET(ApiConstants.vehiclesBrands)
  Future<BrandsResponse> fetchBrands(@Header("Authorization") String token);

  @GET(ApiConstants.profile)
  Future<AccountResponse> fetchAccount(@Header("Authorization") String token);

  @POST(ApiConstants.createVehicle)
  Future<AddVehicleResponse> addVehicle(@Header("Authorization") String token,
      @Body() AddVehicleRequestBody body);

  @POST(ApiConstants.unfavoritize)
  Future<UnFavResponse> unFav(
      @Header("Authorization") String token, @Query("itemId") String adId);

  @POST(ApiConstants.favoritize)
  Future<AddToFavResponse> addToFav(
      @Header("Authorization") String token, @Query("itemId") String adId);

  @POST(ApiConstants.createDiary)
  Future<AddMemoResponse> addMemo(
      @Header("Authorization") String token, @Body() AddMemoRequestBody body);

  @POST(ApiConstants.createRide)
  Future<AddRateResponse> addRate(
      @Header("Authorization") String token, @Body() AddRateRequestBody body);

  @PUT(ApiConstants.updateProfile)
  Future<UpdateProfileResponse> updateProfile(
      @Header("Authorization") String token,
      @Body() UpdateProfileRequestBody requestBody);

  @GET(ApiConstants.favAds)
  Future<FavResponse> fetchFavAds(@Header("Authorization") String token);

  @GET(ApiConstants.diaries)
  Future<MemosResponse> fetchMemos(
      @Header("Authorization") String token,
      @Query("sortBy") String? order,
      @Query("page") int page,
      @Query("limit") int limit);

  @GET(ApiConstants.getReportsList)
  Future<ReportResponse> getReportsList(
    @Header("Authorization") String token,
    @Query("vehicleId") String parameterValue,
    @Query("page") int page,
    @Query("limit") int limit,
  );

  @POST(ApiConstants.postReportsList)
  Future<ReportRequest> addReport(
    @Header("Authorization") String token,
    @Body() ReportRequest body,
  );

  @GET(ApiConstants.bookings)
  Future<ReservationsResponse> fetchReservations(
      @Header("Authorization") String token,
      @Query("page") int page,
      @Query("limit") int limit);

  @GET(ApiConstants.rides)
  Future<FuelRatesResponse> fetchFuelRates(
      @Header("Authorization") String token,
      @Query("page") int page,
      @Query("limit") int limit);

  @GET(ApiConstants.countries)
  Future<CountriesModel> fetchCountries(@Header("Authorization") String token,
      @Query("page") int page, @Query("limit") int limit);

  @GET(ApiConstants.carBrand)
  Future<CarBrandModel> fetchCarBrand(@Header("Authorization") String token,
      @Query("page") int page, @Query("limit") int limit);

  @GET(ApiConstants.getRoadService)
  Future<RoadServicesResponse> getRoadService(
      @Header("Authorization") String token,
      @Query("type") String type,
      @Query("page") int page,
      @Query("limit") int limit);

  @GET(ApiConstants.getNotification)
  Future<NotificationResponse> getNotification(
      @Header("Authorization") String token,
      @Query("page") int page,
      @Query("limit") int limit);

  @GET('${ApiConstants.countries}/{countryId}')
  Future<CountryModel> getCountryById(
      @Header("Authorization") String token, @Path("countryId") String? id);

  @GET(ApiConstants.getMaintenanceServiceType)
  Future<ServiceTypeResponse> fetchMaintenanceServiceType(
    @Header("Authorization") String token,
    @Query("page") int page,
    @Query("limit") int limit,
  );

  @GET(ApiConstants.getMaintenanceServiceType)
  Future<ServiceTypeResponse> searchMaintenanceServiceType(
    @Header("Authorization") String token,
    @Query("searchField") String searchField,
    @Query("page") int page,
    @Query("limit") int limit,
  );

  @GET(ApiConstants.getMaintenanceServiceCenter)
  Future<MaintenanceCenterModel> fetchMaintenanceCenter(
    @Header("Authorization") String token,
    @Query("brandId") String brandId,
    @Query("typeId") String typeId,
    @Query("sortBy") String sortBy,
    @Query("sortOrder") String sortOrder,
    @Query("page") int page,
    @Query("limit") int limit,
  );

  @POST(ApiConstants.createBooking)
  Future<BookingProductRequest> createBooking(
    @Header("Authorization") String token,
    @Body() BookingProductRequest body,
  );

  @GET(ApiConstants.getSparePartsType)
  Future<ProductResponse> fetchSparePartsType(
    @Header("Authorization") String token,
    @Query("searchField") String searchField,
    @Query("page") int page,
    @Query("limit") int limit,
  );

  @GET(ApiConstants.getSparePartsCenter)
  Future<SparePartsCenterResponse> fetchSparePartsCenter(
    @Header("Authorization") String token,
    @Query("typeId") String typeId,
    @Query("sortBy") String sortBy,
    @Query("sortOrder") String sortOrder,
    @Query("page") int page,
    @Query("limit") int limit,
  );

  @POST(ApiConstants.createBooking)
  Future<BookingSpareParts> createBookingSpareParts(
    @Header("Authorization") String token,
    @Body() BookingSpareParts body,
  );

  @GET(ApiConstants.ads)
  Future<AdsResponse> fetchAds(@Header("Authorization") String token,
      @Query("page") int page, @Query("limit") int limit);

  @GET(ApiConstants.getProduct)
  Future<SparePartsCenterResponse> fetchProduct(
    @Header("Authorization") String token,
    @Query("maintenanceCenterId") String maintenanceCenterId,
    @Query("page") int page,
    @Query("limit") int limit,
  );

  @GET(ApiConstants.getMaintenanceCenter)
  Future<MaintenanceResponse> getAllMaintenanceCenter(
    @Header("Authorization") String token,
    @Query("page") int page,
    @Query("limit") int limit,
  );

  @GET(ApiConstants.getProfileData)
  Future<UserResponse> getProfileData(
    @Header("Authorization") String token,
  );

  @POST(ApiConstants.addPaymentVoucher)
  Future<ProductAddResponse> addPaymentVoucher(
    @Header("Authorization") String token,
    @Body() ProductRequestBody body,
  );

  @POST(ApiConstants.addReceiptVoucher)
  Future<ProductAddResponse> addReceiptVoucher(
    @Header("Authorization") String token,
    @Body() ReceiptRequestBody body,
  );

  @POST(ApiConstants.addBillOfSellVoucher)
  Future<ProductAddResponse> addBillOfSellVoucher(
      @Header("Authorization") String token,
      @Body() ProductRequestBody body,
      );

  @POST(ApiConstants.addFullScanReport)
  Future<ExaminationResponse> addFullScanReport(
      @Header("Authorization") String token,
      @Body() RequestExaminationBody body,
      );
}
