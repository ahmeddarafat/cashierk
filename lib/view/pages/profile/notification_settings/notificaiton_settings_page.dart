import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:start_app/view/widgets/public_divider.dart';
import 'package:start_app/view_model/profile/notifications_settings/notification_settings_cubit.dart';

import '../../../../resources/localization/generated/l10n.dart';
import '../../../../resources/styles/app_colors.dart';
import '../../../widgets/public_switch_list_tile.dart';
import '../../../widgets/public_text.dart';

class NotificationsSettingsPage extends StatelessWidget {
  const NotificationsSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    var bloc = NotificationSettingsCubit.getInstance(context);
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
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 40.h),
          child: Column(
            children: [
              PublicSwitchListTile(
                index: 0,
                title: S.of(context).generalNotifications,
                initValue: bloc.notifications[0],
              ),
              const PublicDivider(),
              PublicSwitchListTile(
                index: 1,
                title: S.of(context).rememberMe,
                initValue: bloc.notifications[1],
              ),
              const PublicDivider(),
              PublicSwitchListTile(
                index: 2,
                title: S.of(context).sound,
                initValue: bloc.notifications[2],
              ),
              const PublicDivider(),
              PublicSwitchListTile(
                index: 3,
                title: S.of(context).specialOffer,
                initValue: bloc.notifications[3],
              ),
              const PublicDivider(),
              PublicSwitchListTile(
                index: 4,
                title: S.of(context).appUpdates,
                initValue: bloc.notifications[4],
              ),
              const PublicDivider()
            ],
          ),
        ),
      ),
    );
  }
}
