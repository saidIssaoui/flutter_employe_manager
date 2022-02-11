import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:mobile_app/components/text_field_add_user.dart';

class RoundedMailField extends StatefulWidget {
  final ValueChanged<String> onChanged;

  final hintText;
  final color;
  final icon;
  const RoundedMailField({
    Key? key,
    required this.hintText,
    required this.icon,
    required this.onChanged,
    required this.color,
  }) : super(key: key);

  @override
  State<RoundedMailField> createState() => _RoundedMailFieldState();
}

class _RoundedMailFieldState extends State<RoundedMailField> {
  bool visible = true;
  @override
  Widget build(BuildContext context) {
    if (widget.hintText == 'Mot de Pass') {
      return TextFieldAddUser(
        child: TextField(
          obscureText: visible,
          onChanged: widget.onChanged,
          cursorColor: Colors.black,
          decoration: InputDecoration(
            hintText: widget.hintText,
            suffixIcon: IconButton(
              onPressed: () => {
                setState(() {
                  visible = !visible;
                })
              },
              icon: (visible)
                  ? Icon(
                      IconlyLight.show,
                      color: widget.color,
                    )
                  : Icon(
                      IconlyLight.hide,
                      color: widget.color,
                    ),
            ),
            suffixIconColor: widget.color,
            border: InputBorder.none,
          ),
        ),
      );
    } else {
      return TextFieldAddUser(
        child: TextField(
          obscureText: false,
          onChanged: widget.onChanged,
          cursorColor: Colors.black,
          decoration: InputDecoration(
            hintText: widget.hintText,
            suffixIcon: widget.icon,
            suffixIconColor: widget.color,
            border: InputBorder.none,
          ),
        ),
      );
    }
  }
}
