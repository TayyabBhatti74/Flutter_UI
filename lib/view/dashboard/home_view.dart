import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:speedforce/controller/auth_controller.dart';
import 'package:speedforce/utils/app_colors.dart';
import 'package:speedforce/utils/app_fonts.dart';
import 'package:speedforce/utils/app_images.dart';
import 'package:speedforce/utils/app_strings.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  @override
  void initState() {
    // TODO: implement initState
    Get.find<AuthController>().apiGetUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return Get.find<AuthController>().userLoading.isTrue
            ?
        const Center(
          child: CircularProgressIndicator(
            color: AppColors.primaryColor,
            strokeCap: StrokeCap.round,
          ),
        )
            :
        SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 320.h,
                width: Get.width,
                decoration: const BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15)),
                ),
                child: Stack(
                  children: [
                    SvgPicture.asset("assets/icons/bg_box.svg"),
                    Positioned(
                      top: 50.h,
                      right: 0,
                      left: 0,
                      child: Container(
                        height: 75,
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        color: Colors.transparent,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Hello!",
                                  style: AppFonts.styleUrbanistBold25W700(
                                      AppColors.whiteColor),),
                                Text("${Get
                                    .find<AuthController>()
                                    .firstName} ${Get
                                    .find<AuthController>()
                                    .lastName}",
                                  style: AppFonts.styleUrbanistBold25W700(
                                      AppColors.whiteColor),),
                              ],
                            ),
                             CircleAvatar(
                              radius: 35,
                              backgroundImage: NetworkImage(Get.find<AuthController>().avatar.toString()),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 30.h,
                      right: 30.w,
                      left: 30.w,
                      child: Container(
                        height: 150,
                        padding: EdgeInsets.zero,
                        margin: EdgeInsets.zero,
                        decoration: const BoxDecoration(
                          color: AppColors.whiteColor,
                          borderRadius: BorderRadius.only(topLeft: Radius
                              .circular(30), bottomRight: Radius.circular(30)),
                        ),
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Positioned(
                              left: -5.w,
                              bottom: -9.h,
                              child: Align(
                                  alignment: Alignment.bottomLeft,
                                  child: SvgPicture.asset(
                                      "assets/icons/shape.svg")),
                            ),
                            Positioned(
                              left: 20.w,
                              bottom: 20.h,
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 5.h, horizontal: 10.w),
                                decoration: BoxDecoration(
                                  color: AppColors.greyA3D1FF,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: const Text("Detail"),
                              ),
                            ),
                            Positioned(
                                right: 10.w,
                                bottom: 10.h,
                                child: SvgPicture.asset(
                                  "assets/icons/person.svg", height: 120.h,)),
                            Positioned(
                              top: 10.h,
                              left: 20.w,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("My Earnings",
                                    style: AppFonts.styleUrbanistBold14W400(
                                        AppColors.blackColor),),
                                  Text("\$${Get.find<AuthController>().earnings}",
                                    style: AppFonts.styleUrbanistBold25W700(
                                        AppColors.primaryColor),),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildAvatar(""),
                    _buildAvatar(""),
                    _buildAvatar(""),
                    _buildAvatar(""),
                  ],
                ),
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 35.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildAvatar("",isLarge: true),
                    _buildAvatar("",isLarge: true),
                    _buildAvatar("",isLarge: true),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Column(
                  children: [
                    SizedBox(height: 20.h,),
                    Text(AppStrings.inviteYour, style: AppFonts.styleUrbanistBold25W700(AppColors.blackColor),textAlign: TextAlign.center,),
                    SizedBox(height: 10.h,),
                    Text(AppStrings.inviteYourDes, style: AppFonts.styleUrbanistBold14W400(AppColors.blackColor),textAlign: TextAlign.center,),
                    SizedBox(height: 10.h,),
                    GestureDetector(
                      onTap: (){},
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 10.h),
                        margin: EdgeInsets.symmetric(horizontal: 50.w,),
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Row(
                          children: [
                            SvgPicture.asset(AppImages.copyIcon),
                            SizedBox(width: 10.w,),
                            Text(AppStrings.copyReferral, style: AppFonts.styleUrbanistBold16W700(AppColors.whiteColor),),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h,),
                    Text(AppStrings.sendTo, style: AppFonts.styleUrbanistBold16W600(AppColors.blackColor),textAlign: TextAlign.center,),
                    SizedBox(height: 10.h,),
                    GestureDetector(
                      onTap: (){},
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 10.h),
                        margin: EdgeInsets.symmetric(horizontal: 50.w,),
                        decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                          border: Border.all(color: AppColors.primaryColor),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Row(
                          children: [
                            SvgPicture.asset(AppImages.sendIcon, fit: BoxFit.scaleDown,),
                            SizedBox(width: 10.w,),
                            Text(AppStrings.copyReferral, style: AppFonts.styleUrbanistBold16W700(AppColors.primaryColor),),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildAvatar(String imagePath, {bool isLarge = false}) {
    return CircleAvatar(
      radius: isLarge ? 30 : 20,
      backgroundImage: AssetImage(imagePath),
    );
  }

}
