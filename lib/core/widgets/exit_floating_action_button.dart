import 'package:flutter/material.dart';

class ExitFloatingActionButton extends StatelessWidget {
  const ExitFloatingActionButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        onPressed: () {
          
        }, child: const Icon(Icons.close_rounded));
  }
}
