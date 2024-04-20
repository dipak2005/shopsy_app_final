// // ignore_for_file: prefer_const_constructors, avoid_print
//
//
//
//
//
//
// import 'package:flutter/cupertino.dart';
// import 'package:get/get.dart';
//
// import '../view/login/loginpage.dart';
// import '../view/login/signin.dart';
//
// class LoginController extends GetxController {
//   GlobalKey<FormState> gKey = GlobalKey<FormState>();
//   RxBool isTerm = RxBool(false);
//   RxString? value;
//   void goto() {
//     Get.to(() => LoginPage());
//   }
//
//   void goMail() {
//     Get.to(() => SignIn());
//   }
//
//   // void goLogin() {
//   //   if (gKey.currentState?.validate() ?? false) {
//   //     Get.to(() => Home());
//   //   }
//   //   mail.clear();
//   //   password.clear();
//   // }
//
//   // void goPassword() {
//   //   Get.to(() => ForgetPassword());
//   // }
//
//   // void googleSignIn() async {
//   //   User? user = FirebaseAuth.instance.currentUser;
//   //   if (user != null) {
//   //     Get.showSnackbar(GetSnackBar(
//   //       title: "Login",
//   //       backgroundColor: Colors.green,
//   //       duration: Duration(microseconds: 500),
//   //       message: "All Ready Exist",
//   //     ));
//   //     Get.off(() => HomePage());
//   //   } else {
//   //     var google = await GoogleSignIn().signIn();
//   //
//   //     var auth = await google?.authentication;
//   //     var credential = GoogleAuthProvider.credential(
//   //         accessToken: auth?.accessToken, idToken: auth?.idToken);
//   //
//   //     // must be
//   //     var data = await FirebaseAuth.instance.signInWithCredential(credential);
//   //     print("$credential");
//   //     User? userData = data.user;
//   //     // // AddUserModel().addUser(userData);
//   //     // if (filepath.value.isEmpty) {
//   //     //   AddUserModel().addUser(userData);
//   //     // }
//   //
//   //     Get.showSnackbar(GetSnackBar(
//   //       title: "Login",
//   //       backgroundColor: Colors.green,
//   //       duration: Duration(microseconds: 500),
//   //       message: "User Added Successfully",
//   //     ));
//   //     Get.off(() => HomePage());
//   //   }
//   // }
// }
