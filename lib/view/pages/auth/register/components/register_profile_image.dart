import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../resources/styles/app_colors.dart';
import '../../../../../view_model/auth/register/register_cubit.dart';
import '../../../../widgets/public_circular_image.dart';

class RegisterProfileImage extends StatelessWidget {
  const RegisterProfileImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<RegisterCubit>();
    return Stack(
      children: [
        BlocBuilder<RegisterCubit, RegisterState>(
          buildWhen: (_, current) => current is ChangeProfileImageState,
          builder: (context, state) {
            return PublicCircularImage(
              radius: 100.r,
              image: bloc.image,
              type: bloc.image != null ? ImageType.file : ImageType.none,
            );
          },
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: InkWell(
            child: Container(
              padding: EdgeInsets.all(4.r),
              decoration: const BoxDecoration(
                color: AppColors.orangePrimary,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Iconsax.edit_2,
                size: 18.w,
                color: AppColors.white,
              ),
            ),
            onTap: () {
              bloc.pickImage(ImageSource.gallery);
            },
          ),
        ),
      ],
    );
  }
}
