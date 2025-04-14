import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:roadapp/features/contact_us/data/models/contact_us_request.dart';
import 'package:roadapp/features/contact_us/data/repo/contact_us_repo.dart';

part 'contact_us_state.dart';

class ContactUsCubit extends Cubit<ContactUsState> {
  ContactUsCubit(this._contactUsRepo) : super(ContactUsInitial());
  static ContactUsCubit get(context) => BlocProvider.of(context);
  final ContactUsRepo _contactUsRepo;

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController noteController = TextEditingController();
  final TextEditingController typeController = TextEditingController();

  final contactUsFormKey = GlobalKey<FormState>();

  String? selectedProblem = 'CUSTOMER_SERVICE';


  Future<void> addContactUs() async {
    emit(AddContactUsLoading());
    final response = await _contactUsRepo.contactUs(
        body: ContactUsRequest(
            name: firstNameController.text,
            phone: phoneController.text,
            email: emailController.text,
            note: noteController.text,
            type: selectedProblem!,
        ),
    );
    response.when(success: (creationResponse) async {
      emit(AddContactUsSuccess());
    }, failure: (error) {
      emit(AddContactUsError(
          error.apiErrorModel.message ?? 'Unknown Error!'));
    });
  }


  List<String> content = [];
  Future<void> fetchSupportsType() async {
    emit(SupportsTypeUsLoading());
    final response = await _contactUsRepo.fetchSupportTypes();
    response.when(success: (creationResponse) async {
      content = List<String>.from(creationResponse.data.content);
      if (content.isNotEmpty) {
        selectedProblem = content.first; // تعيين القيمة الافتراضية لأول عنصر
      }
      emit(SupportsTypeUsSuccess());
    }, failure: (error) {
      emit(SupportsTypeUsError(error.apiErrorModel.message ?? 'Unknown Error!'));
    });
  }


}
