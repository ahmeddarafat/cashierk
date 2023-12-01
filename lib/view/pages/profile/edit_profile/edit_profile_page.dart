import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:start_app/resources/extensions/app_extensions.dart';

import '../../../../resources/constants/app_assets.dart';
import '../../../../resources/localization/generated/l10n.dart';
import '../../../../resources/styles/app_colors.dart';
import '../../../widgets/global/public_button.dart';
import '../../../widgets/global/public_text.dart';
import '../../../widgets/global/public_text_form_field.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 80.h,
          title: PublicText(
            txt: S.of(context).editProfile,
            fw: FontWeight.bold,
            size: 22.sp,
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_outlined),
            color: AppColors.orangePrimary,
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 40.h),
            child: Column(
              children: [
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 50.w,
                      backgroundColor: AppColors.orangePrimary,
                      child: Image.asset(
                        Assets.imagesProfile,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      bottom: 2.h,
                      right: 2.w,
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          decoration: const BoxDecoration(
                            color: AppColors.orangePrimary,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.edit,
                            size: 18.w,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                24.ph,
                PublicTextFormField(
                  hint: 'Ahmed Arafat',
                  label: S.of(context).username,
                  keyboardtype: TextInputType.text,
                  controller: TextEditingController(),
                  validator: (name) {
                    if (name!.length < 3) {
                      return S.of(context).enterFirstName;
                    }
                    return null;
                  },
                ),
                24.ph,
                PublicTextFormField(
                  hint: "arafat11@gmail.com",
                  label: S.of(context).email,
                  keyboardtype: TextInputType.emailAddress,
                  controller: TextEditingController(),
                  showprefixIcon: true,
                  prefixIcon: Icons.email,
                  validator: (email) {
                    if (email!.isEmailValid()) {
                      return null;
                    }
                    return S.of(context).invalidEmailMeg;
                  },
                ),
                125.ph,

                PublicButton(
                  title: S.of(context).save,
                  width: double.infinity,
                  onPressed: () {},
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
