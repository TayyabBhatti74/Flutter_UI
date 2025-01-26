import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:speedforce/view/auth/login_view.dart';
import '../utils/app_images.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(const Duration(seconds: 5),(){
      Get.offAll(()=> const LoginView());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          Center(child: Image.asset(AppImages.appLogoPng, scale: 5,)),
          const Spacer(),
          Lottie.asset(AppImages.appLoading,height: 80.h),
          SizedBox(height: 60.h,),
        ],
      ),
    );
  }
}
