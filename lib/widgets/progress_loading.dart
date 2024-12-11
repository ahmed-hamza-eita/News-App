
import 'package:flutter/material.dart';

class ProgressLoading extends StatelessWidget {
  const ProgressLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
