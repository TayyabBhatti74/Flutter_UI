
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speedforce/model/login_model.dart';

import '../network/network_call.dart';
import '../utils/app_routes.dart';

class AuthController extends GetxController implements GetxService{
  var isPasswordVisible = false.obs;
  var isChecked = false.obs;
  RxBool userLoading = false.obs;
  RxString firstName = "".obs;
  RxString lastName = "".obs;
  RxString email = "".obs;
  RxString avatar = "".obs;
  RxString earnings = "".obs;
  RxString ratings = "".obs;
  RxString bio = "".obs;

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void toggleCheck() {
    isChecked.value = !isChecked.value;
  }

  apiGetUser()async{
    userLoading.value = true;
    ApiResponse apiResponse = await NetworkCall.getApiCall(ApiRoutes.baseUrl + ApiRoutes.apiLogin);
    userLoading.value = false;
    if (kDebugMode) {
      print("apiResponse ${apiResponse.responseString}");
    }
    if(apiResponse.done ?? false){
      LoginModel loginModel = LoginModel.fromRawJson(apiResponse.responseString ?? "");
      if(loginModel.status == "success"){
        email.value = loginModel.data!.email.toString();
        firstName.value = loginModel.data!.firstName.toString();
        lastName.value = loginModel.data!.lastName.toString();
        avatar.value = loginModel.data!.avatar.toString();
        earnings.value = loginModel.data!.earnings.toString();
        ratings.value = loginModel.data!.ratings.toString();
        bio.value = loginModel.data!.bio.toString();
      }else{
        Get.snackbar(
          "Error",
          loginModel.message.toString(),
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.black,
          borderRadius: 10,
        );
      }
    }else{
      Get.snackbar(
        "Error",
        "Something went wrong",
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.black,
        borderRadius: 10,
      );
    }
  }

}