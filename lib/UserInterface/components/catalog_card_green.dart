import 'package:flutter/material.dart';

import 'package:mobile_app/models/catalog.dart';

class CatalogCardBlue extends StatelessWidget {
  const CatalogCardBlue({
    Key? key,
    required this.catalogModel,
    required this.press,
  }) : super(key: key);

  final CatalogModel catalogModel;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Container(
        padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * 0.03,
            15, MediaQuery.of(context).size.width * 0.03, 0),
        width: MediaQuery.of(context).size.width * 1,
        height: 150,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            color: const Color(0xFF57ba46),
            border: Border.all(color: const Color(0xFF57ba46))),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Today',
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                  Text(
                    '22 Augest 2022',
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    catalogModel.job,
                    style: const TextStyle(color: Colors.white),
                  ),
                  const SizedBox(height: 3),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            catalogModel.name,
                            style: const TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                      Text(catalogModel.time,
                          style: const TextStyle(fontSize: 14, color: Colors.white))
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
