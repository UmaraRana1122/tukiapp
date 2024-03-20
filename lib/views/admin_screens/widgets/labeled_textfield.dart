import 'package:flutter/material.dart';

import '../../../widgets/custom_textfield.dart';

class LabeledTextField extends StatelessWidget {
  final String heading;
  final String? Function(String?)? validator;
  final String hintText;

  const LabeledTextField({
    Key? key,
    required this.heading,
    this.validator,
    this.hintText = '', required bool readOnly, required TextEditingController controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 0,
        right: 0,
        bottom: 10.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            heading,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          CustomTextField(
            validator: validator,
            hintText: hintText,
          ),
        ],
      ),
    );
  }
}
