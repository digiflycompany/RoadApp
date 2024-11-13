import 'package:flutter/cupertino.dart';
import 'package:roadapp/core/widgets/custom_button.dart';

class ShowMoreButton extends StatelessWidget {
  const ShowMoreButton({super.key, required this.onTap, required this.widget});
  final Function onTap;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return CustomElevatedButton(onTap: onTap, widget: widget);
  }
}
