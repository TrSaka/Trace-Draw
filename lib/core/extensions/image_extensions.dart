import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

extension ImageExt on dynamic {
  get toSvg {
    return SvgPicture.asset(
      this,
      fit: BoxFit.cover,
    );
  }
}
