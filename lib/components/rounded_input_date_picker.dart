import 'package:flutter/material.dart';
import 'package:mobile_app/components/text_field_add_emp_container.dart';
import 'package:mobile_app/flutter-icons/plus_slim_2.dart';
import 'package:intl/intl.dart';

class RoundedDatePickerField extends StatefulWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const RoundedDatePickerField({
    Key? key,
    required this.hintText,
    this.icon = PlusSlim2.plus_circled,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<RoundedDatePickerField> createState() => _RoundedDatePickerFieldState();
}

class _RoundedDatePickerFieldState extends State<RoundedDatePickerField> {
  DateTime selectedDate = DateTime.now();
  DateTime currentDate = DateTime.now();
  DateTime? pickedDate;
  TimeOfDay? time;
  DateFormat timeFormat = DateFormat("HH:mm");
  DateFormat dateFormat = DateFormat("MM-dd-yyyy");

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(2022),
        lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != currentDate) {
      final TimeOfDay? newTime = await showTimePicker(
          context: context,
          initialTime: _time,
          builder: (context, childWidget) {
            return MediaQuery(
                data: MediaQuery.of(context).copyWith(
                    // Using 24-Hour format
                    alwaysUse24HourFormat: true),
                child: childWidget!);
          });
      if (newTime != null) {
        setState(() {
          _time = newTime;
          currentDate = pickedDate;
          _controller.value = _controller.value.copyWith(
            text: dateFormat.format(pickedDate) + ' ' + _time.format(context),
            selection: TextSelection.collapsed(
              offset: _controller.value.selection.baseOffset +
                  pickedDate.toString().length,
            ),
          );
        });
      }
    }
  }

  TimeOfDay _time = TimeOfDay.now();

  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextFieldAddEmpContainer(
      child: TextFormField(
        key: Key(_controller.toString()),
        initialValue: _controller.value.text,
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
