import 'package:flutter/material.dart';

class Autocompletetab extends StatefulWidget {
  const Autocompletetab({super.key});

  @override
  State<Autocompletetab> createState() => _AutocompletetabState();
}

class _AutocompletetabState extends State<Autocompletetab> {
  List<String> list = [
    "dachshund",
    "dingo",
    "doberman",
    "entlebucher",
    "eskimo",
    'india',
    'indonesia',
    'iran',
    'japan',
    'jordan',
  ];
  @override
  Widget build(BuildContext context) {
    return Autocomplete(
        optionsBuilder: (TextEditingValue textEditingValue) {
          if (textEditingValue.text.isEmpty) {
            return const Iterable<String>.empty();
          }
          return list.where((String option) {
            return option.contains(textEditingValue.text.toLowerCase());
          });
        },
        onSelected: (String selection) {});
  }
}
