import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/UserInterface/components/catalog_card.dart';
import 'package:mobile_app/UserInterface/components/catalog_card_green.dart';
import 'package:mobile_app/models/catalog.dart';
import 'package:mobile_app/screens/Addtask/task.dart';

class Catalog extends StatefulWidget {
  const Catalog({Key? key}) : super(key: key);

  @override
  _CatalogState createState() => _CatalogState();
}

class _CatalogState extends State<Catalog> {
  final DatePickerController _controller = DatePickerController();

  DateTime _selectedValue = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Container(
        color: const Color(0xfff0f2f0),
        padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * 0.03,
            15, MediaQuery.of(context).size.width * 0.03, 0),
        child: Scaffold(
            body: Column(
          children: [
            Material(
              child: Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    controller: ScrollController(),
                    itemCount: 1,
                    itemBuilder: (context, index) => CatalogCardBlue(
                        catalogModel: CatalogModelsData[0],
                        press: () => {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const TaskInfo(
                                            uid: null,
                                            image: null,
                                          )))
                            }),
                  ),
                  Column(
                    children: [
                      Container(
                        color: const Color(0xfff0f2f0),
                        child: const SizedBox(
                          height: 15,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5)),
                            color: Colors.white,
                            border: Border.all(color: Colors.white)),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.92,
                          child: DatePicker(
                            DateTime.now(),
                            width: 60,
                            height: 84,
                            controller: _controller,
                            initialSelectedDate: DateTime.now(),
                            selectionColor: const Color(0xFF57ba46),
                            selectedTextColor: Colors.white,
                            onDateChange: (date) {
                              // New date selected
                              setState(() {
                                _selectedValue = date;
                              });
                            },
                          ),
                        ),
                      ),
                      Container(
                        color: const Color(0xfff0f2f0),
                        child: const SizedBox(
                          height: 15,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 0, bottom: 0),
                    padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                        color: Colors.white,
                        border: Border.all(color: Colors.white)),
                    height: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          '20 December 2021',
                          style: TextStyle(fontSize: 14, color: Colors.blue),
                        ),
                        Text(
                          'Sélectionner une date',
                          style: TextStyle(color: Colors.black, fontSize: 14),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              child: ListView.builder(
                controller: ScrollController(),
                itemCount: CatalogModelsData.length - 1,
                itemBuilder: (context, index) => CatalogCard(
                    catalogModel: CatalogModelsData[index + 1],
                    press: () => {}),
              ),
            ),
          ],
        )));
  }
}
