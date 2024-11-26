import 'package:flutter/material.dart';

class NoResult extends StatelessWidget {
  const NoResult({
    super.key,
    required this.name,
  });

  final String name;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "There is no result about",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 20 / 812,
        ),
        Text(
          name,
          style: const TextStyle(color: Color.fromARGB(255, 139, 137, 137)),
        ),
      ],
    ));
  }
}
