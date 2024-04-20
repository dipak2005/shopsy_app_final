// // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
//
//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:shopsy_app/view/login/signin.dart';
//
// import '../../controller/login_controller.dart';
//
// class LoginPage extends StatelessWidget {
//   final LoginController controller = Get.put(LoginController());
//
//   LoginPage({super.key});
//
//   TextEditingController email = TextEditingController();
//
//   TextEditingController password = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: Container(
//         height: MediaQuery.sizeOf(context).height,
//         width: MediaQuery.sizeOf(context).width,
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               "Log in to Shopshy",
//               style: TextStyle(
//                   fontSize: Theme.of(context).textTheme.headlineSmall?.fontSize,
//                   fontWeight: FontWeight.w900,
//                   color: Colors.white),
//             ),
//             SizedBox(
//               height: MediaQuery.sizeOf(context).height / 12,
//             ),
//             Image.asset("assets/log.png"),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 CircleAvatar(
//                   backgroundColor: Colors.black,
//                   foregroundColor: Colors.white,
//                   radius: 35,
//                   child: InkWell(
//                     onTap: () {},
//                     child: CircleAvatar(
//                       backgroundColor: Colors.white,
//                       backgroundImage: AssetImage("assets/face.png"),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   width: 20,
//                 ),
//                 CircleAvatar(
//                   backgroundColor: Colors.black,
//                   foregroundColor: Colors.white,
//                   radius: 35,
//                   child: InkWell(
//                     onTap: () {
//                       // controller.googleSignIn();
//                     },
//                     child: CircleAvatar(
//                       backgroundColor: Colors.black,
//                       radius: 25,
//                       backgroundImage: AssetImage("assets/google.png"),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             Text(
//               "---------------------------------- OR --------------------------------",
//               style: TextStyle(
//                   fontWeight: Theme.of(context).textTheme.bodySmall?.fontWeight,
//                   color: Colors.white),
//             ),
//             ElevatedButton(
//               style: ButtonStyle(
//                   elevation: MaterialStatePropertyAll(4),
//                   fixedSize: MaterialStatePropertyAll(Size(
//                       MediaQuery.sizeOf(context).width / 1.2,
//                       MediaQuery.sizeOf(context).height / 15))),
//               onPressed: () {
//                 Get.to(() => SignIn());
//               },
//               child: Text(
//                 "Sign up with mail ",
//                 style: TextStyle(
//                     color: Colors.black,
//                     fontWeight: FontWeight.w700,
//                     fontSize: 18),
//               ),
//             ),
//             TextButton(
//                 onPressed: () {
//                   Get.to(() => SignIn());
//                 },
//                 child: Text(
//                   "Existing account? Log in",
//                   style: TextStyle(color: Colors.white),
//                 ))
//           ],
//         ),
//       ),
//     );
//   }
// }
