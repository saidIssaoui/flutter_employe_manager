import 'package:flutter/material.dart';
import 'package:mobile_app/components/text_field_show_container.dart';

class RoundedShwoField extends StatelessWidget {
  final String hintText;
  final dynamic icon;
  final IconData preicon;
  final ValueChanged<String> onChanged;
  const RoundedShwoField({
    Key? key,
    required this.hintText,
    required this.icon,
    required this.preicon,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldShowContainer(
      child: TextField(
        controller: TextEditingController(text: hintText),
        onChanged: onChanged,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          icon: icon,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
