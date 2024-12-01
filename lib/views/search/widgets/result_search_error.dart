import 'package:flutter/material.dart';

class ResultSearchError extends StatelessWidget {
  const ResultSearchError({
    super.key,
    required this.error,
  });
  final String error;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 200.0),
      child: Center(
        child: Text(error),
      ),
    );
  }
}
