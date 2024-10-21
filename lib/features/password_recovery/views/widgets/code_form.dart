import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';
import 'package:roadapp/core/Localization/app_localization.dart';
import 'package:roadapp/core/utils/string_manager.dart';
import 'package:roadapp/features/password_recovery/cubit/password_recovery_cubit.dart';
import 'package:roadapp/features/password_recovery/cubit/password_recovery_states.dart';

class CodeForm extends StatelessWidget {
  const CodeForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PasswordRecoveryCubit, PasswordRecoveryStates>(
      builder: (context, state) {
        var cubit = PasswordRecoveryCubit.get(context);
        return Form(
            key: cubit.codeFormKey,
            child: Directionality(
                textDirection: TextDirection.ltr,
                child: Pinput(
                    length: 4,
                    keyboardType: TextInputType.number,
                    defaultPinTheme: const PinTheme(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            border: Border(
                                bottom:
                                BorderSide(width: 1)))),
                    focusedPinTheme: const PinTheme(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            border: Border(
                                bottom:
                                BorderSide(width: 1)))),
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value == null ||
                          value
                              .trim()
                              .isEmpty) {
                        return StringManager.codeIsRequired
                            .tr(context);
                      }
                      if (value.length != 4) {
                        return StringManager.enter4Digits
                            .tr(context);
                      }
                      return null;
                    },
                    showCursor: true,
                    onCompleted: null)));
      },
    );
  }
}
