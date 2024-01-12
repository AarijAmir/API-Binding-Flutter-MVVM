import 'package:flutter/material.dart';
import 'package:flutter_api_mvvm/resources/colors/app_colors.dart';

class RoundButton extends StatelessWidget {
  const RoundButton(
      {super.key,
      required,
      this.isLoading = false,
      required this.onPress,
      required this.title});
  final String title;
  final bool isLoading;
  final void Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: 40,
        width: 200,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: (isLoading)
              ? const Center(
                  child: SizedBox(
                    height: 30,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      value: 1,
                    ),
                  ),
                )
              : Text(
                  title,
                  style: const TextStyle(
                    color: whiteColor,
                  ),
                ),
        ),
      ),
    );
  }
}
