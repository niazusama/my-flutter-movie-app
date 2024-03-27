import 'package:flutter/material.dart';

class SingleBarPill extends StatelessWidget {
  final String buttonName;
  const SingleBarPill({
    super.key,
    required this.buttonName,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: Theme.of(context).focusColor,
        ),
        child: Text(
          // Current Button Name
          buttonName,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}
