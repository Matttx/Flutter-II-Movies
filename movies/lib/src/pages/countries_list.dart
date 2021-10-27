import 'package:flutter/material.dart';
import 'package:movies/models/covid_model.dart';
import 'package:movies/src/widgets/list_item.dart';

class CountriesList extends StatefulWidget {
  final List<CountryModel> countries;

  const CountriesList({Key? key, required this.countries}) : super(key: key);

  @override
  _CountriesListState createState() => _CountriesListState();
}

class _CountriesListState extends State<CountriesList> {
  late List<CountryModel> filteredCountries;

  @override
  void initState() {
    filteredCountries = widget.countries;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void filterCountries(String value) {
    if (value.isEmpty) {
      setState(() {
        filteredCountries = widget.countries;
      });
      return;
    }
    setState(() {
      filteredCountries = widget.countries
          .where((country) => country.name.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Countries"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.black),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: TextField(
                    onChanged: (String value) {
                      filterCountries(value);
                    },
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Search a country",
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.purple,
                      ),
                    ),
                    cursorColor: Colors.purple,
                  ),
                ),
              ),
              ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  itemCount: filteredCountries.length,
                  itemBuilder: (context, index) {
                    return ListItem(country: filteredCountries[index]);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
