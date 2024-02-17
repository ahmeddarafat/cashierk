import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:start_app/resources/extensions/app_extensions.dart';
import 'package:start_app/view/widgets/public_circular_image.dart';
import 'package:start_app/view/widgets/public_divider.dart';
import 'package:start_app/view_model/auth/login/login_cubit.dart';
import 'package:start_app/view_model/profile/profile/profile_cubit.dart';

import '../../../../../resources/localization/generated/l10n.dart';
import '../../../../resources/router/app_router.dart';
import '../../../../resources/styles/app_colors.dart';
import '../../../widgets/public_button.dart';
import '../../../widgets/public_list_tile.dart';
import '../../../widgets/public_outline_button.dart';
import '../../../widgets/public_snack_bar.dart';
import '../../../widgets/public_text.dart';

part 'components/logout_bottom_sheet.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late final ProfileCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = ProfileCubit.getInstance(context);
    cubit.getUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const PublicCircularImage(),
                8.ph,
                BlocBuilder<ProfileCubit, ProfileState>(
                  buildWhen: (_, current) => current is ChangeProfileState,
                  builder: (context, state) {
                    state as ChangeProfileState;
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        PublicText(
                          txt: state.name,
                          size: 24.sp,
                          fw: FontWeight.w600,
                        ),
                        8.ph,
                        PublicText(
                          txt: state.email,
                          size: 14.sp,
                          color: AppColors.grey,
                        ),
                      ],
                    );
                  },
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
                  onTap: () => Navigator.pushNamed(
                    context,
                    AppRoutes.notificationSettings,
                  ),
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
                  onTap: () => Navigator.pushNamed(context, AppRoutes.policy),
                  title: S.of(context).privacyPolicy,
                  icon: Icons.privacy_tip_outlined,
                ),
                PublicListTile(
                  onTap: () => Navigator.pushNamed(context, AppRoutes.terms),
                  title: S.of(context).termsConditions,
                  icon: Icons.telegram_sharp,
                ),
                const PublicDivider(),
                PublicListTile(
                  onTap: () =>
                      Navigator.pushNamed(context, AppRoutes.changePassword),
                  title: S.of(context).changePassword,
                  icon: Icons.remove_red_eye_outlined,
                ),
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
