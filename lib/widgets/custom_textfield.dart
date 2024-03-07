import 'package:flutter/material.dart';

import '../constants/global_variables.dart';

class AuthTextField extends StatefulWidget {
  final String hintText;
  final Widget? suffixIcon;
  final String? prefixIcon;
  final bool? isObscure;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;

  const AuthTextField(
      {Key? key,
      required this.hintText,
      this.controller,
      this.suffixIcon,
      this.isObscure,
      this.prefixIcon,
      this.validator})
      : super(key: key);

  @override
  State<AuthTextField> createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextFormField(
        validator: widget.validator,
        obscureText: widget.isObscure ?? false,
        controller: widget.controller,
        cursorColor: Colors.black,
        autovalidateMode: AutovalidateMode.disabled,
        style: bodyNormal.copyWith(fontFamily: "MontserratSemiBold"),
        decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Colors.grey, // Make the border transparent
                width: 1, // Set the width to 0 to make it disappear
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Colors.grey, // Make the border transparent
                width: 1, // Set the width to 0 to make it disappear
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Colors.grey, // Make the border transparent
                width: 1, // Set the width to 0 to make it disappear
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Colors.grey, // Make the border transparent
                width: 1, // Set the width to 0 to make it disappear
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Colors.grey, // Make the border transparent
                width: 1, // Set the width to 0 to make it disappear
              ),
            ),
            hintText: widget.hintText,
            hintStyle: bodyNormal.copyWith(
                color: Colors.black54, fontFamily: "MontserratSemiBold"),
            suffixIcon: widget.suffixIcon,
            suffixIconColor: Colors.black,
            prefixIcon: widget.prefixIcon == null
                ? const Padding(
                    padding: EdgeInsets.only(left: 26.0),
                    child: SizedBox(),
                  )
                : Padding(
                    padding: const EdgeInsets.only(left: 26.0, right: 10),
                    child: SizedBox(
                      width: 10,
                      child: Image.asset(
                        widget.prefixIcon!,
                      ),
                    ),
                  ),
            prefixIconColor: Colors.white,
            prefixIconConstraints: const BoxConstraints(
              maxHeight: 30,
              minHeight: 30,
            )),
      ),
    );
  }
}

/// Text Field
class CustomTextField extends StatefulWidget {
  final String hintText;
  final bool readOnly;
  final Widget? suffixIcon;
  final String? prefixIcon;
  final bool? isObscure;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final FormFieldValidator<String>? validator;
  final onChanged;
  final String? suffixText;
  final String? prefixText;
  final int? maxLines;
  final Color? fillColor;

  const CustomTextField(
      {Key? key,
      required this.hintText,
      this.suffixIcon,
      this.isObscure,
      this.prefixIcon,
      this.validator,
      this.keyboardType,
      this.suffixText,
      this.prefixText,
      this.onChanged,
      this.readOnly = false,
      this.controller,
      this.fillColor,
      this.maxLines})
      : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextFormField(
        maxLines: widget.maxLines,
        textCapitalization: TextCapitalization.sentences,
        readOnly: widget.readOnly,
        keyboardType: widget.keyboardType,
        validator: widget.validator,
        autovalidateMode: AutovalidateMode.disabled,
        obscureText: widget.isObscure ?? false,
        controller: widget.controller,
        cursorColor: Colors.black,
        onChanged: widget.onChanged,
        style: bodyNormal.copyWith(fontFamily: "MontserratSemiBold"),
        decoration: InputDecoration(
            fillColor: widget.fillColor ?? Colors.white,
            filled: true,
            suffixText: widget.suffixText ?? '',
            prefixText: widget.prefixText ?? '',
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Colors.grey, // Make the border transparent
                width: 1, // Set the width to 0 to make it disappear
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Colors.grey, // Make the border transparent
                width: 1, // Set the width to 0 to make it disappear
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Colors.grey, // Make the border transparent
                width: 1, // Set the width to 0 to make it disappear
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Colors.grey, // Make the border transparent
                width: 1, // Set the width to 0 to make it disappear
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Colors.grey, // Make the border transparent
                width: 1, // Set the width to 0 to make it disappear
              ),
            ),
            hintText: widget.hintText,
            hintStyle: bodyNormal.copyWith(
                color: Colors.black54, fontFamily: "MontserratSemiBold"),
            suffixIcon: widget.suffixIcon,
            suffixIconColor: Colors.black,
            prefixIcon: widget.prefixIcon == null
                ? const Padding(
                    padding: EdgeInsets.only(left: 26.0),
                    child: SizedBox(),
                  )
                : Padding(
                    padding: const EdgeInsets.only(left: 26.0, right: 10),
                    child: SizedBox(
                      width: 16,
                      child: Image.asset(
                        widget.prefixIcon!,
                      ),
                    ),
                  ),
            prefixIconColor: Colors.white,
            prefixIconConstraints: const BoxConstraints(
              maxHeight: 30,
              minHeight: 30,
            )),
      ),
    );
  }
}
