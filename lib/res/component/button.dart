import 'package:demo_app_provider/res/appColor.dart';
import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final bool loading;
  final VoidCallback onTap;
  const RoundButton(
      {super.key,
      required this.title,
      this.loading = false,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 40,
        width: 200,
        decoration: BoxDecoration(
            color: AppColors.buttonColor,
            borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: loading
              ? const CircularProgressIndicator(
                  color: AppColors.whiteColor,
                  strokeWidth: BorderSide.strokeAlignOutside,
                )
              : Text(
                  title,
                  style: TextStyle(
                    fontSize: 20,
                    color: AppColors.whiteColor,
                  ),
                ),
        ),
      ),
    );
  }
}
