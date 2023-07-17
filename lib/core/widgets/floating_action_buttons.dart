import 'package:flutter/material.dart';
import '../product/route/nav_route.dart';
import '../product/route/router.dart';

class ExitFloatingActionButton extends StatelessWidget {
  const ExitFloatingActionButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        heroTag: 'exit_floating_action_button',
        onPressed: () {
          NavRoute(HomeRoute(key: key, pageIndex: 0)).toPop(context);
        },
        child: const Icon(Icons.close_rounded));
  }
}

class OpacityFloatingActionButton extends StatelessWidget {
  const OpacityFloatingActionButton({
    Key? key,
    required this.icon,
    required this.callback,
    required this.position,
  }) : super(key: key);

  final IconData icon;
  final dynamic callback;
  final String position;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
            child: FloatingActionButton(
          heroTag: position,
          onPressed: callback,
          child: Icon(icon, size: 28),
        )),
        const SizedBox(height: 10),
      ],
    );
  }
}
