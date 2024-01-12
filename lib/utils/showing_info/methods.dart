import 'package:flutter/material.dart';

void fieldFocusChange(
    {required BuildContext context,
    required FocusNode currentFocus,
    required FocusNode nextFocus}) {
  currentFocus.unfocus();
  FocusScope.of(context).requestFocus(nextFocus);
}
