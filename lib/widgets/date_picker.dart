import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import '../constants/global_variables.dart';

class DatePickerWidget extends StatefulWidget {
  final Function(DateTime?) onDateSelected;

  const DatePickerWidget({super.key, required this.onDateSelected});

  @override
  _DatePickerWidgetState createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          border: Border.all(color: Colors.grey, width: 0.7)),
      child: ListTile(
        leading: Text(
          selectedDate == null
              ? '14-08-2024'
              : DateFormat.yMMMd().format(selectedDate!),
          style: bodyNormal.copyWith(
            color: Colors.grey.shade600,
          ),
          textAlign: TextAlign.center,
        ), // Format the date
        trailing: Icon(
          Icons.calendar_month,
          color: Colors.grey.shade600,
          size: 16,
        ),
        onTap: () {
          _showDatePicker(context);
        },
      ),
    );
  }

  Future<void> _showDatePicker(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: AppColors.primaryColor, // Change primary color
            hintColor: AppColors.secondaryColor, // Change accent color
            colorScheme: const ColorScheme.light(
                primary: AppColors.buttonColor,
                background: Colors.black // Change background color
                ),
            buttonTheme:
                const ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
      });
      widget.onDateSelected(selectedDate); // Invoke the callback
    }
  }
}
