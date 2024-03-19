import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_app/app/themes/app_colors.dart';
import 'package:real_estate_app/app/themes/app_text_field_themes.dart';
import 'package:real_estate_app/features/auth/widgets/custom_text_field.dart';

class DatePickerField extends StatefulWidget {
  DatePickerField({super.key, required this.hint, required this.controller});

  String hint;
  TextEditingController controller;

  @override
  State<DatePickerField> createState() => _DatePickerFieldState();
}

class _DatePickerFieldState extends State<DatePickerField> {
  bool isDatePicked = false;
  void setText(String value) {
    setState(() {
      widget.controller.text = value;
      isDatePicked = true;
    });
  }

  Future<void> selectDate(BuildContext context) async {
    DateTime selectedDate = DateTime.now(); // Initial date value

    final DateTime? picked = await showDatePicker(
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            // useMaterial3: true,
            appBarTheme: const AppBarTheme(),
            scaffoldBackgroundColor: Colors.white,
            buttonTheme: ButtonThemeData(
                colorScheme:
                    const ColorScheme.light(primary: AppColors.primaryColor)
                        .copyWith(secondary: AppColors.primaryColor),
                buttonColor: AppColors.primaryColor),
            textTheme: const TextTheme(
              titleLarge: TextStyle(
                color: AppColors.primaryColor, // Day text color
              ),
              bodyMedium: TextStyle(
                color: AppColors.primaryColor, // Year text color
              ),
            ),
            colorScheme:
                const ColorScheme.light(primary: AppColors.primaryColor)
                    .copyWith(secondary: AppColors.primaryColor),
          ),
          child: child!,
        );
      },
      context: context,

      initialDate: selectedDate,
      firstDate: DateTime(2000), // Adjust the range as needed
      lastDate: DateTime(2101), // Adjust the range as needed

      fieldHintText: widget.hint,
    );

    if (picked != null && picked != selectedDate) {
      // Date selected, do something with it
      selectedDate = picked;

      setText("${selectedDate.day}/${selectedDate.month}/${selectedDate.year}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      onTap: () => selectDate(context),
      controller: widget.controller,
      inputDecoration: AppTextFieldDecorations.genericInputDecoration(
          label: "Date of Birth"),
    );
  }
}
