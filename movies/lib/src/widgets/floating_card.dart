import 'package:flutter/material.dart';

class FloatingCard extends StatelessWidget {
  final int value;
  final String description;
  final bool important;

  const FloatingCard({Key? key, required this.value, required this.description, this.important = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width / 2.3,
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
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                value.toString(),
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: important ? Theme.of(context).errorColor : Colors.black),
              ),
              Text(
                description
              ),
            ],
          ),
        ));
  }
}
