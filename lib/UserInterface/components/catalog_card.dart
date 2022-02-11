
import 'package:flutter/material.dart';

import 'package:mobile_app/models/catalog.dart';

class CatalogCard extends StatelessWidget {
  const CatalogCard({
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
            0, MediaQuery.of(context).size.width * 0.03, 0),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          color: Colors.white,
        ),
        height: 100,
        child: Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              border: Border(
                bottom: BorderSide(width: 2.0, color: Color(0xfff0f2f0)),
              )),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      catalogModel.job,
                      style: const TextStyle(color: Colors.black),
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
                              style: const TextStyle(color: Colors.black38),
                            )
                          ],
                        ),
                        Text(catalogModel.time,
                            style: const TextStyle(fontSize: 14, color: Colors.black))
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
