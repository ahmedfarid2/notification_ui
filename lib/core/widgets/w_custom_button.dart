import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:notification_ui/core/extension/context_extension.dart';
import 'package:notification_ui/core/extension/int_extension.dart';
import 'package:notification_ui/core/extension/text_theme_extension.dart';

class WCustomButton extends StatelessWidget {
  final String iconPath;
  final String label;
  final Color backgroundColor;
  final Color borderColor;
  final Color textColor;
  final VoidCallback onTap;

  const WCustomButton({
    super.key,
    required this.iconPath,
    required this.label,
    required this.backgroundColor,
    required this.borderColor,
    required this.textColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 33.h,
        padding: EdgeInsets.symmetric(
          horizontal: 8.w,
          vertical: 6.h,
        ),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(30.r),
          border: Border.all(
            color: borderColor,
            width: 1.w,
          ),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              width: 18.w,
              height: 22.5.h,
              iconPath,
              colorFilter: ColorFilter.mode(
                textColor,
                BlendMode.srcIn,
              ),
            ),
            8.createHorizontalGap,
            Text(
              label,
              style: context.textTheme.bodyRegular_14.copyWith(
                color: textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
