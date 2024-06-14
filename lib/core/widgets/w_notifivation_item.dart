import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:notification_ui/core/assets/assets.gen.dart';
import 'package:notification_ui/core/extension/color_extension.dart';
import 'package:notification_ui/core/extension/context_extension.dart';
import 'package:notification_ui/core/extension/int_extension.dart';
import 'package:notification_ui/core/extension/text_theme_extension.dart';

class NotificationItem extends StatelessWidget {
  final String iconPath;
  final String text;
  final Color backgroundColor;
  final Color iconBackgroundColor;
  final Color textColor;
  final VoidCallback onView;
  final VoidCallback onDelete;

  const NotificationItem({
    super.key,
    required this.iconPath,
    required this.text,
    required this.backgroundColor,
    required this.iconBackgroundColor,
    required this.textColor,
    required this.onView,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: onView,
                  child: Container(
                    padding: EdgeInsets.only(
                      top: 38.h,
                      bottom: 32.h,
                      left: 23.w,
                    ),
                    width: 377.w,
                    height: 100.h,
                    decoration: BoxDecoration(
                      color: context.theme.colorScheme.successColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15.r),
                        bottomLeft: Radius.circular(15.r),
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: SvgPicture.asset(
                        width: 30.w,
                        height: 18.h,
                        Assets.icons.view.path,
                        colorFilter: ColorFilter.mode(
                          context.theme.colorScheme.naturalColor0,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: onDelete,
                  child: Container(
                    padding: EdgeInsets.only(top: 38.h, bottom: 32.h, right: 23.w, left: 22.w),
                    width: 377.w,
                    height: 100.h,
                    decoration: BoxDecoration(
                      color: context.theme.colorScheme.dangerColor,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15.r),
                        bottomRight: Radius.circular(15.r),
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: SvgPicture.asset(
                        width: 25.w,
                        height: 30.h,
                        Assets.icons.remove.path,
                        colorFilter: ColorFilter.mode(
                          context.theme.colorScheme.naturalColor0,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Slidable(
          key: ValueKey(text),
          startActionPane: ActionPane(
            extentRatio: 0.20,
            motion: const DrawerMotion(),
            children: [
              SlidableAction(
                onPressed: (context) => onView(),
                backgroundColor: Colors.transparent,
                foregroundColor: Colors.transparent,
                icon: Icons.remove_red_eye,
              ),
            ],
          ),
          endActionPane: ActionPane(
            extentRatio: 0.20,
            motion: const DrawerMotion(),
            children: [
              SlidableAction(
                onPressed: (context) => onDelete(),
                icon: Icons.delete,
                backgroundColor: Colors.transparent,
                foregroundColor: Colors.transparent,
              ),
            ],
          ),
          child: Builder(builder: (context) {
            SlidableController? controller = Slidable.of(context);
            return ValueListenableBuilder<int>(
              valueListenable: controller?.direction ?? ValueNotifier<int>(0),
              builder: (context, value, _) {
                var borderRadius = BorderRadius.horizontal(
                  right: Radius.circular(15.r),
                  left: Radius.circular(15.r),
                );
                return Container(
                  padding: EdgeInsets.all(12.w),
                  width: 377.w,
                  height: 100.h,
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    borderRadius: borderRadius,
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 50.w,
                        height: 50.h,
                        decoration: BoxDecoration(
                          color: iconBackgroundColor,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: context.theme.colorScheme.naturalColor9.withOpacity(0.1),
                              offset: const Offset(1, 3),
                              blurRadius: 8,
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: SvgPicture.asset(
                            iconPath,
                            width: 20.w,
                            height: 24.h,
                            colorFilter: ColorFilter.mode(
                              context.theme.colorScheme.naturalColor9,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                      ),
                      13.createHorizontalGap,
                      Expanded(
                        child: Text(
                          text,
                          style: context.textTheme.titleMedium_14.copyWith(
                            color: textColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }),
        ),
      ],
    );
  }
}
