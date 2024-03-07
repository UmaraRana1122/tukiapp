import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:tukiapp/constants/global_variables.dart';

class CustomDrop extends StatefulWidget {
  final List<String> options;
  final String hint;
  final Function(String) onChanged;

  CustomDrop({
    required this.options,
    required this.hint,
    required this.onChanged,
  });

  @override
  _CustomDropState createState() => _CustomDropState();
}

class _CustomDropState extends State<CustomDrop> {
  String? selectedOption;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: DropdownButton2<String>(
        underline: SizedBox(),
        value: selectedOption,
        isExpanded: true,
        hint: Text(
          widget.hint,
          style: bodyNormal.copyWith(
            fontSize: 10.sp,
            color: Colors.black54,
          ),
        ),
        buttonStyleData: ButtonStyleData(
          height: 5.h,
          width: 100.w,
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.grey,
            ),
          ),
        ),
        dropdownStyleData: DropdownStyleData(
          maxHeight: 25.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        onChanged: (String? newValue) {
          setState(() {
            selectedOption = newValue;
            widget.onChanged(newValue!);
          });
        },
        items: widget.options.map((String option) {
          return DropdownMenuItem<String>(
            value: option,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                option,
                style: bodyNormal.copyWith(
                  fontSize: 10.sp,
                  color: Colors.black54,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
