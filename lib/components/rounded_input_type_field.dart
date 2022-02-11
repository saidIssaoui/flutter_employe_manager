import 'package:flutter/material.dart';
import 'package:mobile_app/components/text_field_add_emp_container.dart';

class RoundedInputTypeField extends StatelessWidget {
  final String hintText;
  final ValueChanged<String> onChanged;
  const RoundedInputTypeField({
    Key? key,
    required this.hintText,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldAddEmpContainer(
      child: TextField(
        onChanged: onChanged,
        cursorColor: Colors.grey,
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
