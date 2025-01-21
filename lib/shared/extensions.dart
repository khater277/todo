import 'package:flutter/material.dart';

import 'constants.dart';

extension DatePicker on BuildContext {
  Future<DateTime?> datePicker(
      {required DateTime initialDate, DateTime? startDate, DateTime? endDate}) {
    return showDatePicker(
      context: this,
      initialDate: initialDate,
      firstDate: startDate ?? DateTime.now(),
      lastDate: endDate ?? DateTime.now().add(const Duration(days: 365 * 10)),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: pink,
            colorScheme: const ColorScheme.light(
              primary: pink,
              surfaceTint: Colors.white,
            ),
            buttonTheme: const ButtonThemeData(
              textTheme: ButtonTextTheme.primary,
            ),
          ),
          child: child!,
        );
      },
    );
  }
}
