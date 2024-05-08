import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../resources/styles/app_colors.dart';

enum ImageType { network, file, asset, none }

class PublicCircularImage extends StatelessWidget {
  final String? image;
  final ImageType type;
  final double? radius;
  const PublicCircularImage({
    super.key,
    this.image,
    this.radius,
    this.type = ImageType.none,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: radius ?? 140.w,
      width: radius ?? 140.w,
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(
        color: AppColors.white,
        shape: BoxShape.circle,
      ),
      child: _getImage(),
    );
  }

  Widget _getImage() {
    switch (type) {
      case ImageType.network:
        return _getNetworkImage();
      case ImageType.file:
        return _getFileImage();
      case ImageType.asset:
        return _getAssetImage();
      default:
        return _getNoneImage();
    }
  }

  Widget _getNoneImage() {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.white,
        border: Border.all(
          color: AppColors.grey,
          width: 1,
        ),
      ),
      child: Center(
        child: Icon(
          Iconsax.user,
          color: AppColors.grey,
          size: radius != null ? radius! * 0.6 : 120.w,
        ),
      ),
    );
  }

  ClipOval _getAssetImage() {
    return ClipOval(
      child: Image.asset(
        image!,
        fit: BoxFit.cover,
      ),
    );
  }

  ClipOval _getNetworkImage() {
    return ClipOval(
      child: Image.network(
        image!,
        fit: BoxFit.cover,
      ),
    );
  }

  ClipOval _getFileImage() {
    return ClipOval(
      child: Image.file(
        File(image!),
        fit: BoxFit.cover,
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// import '../../../../resources/styles/app_colors.dart';
// import '../../view_model/profile/profile/profile_cubit.dart';
// import 'public_text.dart';

// class PublicCircularImage extends StatelessWidget {
//   const PublicCircularImage({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<ProfileCubit, ProfileState>(
//       buildWhen: (_, current) => current is ChangeProfileImageState,
//       builder: (context, state) {
//         final bloc = context.read<ProfileCubit>();
//         return Container(
//           height: 140.w,
//           width: 140.w,
//           decoration: const BoxDecoration(
//             color: AppColors.orangePrimary,
//             shape: BoxShape.circle,
//           ),
//           child: bloc.image == null
//               ? const Center(
//                   child: PublicText(
//                     txt: "no image",
//                     color: AppColors.white,
//                   ),
//                 )
//               : ClipOval(
//                   child: Image.file(
//                     bloc.image!,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//         );
//       },
//     );
//   }
// }


