import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:start_app/view/widgets/global/public_divider.dart';

import '../../../../resources/localization/generated/l10n.dart';
import '../../../../resources/styles/app_colors.dart';
import '../../../widgets/global/public_switch_list_tile.dart';
import '../../../widgets/global/public_text.dart';

class NotificationsSettingsPage extends StatelessWidget {
  const NotificationsSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 80.h,
          title: PublicText(
            txt: S.of(context).notifications,
            fw: FontWeight.bold,
            size: 22.sp,
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_outlined),
            color: AppColors.orangePrimary,
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 40.h),
          child: Column(
            children: [
              PublicSwitchListTile(
                title: S.of(context).generalNotifications,
                swithcer: Switchers.general,
              ),
              const PublicDivider(),
              PublicSwitchListTile(
                title: S.of(context).rememberMe,
                swithcer: Switchers.rememberMe,
              ),
              const PublicDivider(),
              PublicSwitchListTile(
                title: S.of(context).sound,
                swithcer: Switchers.sound,
              ),
              const PublicDivider(),
              PublicSwitchListTile(
                title: S.of(context).specialOffer,
                swithcer: Switchers.offers,
              ),
              const PublicDivider(),
              PublicSwitchListTile(
                title: S.of(context).appUpdates,
                swithcer: Switchers.updates,
              ),
              const PublicDivider()
            ],
          ),
        ),
      ),
    );
  }
}
