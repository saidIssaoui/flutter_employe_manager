import 'package:flutter/material.dart';

class DropDownField extends StatefulWidget {
  const DropDownField({Key? key}) : super(key: key);

  @override
  _DropDownFieldState createState() => _DropDownFieldState();
}

class _DropDownFieldState extends State<DropDownField> {
  // Initial Selected Value
  String dropdownvalue = 'Item 1';

  // List of items in our dropdown menu
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  String? bankSelected = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Geeksforgeeks"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton(
              // Initial Value
              value: dropdownvalue,

              // Down Arrow Icon
              icon: const Icon(Icons.keyboard_arrow_down),

              // Array list of items
              items: items.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              // After selecting the desired option,it will
              // change button value to selected value
              onChanged: (String? newValue) {
                setState(() {
                  dropdownvalue = newValue!;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  // Widget dropDownButtonsColumn(List<String> list, String hint) {
  //   return Padding(
  //     padding: const EdgeInsets.only(left: 40, right: 40, bottom: 24, top: 12),
  //     child: Container(
  //       height: 55, //gives the height of the dropdown button
  //       width: MediaQuery.of(context)
  //           .size
  //           .width, //gives the width of the dropdown button
  //       decoration: BoxDecoration(
  //           borderRadius: BorderRadius.all(Radius.circular(3)),
  //           color: Color(0xFFF2F2F2)),
  //       // padding: const EdgeInsets.symmetric(horizontal: 13), //you can include padding to control the menu items
  //       child: Theme(
  //           data: Theme.of(context).copyWith(
  //               canvasColor: Colors
  //                   .yellowAccent, // background color for the dropdown items
  //               buttonTheme: ButtonTheme.of(context).copyWith(
  //                 alignedDropdown:
  //                     true, //If false (the default), then the dropdown's menu will be wider than its button.
  //               )),
  //           child: DropdownButtonHideUnderline(
  //             // to hide the default underline of the dropdown button
  //             child: DropdownButton<String>(
  //               iconEnabledColor:
  //                   Color(0xFF595959), // icon color of the dropdown button
  //               items: list.map((String value) {
  //                 return DropdownMenuItem<String>(
  //                   value: value,
  //                   child: Text(
  //                     value,
  //                     style: TextStyle(fontSize: 15),
  //                   ),
  //                 );
  //               }).toList(),
  //               hint: Text(
  //                 hint,
  //                 style: TextStyle(color: Color(0xFF8B8B8B), fontSize: 15),
  //               ), // setting hint
  //               onChanged: (String? value) {
  //                 setState(() {
  //                   bankSelected = value; // saving the selected value
  //                 });
  //               },
  //               value: bankSelected, // displaying the selected value
  //             ),
  //           )),
  //     ),
  //   );
  // }
}
