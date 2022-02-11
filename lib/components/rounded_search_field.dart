import 'package:flutter/material.dart';
import 'package:mobile_app/components/text_field_add_emp_container.dart';

class RoundedSearchField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const RoundedSearchField({
    Key? key,
    required this.hintText,
    this.icon = Icons.search,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldAddEmpContainer(
      child: TextField(
        onChanged: onChanged,
        cursorColor: Colors.grey,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: Colors.grey,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
