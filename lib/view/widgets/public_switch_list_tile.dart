import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:start_app/resources/styles/app_colors.dart';
import 'package:start_app/view_model/profile/cubit/notification_settings_cubit.dart';

import '../../data/data_source/local/app_prefs.dart';
import '../../resources/service_locator/service_locator.dart';
import 'public_text.dart';

class PublicSwitchListTile extends StatefulWidget {
  final int index;
  final String title;
  final Icon? icon;
  final bool initValue;
  const PublicSwitchListTile({
    super.key,
    required this.index,
    required this.title,
    required this.initValue,
    this.icon,
  });

  @override
  State<PublicSwitchListTile> createState() => _PublicSwitchListTileState();
}

class _PublicSwitchListTileState extends State<PublicSwitchListTile> {
  bool switcherValue = false;
  late final AppPrefs appPrefs;
  late final NotificationSettingsCubit bloc;

  @override
  void initState() {
    super.initState();
    switcherValue = widget.initValue;
    appPrefs = getIt();
bloc = NotificationSettingsCubit.getInstance(context);
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: widget.icon,
      title: PublicText(
        txt: widget.title,
        color: Colors.black,
      ),
      trailing: Transform.scale(
        scale: 0.7,
        child: CupertinoSwitch(
          onChanged: (value) {
            setState(() {
              switcherValue = value;
            });
            bloc.changeNotification(widget.index);
          },
          value: switcherValue,
          activeColor: AppColors.orangePrimary,
        ),
      ),
    );
  }
}
