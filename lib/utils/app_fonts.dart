import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_strings.dart';

class AppFonts{

  static TextStyle styleUrbanistBold25W700(Color color){
    return TextStyle(
        fontSize: 25.sp,
        fontWeight: FontWeight.w700,
        fontFamily: AppStrings.fontUrbanistBold,
        color: color
    );
  }

  static TextStyle styleUrbanistBold24W700(Color color){
    return TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeight.w700,
        fontFamily: AppStrings.fontUrbanistBold,
        color: color
    );
  }

  static TextStyle styleUrbanistBold16W700(Color color){
    return TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w700,
        fontFamily: AppStrings.fontUrbanistBold,
        color: color
    );
  }

  static TextStyle styleUrbanistBold16W600(Color color){
    return TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
        fontFamily: AppStrings.fontUrbanistMedium,
        color: color
    );
  }

  static TextStyle styleUrbanistBold14W400(Color color){
    return TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        fontFamily: AppStrings.fontUrbanistRegular,
        color: color
    );
  }

}