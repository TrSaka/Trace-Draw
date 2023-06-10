import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

extension ImageExt on dynamic {
  get toSvg {
    return SvgPicture.asset(
      this,
      fit: BoxFit.cover,
    );
  }

  get toPng {
    return Image.asset(this,filterQuality: FilterQuality.high, fit: BoxFit.cover);
  }
}
