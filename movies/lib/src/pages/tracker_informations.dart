import 'package:flutter/material.dart';
import 'package:movies/models/covid_model.dart';
import 'package:movies/src/pages/countries_list.dart';
import 'package:movies/src/widgets/floating_card.dart';
import 'package:movies/src/widgets/list_item.dart';
import 'package:movies/src/widgets/section_header.dart';

class TrackerPage extends StatefulWidget {
  final CovidModel data;

  const TrackerPage({Key? key, required this.data}) : super(key: key);

  @override
  State<TrackerPage> createState() => _TrackerPageState();
}

class _TrackerPageState extends State<TrackerPage> {
  late CountryModel global;
  late List<CountryModel> countries;

  void navigateToCountriesList(context) => Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => CountriesList(countries: widget.data.countries)),
      );

  @override
  void initState() {
    super.initState();
    global = widget.data.countries.firstWhere((country) => country.name == "Global");
    countries = widget.data.countries.where((country) => country.name != "Global").toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitle(context),
        const SectionHeader(children: [
          Text(
            "GLOBAL INFORMATIONS",
            style: TextStyle(color: Colors.grey),
          ),
        ]),
        _buildGlobalInformations(),
        SectionHeader(children: [
          const Text(
            "COUNTRIES INFORMATIONS",
            style: TextStyle(color: Colors.grey),
          ),
          GestureDetector(
            onTap: () => navigateToCountriesList(context),
            child: Text(
              "More",
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
          ),
        ]),
        _buildCountriesList(),
      ],
    );
  }

  Widget _buildTitle(context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
        child: RichText(
          text: TextSpan(
              style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              children: [
                TextSpan(text: "Covid", style: TextStyle(color: Theme.of(context).primaryColor)),
                const TextSpan(
                    text: " Tracker", style: TextStyle(color: Colors.black))
              ]),
        ),
      );

  Widget _buildGlobalInformations() => Padding(
        padding: const EdgeInsets.only(bottom: 20.0, right: 20, left: 20),
        child: Wrap(
          direction: Axis.horizontal,
          spacing: 10,
          runSpacing: 10,
          children: [
            FloatingCard(
              value: global.newConfirmed,
              description: 'New confirmed',
              important: true,
            ),
            FloatingCard(
              value: global.newDeaths,
              description: 'New deaths',
            ),
            FloatingCard(
              value: global.totalConfirmed,
              description: 'Total confirmed',
              important: true,
            ),
            FloatingCard(
              value: global.totalDeaths,
              description: 'Total deaths',
            ),
          ],
        ),
      );

  Widget _buildCountriesList() {
    final sortedCountries = countries;
    sortedCountries.sort((a, b) => b.newConfirmed.compareTo(a.newConfirmed));
    return Expanded(
      child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          itemCount: 3,
          itemBuilder: (context, index) {
            return ListItem(country: sortedCountries[index]);
          }),
    );
  }
}
