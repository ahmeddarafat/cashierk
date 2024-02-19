import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../data/data_source/local/app_prefs.dart';
import '../../../../resources/extensions/app_extensions.dart';
import '../../../../resources/service_locator/service_locator.dart';
import '../../../../view_model/profile/profile/profile_cubit.dart';

import '../../../../resources/localization/generated/l10n.dart';
import '../../../../resources/styles/app_colors.dart';
import '../../../widgets/public_button.dart';
import '../../../widgets/public_circular_image.dart';
import '../../../widgets/public_text.dart';
import '../../../widgets/public_text_form_field.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late final AppPrefs appPrefs;
  late final ({String email, String name, String phone}) userInfo;
  late final ProfileCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = ProfileCubit.getInstance(context);
    cubit.init();
    appPrefs = getIt<AppPrefs>();
    userInfo = appPrefs.getUserInfo();
  }

  @override
  void dispose() {
    cubit.dispose();
    super.dispose();
  }

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
            child: Form(
              key: cubit.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Stack(
                      children: [
                        const PublicCircularImage(),
                        Positioned(
                          bottom: 2.h,
                          right: 2.w,
                          child: InkWell(
                            onTap: () {
                              cubit.pickImage(ImageSource.gallery);
                            },
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
                  ),
                  24.ph,

                  /// Username
                  PublicText(
                    txt: S.of(context).username,
                    fw: FontWeight.w500,
                  ),
                  PublicTextFormField(
                    hint: userInfo.name,
                    keyboardtype: TextInputType.text,
                    controller: cubit.nameController,
                    validator: (name) {
                      if (name!.length < 3) {
                        return S.of(context).enterFirstName;
                      }
                      return null;
                    },
                  ),
                  24.ph,

                  /// Email
                  PublicText(
                    txt: S.of(context).email,
                    fw: FontWeight.w500,
                  ),
                  PublicTextFormField(
                    hint: userInfo.email,
                    keyboardtype: TextInputType.emailAddress,
                    controller: cubit.emailController,
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
                    onPressed: () {
                      // To dismiss keyboard
                      FocusScope.of(context).unfocus();
                      cubit.editUserInfo();
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
