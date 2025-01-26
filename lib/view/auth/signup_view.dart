import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:speedforce/utils/app_fonts.dart';
import 'package:speedforce/utils/app_strings.dart';
import 'package:speedforce/utils/ui_helper.dart';
import 'package:speedforce/view/auth/login_view.dart';
import 'package:speedforce/view/dashboard/dashboard_view.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_images.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController numController = TextEditingController();
  GlobalKey fieldKey = GlobalKey();

  String? selectedGender;
  final List<String> genders = [
    'Male',
    'Female',
    'Others',
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        leading: GestureDetector(
          onTap: (){Get.back();},
          child: const Icon(Icons.arrow_back, color: AppColors.blackColor,),
        ),
        title: Text(AppStrings.createAccount, style: AppFonts.styleUrbanistBold16W700(AppColors.blackColor),),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 50.h,
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: TabBar(
                controller: _tabController,
                indicatorSize: TabBarIndicatorSize.tab,
                dividerColor: Colors.transparent,
                indicator: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                labelColor: AppColors.whiteColor,
                unselectedLabelColor: AppColors.primaryColor,
                labelStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                unselectedLabelStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                tabs: const [
                  Tab(text: AppStrings.consumer),
                  Tab(text: AppStrings.serviceProvider),
                ],
              ),
            ),
            SizedBox(height: 20.h,),
            Expanded(
              child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                controller: _tabController,
                children: [
                  consumerView(),
                  serviceProviderView(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget consumerView(){
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            UiHelper.customTextField(
                controller: firstNameController,
                labelText: AppStrings.firstName,
                validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'First Name is required';
                }
                return null;
              },
            ),
            SizedBox(height: 20.h,),
            UiHelper.customTextField(
                controller: lastNameController,
                labelText: AppStrings.lastName,
                validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Last Name is required';
                }
                return null;
              },
            ),
            SizedBox(height: 20.h,),
            UiHelper.customTextFieldSuffixIcon(
                controller: emailController,
                labelText: AppStrings.email,
                suffixIcon: SvgPicture.asset(
                AppImages.emailSuffixIcon, fit: BoxFit.scaleDown),
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
            Container(
              decoration: BoxDecoration(
                color: AppColors.textFieldColorFAFAFA,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 5.h),
              child: Expanded(
                child: DropdownButtonFormField<String>(
                  value: selectedGender,
                  style: AppFonts.styleUrbanistBold14W400(AppColors.blackColor),
                  isDense: true  ,
                  hint: Text(
                    AppStrings.gender,
                    style: AppFonts.styleUrbanistBold14W400(AppColors.grey9E9E9E),
                  ),
                  items: genders.map((model) {
                    return DropdownMenuItem<String>(
                      value: model,
                      child: Text(model),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedGender = value;
                    });
                  },
                  dropdownColor: Colors.white,
                  alignment: AlignmentDirectional.centerStart,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                  icon: SvgPicture.asset(
                      AppImages.dropDownIcon, fit: BoxFit.scaleDown),
                ),
              ),
            ),
            SizedBox(height: 20.h,),
            UiHelper.customNumTextField(controller: numController,key: fieldKey),
            SizedBox(height: 20.h,),
            UiHelper.customTextFieldSuffixIcon(
                controller: passwordController,
                labelText: AppStrings.password,
                suffixIcon: SvgPicture.asset(
                AppImages.suffixLockIcon, fit: BoxFit.scaleDown),
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
            UiHelper.customTextFieldSuffixIcon(
                controller: confirmPasswordController,
                labelText: AppStrings.confirmPassword,
                suffixIcon: SvgPicture.asset(
                AppImages.suffixLockIcon, fit: BoxFit.scaleDown),
                validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Confirm Password is required';
                }
                if (value.length < 6) {
                  return 'Password must be at least 6 characters';
                }
                return null;
              },
            ),
            SizedBox(height: 20.h,),
            Wrap(
              children: [
                Text(AppStrings.byContinuing, style: AppFonts.styleUrbanistBold14W400(AppColors.grey9E9E9E),),
                Text(AppStrings.termsService, style: AppFonts.styleUrbanistBold14W400(AppColors.purple704B8D),),
                Text(AppStrings.and, style: AppFonts.styleUrbanistBold14W400(AppColors.grey9E9E9E),),
                Text(AppStrings.privacyPolicy, style: AppFonts.styleUrbanistBold14W400(AppColors.purple704B8D),),
              ],
            ),
            SizedBox(height: 20.h,),
            UiHelper.customButton(
                pV: 14, btnText: AppStrings.signUp, onTap: () {
              if (_formKey.currentState!.validate()) {
                Get.offAll(()=> const DashboardView());
              } else {
                if (kDebugMode) {
                  print('Validation failed');
                }
              }
            }),
            SizedBox(height: 20.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(AppStrings.alreadyAccount, style: AppFonts.styleUrbanistBold14W400(AppColors.grey9E9E9E),),
                GestureDetector(
                    onTap: (){
                      Get.to(()=> const LoginView());
                    },
                    child: Text(AppStrings.login, style: AppFonts.styleUrbanistBold14W400(AppColors.greyA3D1FF),)),
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
            SizedBox(height: 50.h,),
          ],
        ),
      ),
    );
  }

  Widget serviceProviderView(){
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            UiHelper.customTextField(
              controller: firstNameController,
              labelText: AppStrings.firstName,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'First Name is required';
                }
                return null;
              },
            ),
            SizedBox(height: 20.h,),
            UiHelper.customTextField(
              controller: lastNameController,
              labelText: AppStrings.lastName,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Last Name is required';
                }
                return null;
              },
            ),
            SizedBox(height: 20.h,),
            UiHelper.customTextFieldSuffixIcon(
              controller: emailController,
              labelText: AppStrings.email,
              suffixIcon: SvgPicture.asset(
                  AppImages.emailSuffixIcon, fit: BoxFit.scaleDown),
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
            Container(
              decoration: BoxDecoration(
                color: AppColors.textFieldColorFAFAFA,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 5.h),
              child: Expanded(
                child: DropdownButtonFormField<String>(
                  value: selectedGender,
                  style: AppFonts.styleUrbanistBold14W400(AppColors.blackColor),
                  isDense: true  ,
                  hint: Text(
                    AppStrings.gender,
                    style: AppFonts.styleUrbanistBold14W400(AppColors.grey9E9E9E),
                  ),
                  items: genders.map((model) {
                    return DropdownMenuItem<String>(
                      value: model,
                      child: Text(model),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedGender = value;
                    });
                  },
                  dropdownColor: Colors.white,
                  alignment: AlignmentDirectional.centerStart,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                  icon: SvgPicture.asset(
                      AppImages.dropDownIcon, fit: BoxFit.scaleDown),
                ),
              ),
            ),
            SizedBox(height: 20.h,),
            UiHelper.customNumTextField(controller: numController,key: fieldKey),
            SizedBox(height: 20.h,),
            UiHelper.customTextFieldSuffixIcon(
              controller: passwordController,
              labelText: AppStrings.password,
              suffixIcon: SvgPicture.asset(
                  AppImages.suffixLockIcon, fit: BoxFit.scaleDown),
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
            UiHelper.customTextFieldSuffixIcon(
              controller: confirmPasswordController,
              labelText: AppStrings.confirmPassword,
              suffixIcon: SvgPicture.asset(
                  AppImages.suffixLockIcon, fit: BoxFit.scaleDown),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Confirm Password is required';
                }
                if (value.length < 6) {
                  return 'Password must be at least 6 characters';
                }
                return null;
              },
            ),
            SizedBox(height: 20.h,),
            Wrap(
              children: [
                Text(AppStrings.byContinuing, style: AppFonts.styleUrbanistBold14W400(AppColors.grey9E9E9E),),
                Text(AppStrings.termsService, style: AppFonts.styleUrbanistBold14W400(AppColors.purple704B8D),),
                Text(AppStrings.and, style: AppFonts.styleUrbanistBold14W400(AppColors.grey9E9E9E),),
                Text(AppStrings.privacyPolicy, style: AppFonts.styleUrbanistBold14W400(AppColors.purple704B8D),),
              ],
            ),
            SizedBox(height: 20.h,),
            UiHelper.customButton(
                pV: 14, btnText: AppStrings.signUp, onTap: () {
              if (_formKey.currentState!.validate()) {
                Get.offAll(()=> const DashboardView());
              } else {
                if (kDebugMode) {
                  print('Validation failed');
                }
              }
            }),
            SizedBox(height: 20.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(AppStrings.alreadyAccount, style: AppFonts.styleUrbanistBold14W400(AppColors.grey9E9E9E),),
                GestureDetector(
                    onTap: (){
                      Get.to(()=> const LoginView());
                    },
                    child: Text(AppStrings.login, style: AppFonts.styleUrbanistBold14W400(AppColors.greyA3D1FF),)),
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
            SizedBox(height: 50.h,),
          ],
        ),
      ),
    );
  }

}
