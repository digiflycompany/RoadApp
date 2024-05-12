import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadapp2/modules/password_recovery/cubit/password_recovery_states.dart';

class PasswordRecoveryCubit extends Cubit<PasswordRecoveryStates> {
  PasswordRecoveryCubit() : super(PasswordRecoveryInitState());



  var phoneController = TextEditingController();
  var emailController = TextEditingController();
}
