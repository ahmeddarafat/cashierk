import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:start_app/resources/extensions/app_extensions.dart';
import 'package:start_app/view/widgets/global/public_divider.dart';
import 'package:start_app/view_model/auth/login/login_cubit.dart';

import '../../../../../resources/constants/app_assets.dart';
import '../../../../../resources/localization/generated/l10n.dart';
import '../../../../resources/router/app_router.dart';
import '../../../../resources/styles/app_colors.dart';
import '../../../widgets/global/public_button.dart';
import '../../../widgets/global/public_list_tile.dart';
import '../../../widgets/global/public_outline_button.dart';
import '../../../widgets/global/public_snack_bar.dart';
import '../../../widgets/global/public_switch_list_tile.dart';
import '../../../widgets/global/public_text.dart';

part 'components/logout_bottom_sheet.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 70.w,
                  backgroundImage: const AssetImage(Assets.imagesProfile),
                ),
                8.ph,
                PublicText(
                  txt: "Ahmed Arafat",
                  size: 24.sp,
                  fw: FontWeight.w600,
                ),
                8.ph,
                PublicText(
                  txt: "ahmed.arafat2@gmail.com",
                  size: 14.sp,
                  color: AppColors.grey,
                ),
                20.ph,
                PublicListTile(
                  onTap: () =>
                      Navigator.pushNamed(context, AppRoutes.editProfile),
                  title: S.of(context).editProfile,
                  icon: Icons.person,
                ),
                const PublicDivider(),
                PublicListTile(
                  onTap: () => Navigator.pushNamed(context, AppRoutes.myOrders),
                  title: S.of(context).myOrders,
                  icon: Icons.list,
                ),
                const PublicDivider(),
                PublicListTile(
                  onTap: () => Navigator.pushNamed(context, AppRoutes.myCards),
                  title: S.of(context).myCards,
                  icon: Icons.card_membership_outlined,
                ),
                const PublicDivider(),
                PublicListTile(
                  onTap: () => Navigator.pushNamed(
                      context, AppRoutes.notificationSettings),
                  title: S.of(context).notifications,
                  icon: Icons.notifications,
                ),
                const PublicDivider(),
                PublicListTile(
                  onTap: () => Navigator.pushNamed(context, AppRoutes.about),
                  title: S.of(context).about,
                  icon: Icons.check_circle_rounded,
                ),
                const PublicDivider(),
                PublicListTile(
                  onTap: () =>
                      Navigator.pushNamed(context, AppRoutes.helpCenter),
                  title: S.of(context).helpCenter,
                  icon: Icons.question_mark_rounded,
                ),
                const PublicDivider(),
                PublicListTile(
                    onTap: () =>
                        Navigator.pushNamed(context, AppRoutes.changePassword),
                    title: S.of(context).changePassword,
                    icon: Icons.remove_red_eye_outlined),
                const PublicDivider(),
                20.ph,
                PublicListTile(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      backgroundColor: Colors.transparent,
                      builder: (context) {
                        return const LogoutBottomSheet();
                      },
                    );
                  },
                  title: S.of(context).logout,
                  icon: Icons.logout_outlined,
                  iconColor: AppColors.red,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
