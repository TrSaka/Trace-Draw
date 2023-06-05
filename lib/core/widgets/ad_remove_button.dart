import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AdRemoveButton extends StatelessWidget {
  const AdRemoveButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: CircleAvatar(
        backgroundColor: Colors.red.shade50,
        child: Center(
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              FontAwesomeIcons.rectangleAd,
              color: Colors.red.shade500,
            ),
          ),
        ),
      ),
    );
  }
}
