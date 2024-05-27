import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadapp/modules/vendor_center_details/cubit/vendor_center_details_states.dart';


class VendorCenterDetailsCubit
    extends Cubit<VendorCenterDetailsStates> {
  VendorCenterDetailsCubit(this.context)
      : super(VendorCenterDetailsInitStates());

  final BuildContext context;

}
