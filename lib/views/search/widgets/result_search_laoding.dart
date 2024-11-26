import 'package:flutter/material.dart';

class ResultSearchLoading extends StatelessWidget {
  const ResultSearchLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
