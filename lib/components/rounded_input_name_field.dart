import 'package:flutter/material.dart';
import 'package:mobile_app/components/text_field_name_container.dart';

class RoundedInptNameField extends StatefulWidget {
  final String hintText;
  final ValueChanged<String> onChanged;
  const RoundedInptNameField({
    Key? key,
    required this.hintText,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<RoundedInptNameField> createState() => _RoundedInptNameFieldState();
}

class _RoundedInptNameFieldState extends State<RoundedInptNameField> {
  @override
  Widget build(BuildContext context) {
    return TextFieldNameContainer(
      child: TextField(
        textAlign: TextAlign.start,
        textAlignVertical: TextAlignVertical.center,
        onChanged: widget.onChanged,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          hintText: widget.hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
