import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_app/components/text_field_add_image.dart';

class RoundedImageField extends StatefulWidget {
  final ValueChanged<String> onChanged;
  final image;
  final hintText;
  final color;
  final icon;
  const RoundedImageField({
    Key? key,
    required this.image,
    required this.hintText,
    required this.icon,
    required this.onChanged,
    required this.color,
  }) : super(key: key);

  @override
  State<RoundedImageField> createState() => _RoundedImageFieldState();
}

class _RoundedImageFieldState extends State<RoundedImageField> {
  XFile? imageFile;

  @override
  Widget build(BuildContext context) {
    if (imageFile != null) {
      //
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        widget.image != null && widget.hintText == "Choisir Image →"
            ? CircleAvatar(backgroundImage: NetworkImage(widget.image))
            : widget.hintText != "Choisir Image →"
                ? CircleAvatar(backgroundImage: AssetImage(widget.hintText))
                : const CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/images/noimage_avatar.jpg')),
        TextFieldAddImage(
          child: TextField(
            readOnly: true,
            obscureText: true,
            onChanged: widget.onChanged,
            cursorColor: Colors.black,
            decoration: InputDecoration(
              hintText: widget.hintText,
              suffixIcon: widget.icon,
              suffixIconColor: widget.color,
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}
