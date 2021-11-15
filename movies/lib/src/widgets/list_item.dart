import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies/models/covid_model.dart';
import 'package:movies/src/widgets/section_header.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

import 'floating_card.dart';

class ListItem extends StatelessWidget {
  final CountryModel country;

  const ListItem({Key? key, required this.country}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future showSheet() => showSlidingBottomSheet(context,
        builder: (context) => SlidingSheetDialog(
              cornerRadius: 15,
              snapSpec: const SnapSpec(snappings: [0.4, 0.7], initialSnap: 0.7),
              builder: buildSheet,
              headerBuilder: buildHeaderSheet,
            ));

    return GestureDetector(
      onTap: showSheet,
      child: Container(
        key: const Key("ListItem"),
        margin: const EdgeInsets.symmetric(vertical: 10),
        height: 100,
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                spreadRadius: 2,
                blurRadius: 5,
              )
            ]),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            key: const Key("ListInfos"),
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                country.name,
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildValue(context,
                      value: country.newConfirmed,
                      description: "New confirmed",
                      important: true),
                  _buildValue(context,
                      value: country.newDeaths, description: "New deaths"),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSheet(context, state) => Material(
          child: Container(
        key: const Key("SheetItem"),
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Center(
                child: Text(
                  country.name,
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SectionHeader(key: Key("SheetCountryInfosHeader"), children: [
              Text(
                "COUNTRY INFORMATIONS",
                style: TextStyle(color: Colors.grey),
              ),
            ]),
            Padding(
              padding:
                  const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Code: ${country.code}"),
                ],
              ),
            ),
            SectionHeader(key: const Key("SheetCovidInfosHeader"), children: [
              const Text(
                "COVID INFORMATIONS",
                style: TextStyle(color: Colors.grey),
              ),
              Text(
                country.date.toString(),
                style: const TextStyle(color: Colors.grey),
              ),
            ]),
            _buildCovidInformations(),
          ],
        ),
      ));

  Widget _buildCovidInformations() => Padding(
        key: const Key("CovidInfos"),
        padding: const EdgeInsets.only(bottom: 100.0, right: 20, left: 20),
        child: Wrap(
          direction: Axis.horizontal,
          spacing: 10,
          runSpacing: 20,
          children: [
            FloatingCard(
              value: country.newConfirmed,
              description: 'New confirmed',
              important: true,
            ),
            FloatingCard(
              value: country.newDeaths,
              description: 'New deaths',
            ),
            FloatingCard(
              value: country.totalConfirmed,
              description: 'Total confirmed',
              important: true,
            ),
            FloatingCard(
              value: country.totalDeaths,
              description: 'Total deaths',
            ),
          ],
        ),
      );

  Widget buildHeaderSheet(context, state) => Material(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Container(
                width: 32,
                height: 6,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.grey,
                ),
              ),
            ),
          )
        ],
      ));

  Widget _buildValue(context, {value, description, important = false}) =>
      Column(
        children: [
          Text(
            value.toString(),
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: important ? Theme.of(context).errorColor : Colors.black),
            overflow: TextOverflow.ellipsis,
          ),
          Text(description, style: const TextStyle(fontSize: 16)),
        ],
      );
}
