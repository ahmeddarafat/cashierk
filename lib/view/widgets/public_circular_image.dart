import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../resources/styles/app_colors.dart';
import '../../view_model/profile/profile/profile_cubit.dart';
import 'public_text.dart';

class PublicCircularImage extends StatelessWidget {
  final File? image;
  const PublicCircularImage({
    super.key,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      buildWhen: (_, current) => current is ChangeProfileImageState,
      builder: (context, state) {
        return Container(
          height: 140.w,
          width: 140.w,
          decoration: const BoxDecoration(
            color: AppColors.orangePrimary,
            shape: BoxShape.circle,
          ),
          child: image == null
              ? const Center(
                  child: PublicText(
                    txt: "no image",
                    color: AppColors.white,
                  ),
                )
              : ClipOval(
                  child: Image.file(
                    image!,
                    fit: BoxFit.cover,
                  ),
                ),
        );
      },
    );
  }
}
