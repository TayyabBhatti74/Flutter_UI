
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';
import 'package:speedforce/utils/app_images.dart';

import '../../controller/auth_controller.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_fonts.dart';
import '../../utils/app_strings.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        surfaceTintColor: AppColors.whiteColor,
        title: Text(AppStrings.myProfile, style: AppFonts.styleUrbanistBold24W700(AppColors.blackColor),),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.w),
            child: const Icon(Icons.menu),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.center,
                clipBehavior: Clip.none,
                children: [
                  Container(
                      color: Colors.transparent,
                      width: Get.width,
                      child: SvgPicture.asset(AppImages.dotsBg, fit: BoxFit.contain,)),
                  Center(
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        CircleAvatar(
                          radius: 38.r,
                          backgroundImage: NetworkImage(Get.find<AuthController>().avatar.toString()),
                          backgroundColor: Colors.grey.withOpacity(0.2),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: GestureDetector(
                            onTap: () {
          
                            },
                            child: Container(
                              height: 18.h,
                              width: 18.w,
                              decoration: BoxDecoration(
                                color: AppColors.primaryColor,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: const Icon(Icons.edit,color: AppColors.whiteColor,size: 12,),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                      bottom: 0,
                      child: Text("${Get.find<AuthController>().firstName.toString()} ${Get.find<AuthController>().lastName.toString()}", style: AppFonts.styleUrbanistBold16W700(AppColors.blackColor),)),
                  Positioned(
                      bottom: -20.h,
                      child: Text("${Get.find<AuthController>().email.toString()}", style: AppFonts.styleUrbanistBold14W400(AppColors.blackColor),)),
                ],
              ),
              SizedBox(height: 50.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 40.w,vertical: 15.h),
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          blurRadius: 60,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Text(AppStrings.earnings, style: AppFonts.styleUrbanistBold14W400(AppColors.grey9E9E9E),),
                        Text("\$${Get.find<AuthController>().earnings}",
                          style: AppFonts.styleUrbanistBold16W700(
                              AppColors.primaryColor),),
                      ],
                    ),
                  ),
                  SizedBox(width: 20.w,),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 40.w,vertical: 15.h),
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          blurRadius: 60,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Text(AppStrings.ratings, style: AppFonts.styleUrbanistBold14W400(AppColors.grey9E9E9E),),
                        Row(
                          children: [
                            SvgPicture.asset(AppImages.starIcons),
                            SizedBox(width: 5.w,),
                            Text("${Get.find<AuthController>().ratings}", style: AppFonts.styleUrbanistBold16W700(
                                  AppColors.primaryColor),),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h,),
              Text(AppStrings.aboutMe, style: AppFonts.styleUrbanistBold16W700(AppColors.blackColor),),
              const ReadMoreText(
                AppStrings.showMore,
                trimMode: TrimMode.Line,
                trimLines: 2,
                colorClickableText: AppColors.primaryColor,
                trimCollapsedText: 'view more...',
                trimExpandedText: 'Show less',
                moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.primaryColor),
          ),
              SizedBox(height: 10.h,),
              const Divider(height: 5, color: AppColors.greyEEEEEE,),
              SizedBox(height: 10.h,),
              rowTile(imagePath: AppImages.locationIcons, text: AppStrings.businessLocation),
              SizedBox(height: 10.h,),
              const Divider(height: 5, color: AppColors.greyEEEEEE,),
              SizedBox(height: 10.h,),
              rowTile(imagePath: AppImages.earningsIcon, text: AppStrings.bookings),
              SizedBox(height: 10.h,),
              const Divider(height: 5, color: AppColors.greyEEEEEE,),
              SizedBox(height: 10.h,),
              rowTile(imagePath: AppImages.locationIcons, text: AppStrings.myServices),
              SizedBox(height: 50.h,),
            ],
          ),
        ),
      ),
    );
  }

  Widget rowTile({required String imagePath, required String text}){
    return Row(
      children: [
        Expanded(
          child: Row(
            children: [
              SvgPicture.asset(imagePath, color: AppColors.blackColor,),
              SizedBox(width: 10.w,),
              Text(text, style: AppFonts.styleUrbanistBold16W600(AppColors.blackColor),),
            ],
          ),
        ),
        const Icon(Icons.arrow_forward_ios, color: AppColors.blue0A84FF,size: 20,),
      ],
    );
  }

}
