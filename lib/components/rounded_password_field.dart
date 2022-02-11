import 'package:flutter/material.dart';
import '../../components/text_field_container.dart';
import '../constants.dart';

class RoundedPasswordField extends StatefulWidget {
  final ValueChanged<String> onChanged;

  const RoundedPasswordField({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<RoundedPasswordField> createState() => _RoundedPasswordFieldState();
}

class _RoundedPasswordFieldState extends State<RoundedPasswordField> {
  bool visible = true;

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: visible,
        onChanged: widget.onChanged,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          hintText: "Password",
          icon: const Icon(
            Icons.lock,
            color: kPrimaryBottonColor,
          ),
          suffixIcon: IconButton(
            onPressed: () => {
              setState(() {
                visible = !visible;
              })
            },
            icon: (!visible)
                ? const Icon(
                    Icons.visibility_off,
                    color: kPrimaryBottonColor,
                  )
                : const Icon(
                    Icons.visibility,
                    color: kPrimaryBottonColor,
                  ),
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
