import 'package:flutter/material.dart';
import 'package:mobile_app/components/text_field_name_container.dart';

class RoundedInptNameEditField extends StatefulWidget {
  final controller;
  final hintText;
  final onChanged;
  const RoundedInptNameEditField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<RoundedInptNameEditField> createState() =>
      _RoundedInptNameEditFieldState();
}

class _RoundedInptNameEditFieldState extends State<RoundedInptNameEditField> {
  @override
  Widget build(BuildContext context) {
    return TextFieldNameContainer(
      child: TextFormField(
        key: Key(widget.controller.toString()),
        initialValue: widget.controller,
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
