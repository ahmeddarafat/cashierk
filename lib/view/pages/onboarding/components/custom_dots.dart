part of '../onboarding_page.dart';

class CustomDots extends StatelessWidget {
  final int myindex;
  const CustomDots({super.key, required this.myindex});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80.w,
      height: 20.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildDot(0),
          _buildDot(1),
          _buildDot(2),
        ],
      ),
    );
  }

  Widget _buildDot(int index) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.orangePrimary),
        color: index == myindex ? AppColors.orangePrimary : AppColors.white,
      ),
    );
  }
}
