import 'package:flutter/material.dart';
import 'package:weatherly/widgets/search_widget.dart';

Widget actionIcon(context) {
  return IconButton(
      icon: const Icon(Icons.search),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const SearchWidget(),
          ),
        );
      });
}
