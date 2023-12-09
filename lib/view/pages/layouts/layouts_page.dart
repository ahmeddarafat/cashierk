import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:start_app/resources/constants/app_assets.dart';
import 'package:start_app/resources/styles/app_colors.dart';
import 'package:start_app/view/pages/favourites/favourites_page.dart';
import 'package:start_app/view/pages/profile/profile/profile_page.dart';
import 'package:start_app/view/pages/recepits/recepits/recepits_page.dart';

import '../home/discover/discover_page.dart';
import '../scan/scan/scan_page.dart';

class LayoutsPage extends StatefulWidget {
  const LayoutsPage({super.key});

  @override
  State<LayoutsPage> createState() => _LayoutsPageState();
}

class _LayoutsPageState extends State<LayoutsPage> {
  int selectedIndex = 0;
  List containScreen = [
    const DiscoverPage(),
    const RecepitsPage(),
    const ScanPage(),
    const FavouritesPage(),
    const ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: containScreen[selectedIndex],
      bottomNavigationBar: CircleNavBar(
        padding: EdgeInsets.only(left: 12.w, right: 12.w, bottom: 8.h),
        activeIndex: 2,
        color: AppColors.white,
        circleColor: AppColors.orangePrimary,
        shadowColor: AppColors.lightGrey,
        elevation: 2,
        height: 60.h,
        circleWidth: 50.w,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        cornerRadius: const BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
          bottomRight: Radius.circular(24),
          bottomLeft: Radius.circular(24),
        ),
        activeIcons: [
          SvgPicture.asset(Assets.iconsDiscovery, color: AppColors.orangePrimary),
          SvgPicture.asset(Assets.iconsReceipts, color: AppColors.orangePrimary),
          const Icon(Icons.qr_code_scanner_rounded, color: AppColors.white),
          const Icon(Icons.favorite, color: AppColors.orangePrimary),
          const Icon(Icons.person, color: AppColors.orangePrimary),
        ],
        inactiveIcons:  [
          SvgPicture.asset(Assets.iconsDiscovery, color: AppColors.orangePrimary),
          SvgPicture.asset(Assets.iconsReceipts, color: AppColors.orangePrimary),
          const Icon(Icons.qr_code_scanner_rounded, color: AppColors.white),
          const Icon(Icons.favorite, color: AppColors.orangePrimary),
          const Icon(Icons.person, color: AppColors.orangePrimary),
        ],
      ),
    );
  }
}
