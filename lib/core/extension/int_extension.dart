import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension IntExtension on int {
  SizedBox get createHorizontalGap => SizedBox(
        width: toDouble().w,
      );

  SizedBox get createVerticalGap => SizedBox(
        height: toDouble().h,
      );
}
