import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:notification_ui/core/assets/assets.gen.dart';
import 'package:notification_ui/core/extension/color_extension.dart';
import 'package:notification_ui/core/extension/context_extension.dart';
import 'package:notification_ui/core/extension/int_extension.dart';
import 'package:notification_ui/core/extension/text_theme_extension.dart';
import 'package:notification_ui/core/widgets/w_custom_button.dart';
import 'package:notification_ui/core/widgets/w_custom_tag_section.dart';
import 'package:notification_ui/core/widgets/w_notifivation_item.dart';
import 'package:notification_ui/core/widgets/w_shared_scaffold.dart';

class SNProfile extends StatefulWidget {
  const SNProfile({super.key});

  @override
  State<SNProfile> createState() => _SNProfileState();
}

class _SNProfileState extends State<SNProfile> {
  List<String> notifications = [
    'Oumaima suggested for you Skema Business school',
    'Your CV is accepted and now you can add your motivation letter',
    'Visa, Housing & In France is now available in your application at Skema',
  ];

  void handleView(String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Viewing: $text'),
      ),
    );
  }

  void handleDelete(String text) {
    setState(() {
      notifications.remove(text);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Deleted: $text'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WSharedScaffold(
      title: "Profile",
      onNotification: () {},
      onPreferences: () {},
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            5.createVerticalGap,
            Center(
              child: Text(
                'Mohamed Farag',
                style: context.textTheme.titleSemiBold_18.copyWith(
                  color: context.theme.colorScheme.tertiaryColor1,
                ),
              ),
            ),
            3.createVerticalGap,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  width: 18.w,
                  height: 22.5.h,
                  Assets.icons.location.path,
                  colorFilter: ColorFilter.mode(
                    context.theme.colorScheme.naturalColor5,
                    BlendMode.srcIn,
                  ),
                ),
                8.createHorizontalGap,
                Text(
                  'Cairo, Egypt',
                  style: context.textTheme.titleMedium_13.copyWith(
                    color: context.theme.colorScheme.naturalColor5,
                  ),
                ),
              ],
            ),
            32.createVerticalGap,
            Padding(
              padding: EdgeInsets.only(
                right: 23.w,
                left: 28.w,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const WCustomTagSection(
                        title: 'Language test',
                        items: [
                          'English : TOEFL',
                          'French : Delf',
                        ],
                      ),
                      6.createVerticalGap,
                      const WCustomTagSection(
                        title: 'Interested in',
                        items: ['Business', 'Engineering'],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 16.r,
                        backgroundImage: AssetImage(Assets.icons.image2.path),
                      ),
                      4.createVerticalGap,
                      Text(
                        'Oumaima Elhadidi',
                        style: context.textTheme.bodyMedium_12.copyWith(
                          color: context.theme.colorScheme.naturalColor7,
                        ),
                      ),
                      Text(
                        'Your representative',
                        style: context.textTheme.bodyRegular_8.copyWith(
                          color: context.theme.colorScheme.naturalColor4,
                        ),
                      ),
                      8.createVerticalGap,
                      InkWell(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 18.5.w,
                            vertical: 4.h,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            border: Border.all(
                              color: context.theme.colorScheme.secondaryColor1,
                              width: 2.w,
                            ),
                          ),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                Assets.icons.whatsAppLogo.path,
                                height: 16.h,
                                width: 16.w,
                              ),
                              10.createHorizontalGap,
                              Text(
                                'Contact',
                                style: context.textTheme.titleSemiBold_12.copyWith(
                                  color: context.theme.colorScheme.secondaryColor1,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            21.createVerticalGap,
            Container(
              height: 1.h,
              color: context.theme.colorScheme.naturalColor1,
            ),
            21.createVerticalGap,
            Padding(
              padding: EdgeInsets.only(right: 15.w),
              child: SizedBox(
                height: 33.h,
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      WCustomButton(
                        iconPath: Assets.icons.fiRrSettings.path,
                        label: 'My wishlist',
                        backgroundColor: context.theme.colorScheme.secondaryColor2,
                        borderColor: context.theme.colorScheme.naturalColor3,
                        textColor: context.theme.colorScheme.naturalColor7,
                        onTap: () {},
                      ),
                      10.createHorizontalGap,
                      WCustomButton(
                        iconPath: Assets.icons.fiRrBell.path,
                        label: 'Notifications',
                        backgroundColor: context.theme.colorScheme.secondaryColor1,
                        borderColor: context.theme.colorScheme.naturalColor3,
                        textColor: context.theme.colorScheme.naturalColor0,
                        onTap: () {},
                      ),
                      10.createHorizontalGap,
                      WCustomButton(
                        iconPath: Assets.icons.fiRrHeart.path,
                        label: 'Settings',
                        backgroundColor: context.theme.colorScheme.secondaryColor2,
                        borderColor: context.theme.colorScheme.naturalColor3,
                        textColor: context.theme.colorScheme.naturalColor7,
                        onTap: () {},
                      ),
                      10.createHorizontalGap,
                      WCustomButton(
                        iconPath: Assets.icons.preferences.path,
                        label: 'My programs',
                        backgroundColor: context.theme.colorScheme.secondaryColor2,
                        borderColor: context.theme.colorScheme.naturalColor3,
                        textColor: context.theme.colorScheme.naturalColor7,
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
            21.createVerticalGap,
            Padding(
              padding: EdgeInsets.only(
                right: 23.w,
                left: 28.w,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Notifications',
                    style: context.textTheme.titleSemiBold_16.copyWith(
                      color: context.theme.colorScheme.naturalColor7,
                    ),
                  ),
                  1.createVerticalGap,
                  Text(
                    'check your updated notification',
                    style: context.textTheme.bodyRegular_12.copyWith(
                      color: context.theme.colorScheme.naturalColor7,
                    ),
                  ),
                ],
              ),
            ),
            26.createVerticalGap,
            Padding(
              padding: EdgeInsets.only(
                right: 23.w,
                left: 28.w,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Today',
                    style: context.textTheme.titleSemiBold_16.copyWith(
                      color: context.theme.colorScheme.naturalColor7,
                    ),
                  ),
                  16.createVerticalGap,
                  ...notifications.map((notification) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 22.h),
                      child: NotificationItem(
                        iconPath: Assets.icons.notify1.path,
                        text: notification,
                        backgroundColor: context.theme.colorScheme.primaryColor,
                        iconBackgroundColor: context.theme.colorScheme.naturalColor0,
                        textColor: context.theme.colorScheme.naturalColor7,
                        onView: () => handleView(notification),
                        onDelete: () => handleDelete(notification),
                      ),
                    );
                  },),
                  8.createVerticalGap,
                  Text(
                    'Yesterday',
                    style: context.textTheme.titleSemiBold_16.copyWith(
                      color: context.theme.colorScheme.naturalColor7,
                    ),
                  ),
                  19.createVerticalGap,
                  NotificationItem(
                    iconPath: Assets.icons.notify2.path,
                    text: 'Oumaima suggested for you Skema Business school',
                    backgroundColor: context.theme.colorScheme.primaryColor,
                    iconBackgroundColor: context.theme.colorScheme.naturalColor0,
                    textColor: context.theme.colorScheme.naturalColor7,
                    onView: () => handleView('Oumaima suggested for you Skema Business school'),
                    onDelete: () => handleDelete('Oumaima suggested for you Skema Business school'),
                  ),
                  22.createVerticalGap,
                  NotificationItem(
                    iconPath: Assets.icons.notify2.path,
                    text: 'Oumaima suggested for you Skema Business school',
                    backgroundColor: context.theme.colorScheme.primaryColor,
                    iconBackgroundColor: context.theme.colorScheme.naturalColor0,
                    textColor: context.theme.colorScheme.naturalColor7,
                    onView: () => handleView('Oumaima suggested for you Skema Business school'),
                    onDelete: () => handleDelete('Oumaima suggested for you Skema Business school'),
                  ),
                  22.createVerticalGap,
                  NotificationItem(
                    iconPath: Assets.icons.notify2.path,
                    text: 'Oumaima suggested for you Skema Business school',
                    backgroundColor: context.theme.colorScheme.primaryColor,
                    iconBackgroundColor: context.theme.colorScheme.naturalColor0,
                    textColor: context.theme.colorScheme.naturalColor7,
                    onView: () => handleView('Oumaima suggested for you Skema Business school'),
                    onDelete: () => handleDelete('Oumaima suggested for you Skema Business school'),
                  ),
                ],
              ),
            ),
            26.createVerticalGap,
          ],
        ),
      ),
    );
  }
}