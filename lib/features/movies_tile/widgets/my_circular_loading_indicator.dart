import 'package:flutter/material.dart';

class MyCircularLoadingIndicator extends StatelessWidget {
  const MyCircularLoadingIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
            child: CircularProgressIndicator(
          color: Theme.of(context).indicatorColor,
        )));
  }
}
