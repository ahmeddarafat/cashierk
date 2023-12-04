import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:start_app/resources/styles/app_colors.dart';

import '../../data/data_source/local/app_prefs.dart';
import '../../resources/service_locator/service_locator.dart';
import 'public_text.dart';

enum Switchers {
  darkMode,
  general,
  sound,
  offers,
  updates,
  rememberMe
}

class PublicSwitchListTile extends StatefulWidget {
  final String title;
  final Switchers swithcer;
  final Icon? icon;
  const PublicSwitchListTile({
    super.key,
    required this.title,
    required this.swithcer,
    this.icon,
  });

  @override
  State<PublicSwitchListTile> createState() => _PublicSwitchListTileState();
}

class _PublicSwitchListTileState extends State<PublicSwitchListTile> {
  bool switcherValue = false;
  final appPrefs = getIt<AppPrefs>();

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
            setSwitches(widget.swithcer, switcherValue);
          },
          value: switcherValue,
          activeColor:AppColors.orangePrimary,
        ),
      ),
    );
  }

  // helper methods
  void setSwitches(Switchers switcher, bool value) {
    switch (switcher) {
      case Switchers.rememberMe:
        appPrefs.setUserLoggedIn();
        break;
      default:
    }
  }
}
