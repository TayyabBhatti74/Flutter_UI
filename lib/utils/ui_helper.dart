import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import 'app_colors.dart';
import 'app_fonts.dart';
import 'app_images.dart';

class UiHelper{

  static customButton({required String btnText, required VoidCallback onTap, double radius = 16,double pH = 10, double pV = 15,}){
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: pH.w,vertical: pV.h),
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(radius),
        ),
        child: Center(child: Text(btnText, style: AppFonts.styleUrbanistBold16W700(AppColors.whiteColor),),),
      ),
    );
  }

  static Widget customTextField({
    required TextEditingController controller,
    required String labelText,
    FormFieldValidator<String>? validator,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 5.h),
      decoration: BoxDecoration(
        color: AppColors.textFieldColorFAFAFA,
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextFormField(
        controller: controller,
        cursorColor: AppColors.primaryColor,
        style: AppFonts.styleUrbanistBold14W400(AppColors.blackColor),
        decoration: InputDecoration(
          hintText: labelText,
          hintStyle: AppFonts.styleUrbanistBold14W400(AppColors.grey9E9E9E),
          border: InputBorder.none,
          isDense: true,
          contentPadding: EdgeInsets.symmetric(vertical: 12.h,horizontal: 20.w),
        ),
        validator: validator,
      ),
    );
  }

  static Widget customTextFieldSuffixIcon({
    required TextEditingController controller,
    required String labelText,
    required Widget suffixIcon,
    FormFieldValidator<String>? validator,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 5.h),
      decoration: BoxDecoration(
        color: AppColors.textFieldColorFAFAFA,
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextFormField(
        controller: controller,
        cursorColor: AppColors.primaryColor,
        style: AppFonts.styleUrbanistBold14W400(AppColors.blackColor),
        decoration: InputDecoration(
          hintText: labelText,
          hintStyle: AppFonts.styleUrbanistBold14W400(AppColors.grey9E9E9E),
          border: InputBorder.none,
          isDense: true,
          suffixIcon: suffixIcon,
          contentPadding: EdgeInsets.symmetric(vertical: 12.h,horizontal: 20.w),
        ),
        validator: validator,
      ),
    );
  }

  static Widget customEmailTextField({
    required TextEditingController controller,
    required Widget icon,
    required String labelText,
    FormFieldValidator<String>? validator,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 5.h),
      decoration: BoxDecoration(
        color: AppColors.textFieldColorFAFAFA,
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextFormField(
        controller: controller,
        cursorColor: AppColors.primaryColor,
        keyboardType: TextInputType.emailAddress,
        style: AppFonts.styleUrbanistBold14W400(AppColors.blackColor),
        decoration: InputDecoration(
          hintText: labelText,
          hintStyle: AppFonts.styleUrbanistBold14W400(AppColors.grey9E9E9E),
          border: InputBorder.none,
          prefixIcon: icon,
          isDense: true,
          contentPadding: EdgeInsets.symmetric(vertical: 12.h),
        ),
        validator: validator,
      ),
    );
  }

  static customPassTextField({
    required TextEditingController controller,
    required bool obscureText,
    required bool isPasswordVisible,
    required VoidCallback onPress,
    String hintText = "Password",
    FormFieldValidator<String>? validator,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 5.h),
      decoration: BoxDecoration(
        color: AppColors.textFieldColorFAFAFA,
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextFormField(
        obscureText: obscureText,
        controller: controller,
        cursorColor: AppColors.primaryColor,
        style: AppFonts.styleUrbanistBold14W400(AppColors.blackColor),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: AppFonts.styleUrbanistBold14W400(AppColors.grey9E9E9E),
          prefixIcon: SvgPicture.asset(AppImages.lockIcon, fit: BoxFit.scaleDown, color: AppColors.purple704B8D,),
          isDense: true,
          contentPadding: EdgeInsets.symmetric(vertical: 12.h),
          suffixIcon: GestureDetector(
            onTap: onPress,
            child: isPasswordVisible
                ? SvgPicture.asset(AppImages.unHideIcon, fit: BoxFit.scaleDown, color: AppColors.purple704B8D,)
                : SvgPicture.asset(AppImages.hideIcon, fit: BoxFit.scaleDown, color: AppColors.purple704B8D,),
          ),
          border: InputBorder.none,
        ),
        validator: validator,
      ),
    );
  }

  static customNumTextField({required TextEditingController controller,required Key key,bool isEditable = true,}){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 5.h),
      decoration: BoxDecoration(
        color: AppColors.textFieldColorFAFAFA,
        borderRadius: BorderRadius.circular(12),
      ),
      child: IntlPhoneField(
        key: key,
        style: AppFonts.styleUrbanistBold14W400(AppColors.blackColor,),
        cursorColor: AppColors.primaryColor,
        dropdownTextStyle: AppFonts.styleUrbanistBold14W400(AppColors.grey9E9E9E,),
        dropdownIconPosition: IconPosition.trailing,
        dropdownIcon: const Icon(Icons.keyboard_arrow_down_rounded, color: AppColors.greyA3D1FF,),
        flagsButtonPadding: EdgeInsets.only(left: 20.w),
        decoration: InputDecoration(
          hintText: 'Phone Number',
          hintStyle: AppFonts.styleUrbanistBold14W400(AppColors.grey9E9E9E,),
          counterText: "",
          isDense: true,
          contentPadding: EdgeInsets.symmetric(vertical: 12.h),
          border: InputBorder.none,
        ),
        initialCountryCode: 'US',
        onChanged: isEditable
            ? (phone) {
          controller.text = phone.completeNumber;
        }
            : null,
      ),
    );
  }


}