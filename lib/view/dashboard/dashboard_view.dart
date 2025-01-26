
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:speedforce/utils/app_colors.dart';
import 'package:speedforce/utils/app_images.dart';
import 'package:speedforce/view/dashboard/home_view.dart';
import 'package:speedforce/view/dashboard/profile_view.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomeView(),
    const Center(child: Text('Jobs Page')),
    const Center(child: Text('Earnings Page')),
    const ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.grey,
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: 10.sp),
          unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w500,fontSize: 10.sp),
          backgroundColor: AppColors.whiteColor,
          items: [
            BottomNavigationBarItem(
              icon: _currentIndex == 0 ? SvgPicture.asset(AppImages.homeIcon, color: AppColors.primaryColor,) : SvgPicture.asset(AppImages.homeIcon),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: _currentIndex == 1 ? SvgPicture.asset(AppImages.jobIcon, color: AppColors.primaryColor,) : SvgPicture.asset(AppImages.jobIcon),
              label: 'Jobs',
            ),
            BottomNavigationBarItem(
              icon: _currentIndex == 2 ? SvgPicture.asset(AppImages.earningsIcon, color: AppColors.primaryColor,) : SvgPicture.asset(AppImages.earningsIcon),
              label: 'Earnings',
            ),
            BottomNavigationBarItem(
              icon: _currentIndex == 3 ? SvgPicture.asset(AppImages.profileIcon, color: AppColors.primaryColor,) : SvgPicture.asset(AppImages.profileIcon),
              label: 'Profile',
            ),
          ],
        ),
    );
  }
}
