import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notification_ui/core/extension/color_extension.dart';
import 'package:notification_ui/core/extension/context_extension.dart';
import 'package:notification_ui/core/extension/int_extension.dart';
import 'package:notification_ui/core/extension/text_theme_extension.dart';

class WCustomTagSection extends StatelessWidget {
  final String title;
  final List<String> items;

  const WCustomTagSection({
    super.key,
    required this.title,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$title :',
          style: context.textTheme.titleSemiBold_16.copyWith(
            color: context.theme.colorScheme.naturalColor7,
          ),
        ),
        8.createVerticalGap,
        Wrap(
          spacing: 8.w,
          children: items.map(
            (item) {
              return Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 12.w,
                  vertical: 4.h,
                ),
                decoration: BoxDecoration(
                  color: context.theme.colorScheme.naturalColor2,
                  borderRadius: BorderRadius.circular(100.r),
                ),
                child: Text(
                  item,
                  style: context.textTheme.bodyRegular_10.copyWith(
                    color: context.theme.colorScheme.naturalColor7,
                  ),
                ),
              );
            },
          ).toList(),
        ),
      ],
    );
  }
}
