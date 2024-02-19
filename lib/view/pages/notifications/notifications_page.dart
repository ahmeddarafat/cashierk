import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter/material.dart';
import '../../../resources/extensions/app_extensions.dart';
import '../../../view_model/notifications/notification_cubit.dart';

import '../../../data/models/notification_model.dart';
import '../../../resources/constants/app_assets.dart';
import '../../../resources/localization/generated/l10n.dart';
import '../../../resources/styles/app_colors.dart';
import '../../widgets/public_text.dart';

part 'components/notification_card.dart';
part 'components/no_notification_view.dart';
part 'components/notifications_view.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  late final NotificationCubit bloc;
  @override
  void initState() {
    super.initState();
    bloc = context.read();
  }

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
          body: _getNotificationsView(bloc)),
    );
  }

  Widget _getNotificationsView(NotificationCubit bloc) {
    if (bloc.notifications.isEmpty) {
      return const NoNotificationsView();
    } else {
      return const NotificationsView();
    }
  }
}
