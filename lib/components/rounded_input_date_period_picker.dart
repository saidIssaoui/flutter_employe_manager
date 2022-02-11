import 'package:flutter/material.dart';
import 'package:mobile_app/components/text_field_add_emp_container.dart';
import 'package:mobile_app/flutter-icons/plus_slim_2.dart';
import 'package:intl/intl.dart';

class DatePickerRounded extends StatefulWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const DatePickerRounded({
    Key? key,
    required this.hintText,
    this.icon = PlusSlim2.plus_circled,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<DatePickerRounded> createState() => _DatePickerRoundedState();
}

class _DatePickerRoundedState extends State<DatePickerRounded> {
  TimeOfDay? time;
  DateFormat timeFormat = DateFormat("HH:mm");
  TimeOfDay _time = TimeOfDay.now();

  Future<void> _selectDate(BuildContext context) async {
    final TimeOfDay? newTime = await showTimePicker(
        context: context,
        initialTime: _time,
        builder: (context, childWidget) {
          return MediaQuery(
              data: MediaQuery.of(context).copyWith(
                  // Using 24-Hour format
                  alwaysUse24HourFormat: false),
              child: childWidget!);
        });
    if (newTime != null) {
      setState(() {
        _time = newTime;
        _controller.value = _controller.value.copyWith(
          text: _time.format(context),
          selection: TextSelection.collapsed(
              offset: _controller.value.selection.baseOffset),
        );
      });
    }
  }

  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextFieldAddEmpContainer(
      child: TextField(
        controller: _controller,
        readOnly: true,
        onChanged: widget.onChanged,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          labelText: widget.hintText,
          icon: IconButton(
            icon: Icon(
              widget.icon,
              color: const Color.fromARGB(255, 87, 186, 70),
              size: 28,
            ),
            onPressed: () {
              _selectDate(context);
            },
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
