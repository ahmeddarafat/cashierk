import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter/material.dart';
import 'package:start_app/resources/extensions/app_extensions.dart';

import '../../../data/dummy_data/dummy_data.dart';
import '../../../data/models/notifications/notification_model.dart';
import '../../../resources/localization/generated/l10n.dart';
import '../../../resources/styles/app_colors.dart';
import '../../widgets/public_text.dart';

part 'components/notification_card.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

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
            icon: const Icon(
              Icons.arrow_back_ios_new_outlined,
              color: AppColors.orangePrimary,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: ListView.builder(
          itemCount: DummyData.notifications.length,
          itemBuilder: (_, index) => NotificationCard(
            notification: DummyData.notifications[index],
          ),
        ),
      ),
    );
  }
}
