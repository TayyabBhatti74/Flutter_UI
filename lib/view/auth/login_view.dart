import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:speedforce/utils/app_colors.dart';
import 'package:speedforce/utils/app_fonts.dart';
import 'package:speedforce/utils/app_strings.dart';
import 'package:speedforce/utils/ui_helper.dart';
import 'package:speedforce/view/auth/signup_view.dart';
import 'package:speedforce/view/dashboard/dashboard_view.dart';

import '../../controller/auth_controller.dart';
import '../../utils/app_images.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final AuthController controller = Get.put(AuthController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Form(
          key: _formKey,
          child: Obx(() {
            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 0.16.sh,),
                  Center(child: Image.asset(AppImages.appLogoPng, scale: 4,)),
                  SizedBox(height: 10.h,),
                  Text(AppStrings.welcomeBack,
                    style: AppFonts.styleUrbanistBold25W700(
                        AppColors.blackColor),),
                  SizedBox(height: 20.h,),
                  UiHelper.customEmailTextField(
                    controller: emailController,
                    icon: SvgPicture.asset(
                        AppImages.emailIcon, fit: BoxFit.scaleDown),
                    labelText: AppStrings.email,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email is required';
                      }
                      String emailPattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
                      RegExp regex = RegExp(emailPattern);
                      if (!regex.hasMatch(value)) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20.h,),
                  UiHelper.customPassTextField(
                    controller: passController,
                    obscureText: !controller.isPasswordVisible.value,
                    isPasswordVisible: controller.isPasswordVisible.value,
                    onPress: controller.togglePasswordVisibility,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password is required';
                      }
                      if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20.h,),
                  GestureDetector(
                    onTap: controller.toggleCheck,
                    child: Padding(
                      padding: EdgeInsets.only(left: 10.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              height: 18.h,
                              width: 18.w,
                              decoration: BoxDecoration(
                                color: controller.isChecked.value
                                    ? AppColors.primaryColor
                                    : AppColors.whiteColor,
                                borderRadius: BorderRadius.circular(5.r),
                                border: Border.all(width: 2, color: controller.isChecked.value
                                    ? AppColors.primaryColor
                                    : AppColors.primaryColor),
                              ),
                              child: Center(
                                  child: Icon(Icons.done_rounded, color: controller.isChecked.value
                                      ? AppColors.whiteColor
                                      : AppColors.whiteColor, size: 8.h,))
                          ),
                          SizedBox(
                            width: 7.w,
                          ),
                          Text(AppStrings.rememberMe,
                              style: AppFonts.styleUrbanistBold14W400(AppColors.blackColor)),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h,),
                  UiHelper.customButton(
                      pV: 14, btnText: AppStrings.login, onTap: () {
                    if (_formKey.currentState!.validate()) {
                      if(emailController.text == "user@speedforce.com" && passController.text == "password"){
                        Get.offAll(()=> const DashboardView());
                      }else{
                        Get.snackbar(
                          "Error",
                          "Invalid Credential",
                          snackPosition: SnackPosition.BOTTOM,
                          colorText: Colors.black,
                          borderRadius: 10,
                        );
                      }
                    } else {
                      if (kDebugMode) {
                        print('Validation failed');
                      }
                    }
                  }),
                  SizedBox(height: 20.h,),
                  Text(AppStrings.forgotPassword, style: AppFonts.styleUrbanistBold16W600(AppColors.primaryColor),),
                  SizedBox(height: 20.h,),
                  Row(
                    children: [
                      const Expanded(
                        child: Divider(
                          color: AppColors.greyEEEEEE,
                          thickness: 1,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          AppStrings.continueWith,
                          style: AppFonts.styleUrbanistBold14W400(AppColors.grey9E9E9E),
                        ),
                      ),
                      const Expanded(
                        child: Divider(
                          color: AppColors.greyEEEEEE,
                          thickness: 1,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 35.w,vertical: 15.h),
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
                        child: Center(
                          child: SvgPicture.asset(AppImages.facebookIcon,),
                        ),
                      ),
                      SizedBox(width: 20.w,),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 35.w,vertical: 15.h),
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
                        child: Center(
                          child: SvgPicture.asset(AppImages.googleIcon,),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(AppStrings.noAccount, style: AppFonts.styleUrbanistBold14W400(AppColors.grey9E9E9E),),
                      GestureDetector(
                          onTap: (){
                            Get.to(()=> const SignupView());
                          },
                          child: Text(AppStrings.signUp, style: AppFonts.styleUrbanistBold14W400(AppColors.primaryColor),)),
                    ],
                  ),
                  SizedBox(height: 50.h,),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
