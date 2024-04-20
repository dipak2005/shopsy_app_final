// // ignore_for_file: prefer_const_constructors
//
//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../../controller/login_controller.dart';
// import '../../model/logn& signup.dart';
//
//
//
//
//
//
//
// class SignIn extends StatelessWidget {
//   final LoginController controller = Get.find<LoginController>();
//
//   SignIn({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         child: Form(
//           key: controller.gKey,
//           child: SingleChildScrollView(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 SizedBox(
//                   height: MediaQuery.sizeOf(context).height / 15,
//                 ),
//                 Center(
//                   child: Text(
//                     "Sign up with Email",
//                     style: TextStyle(
//                       fontSize:
//                       Theme.of(context).textTheme.headlineSmall?.fontSize,
//                       fontWeight: FontWeight.w900,
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: MediaQuery.sizeOf(context).height / 20,
//                 ),
//                 Text(
//                     "Get chanting with friend and family today by\n                   signing up for our chat app!"),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Align(
//                   alignment: Alignment(-0.8, 0),
//                   child: Text(
//                     "Your Name",
//                     style: TextStyle(
//                         fontSize:
//                         Theme.of(context).textTheme.bodyMedium?.fontSize,
//                         color: Theme.of(context).textTheme.bodyMedium?.color),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
                import 'package:flutter/material.dart';


//                 Align(
//                   alignment: Alignment(-0.8, 0),
//                   child: Text(
//                     "Your email",
//                     style: TextStyle(
//                         fontSize:
//                         Theme.of(context).textTheme.bodyMedium?.fontSize,
//                         color: Theme.of(context).textTheme.bodyMedium?.color),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 18.0),
//                   child: TextFormField(
//                     onFieldSubmitted: (value) {},
//                     controller: email,
//                     validator: (value) {
//                       if (value?.isEmpty ?? false) {
//                         return "* Plz Enter Your Email";
//                       } else if (!isEmail(value ?? "")) {
//                         return "* Invalid Email ";
//                       } else {
//                         return null;
//                       }
//                     },
//                     keyboardType: TextInputType.emailAddress,
//                     decoration: InputDecoration(
//                       hintText: "Enter Your Email",
//                       enabled: true,
//                       focusedBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(20),
//                           borderSide: BorderSide(color: Colors.green)),
//                       suffixIcon: Icon(Icons.mail, color: Colors.green),
//                       hintStyle: TextStyle(color: Colors.green),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Align(
//                   alignment: Alignment(-0.8, 0),
//                   child: Text(
//                     "Phone",
//                     style: TextStyle(
//                         fontSize:
//                         Theme.of(context).textTheme.bodyMedium?.fontSize,
//                         color: Theme.of(context).textTheme.bodyMedium?.color),
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 18.0),
//                   child: TextFormField(
//                     onFieldSubmitted: (value) {},
//                     controller: phone,
//                     validator: (value) {
//                       if (value?.isEmpty ?? false) {
//                         return "* Plz Enter Your Phone Number";
//                       } else if (value?.length != 10) {
//                         return "* Invalid Phone Number";
//                       } else {
//                         return null;
//                       }
//                     },
//                     keyboardType: TextInputType.phone,
//                     decoration: InputDecoration(
//                       prefix: Text("+91"),
//                       hintText: "Enter Your Phone",
//                       enabled: true,
//                       focusedBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(20),
//                           borderSide: BorderSide(color: Colors.green)),
//                       suffixIcon: Icon(Icons.mail, color: Colors.green),
//                       hintStyle: TextStyle(color: Colors.green),
//                     ),
//                   ),
//                 ),
//                 Align(
//                   alignment: Alignment(-0.8, 0),
//                   child: Text(
//                     "Password",
//                     style: TextStyle(
//                         fontSize:
//                         Theme.of(context).textTheme.bodyMedium?.fontSize,
//                         color: Theme.of(context).textTheme.bodyMedium?.color),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 18.0),
//                   child: TextFormField(
//                     keyboardType: TextInputType.visiblePassword,
//                     validator: (value) {
//                       controller.value?.value = value ?? "";
//                       if (value?.isEmpty ?? false) {
//                         return "Plz Enter Your Password";
//                       } else if (value?.contains("@") ?? false) {
//                         return null;
//                       } else {
//                         return "Not A Strong password";
//                       }
//                     },
//                     controller: password,
//                     onFieldSubmitted: (value) {},
//                     decoration: InputDecoration(
//                       hintText: "Enter Your Password",
//                       enabled: true,
//                       focusedBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(20),
//                           borderSide: BorderSide(color: Colors.green)),
//                       suffixIcon:
//                       Icon(Icons.password_outlined, color: Colors.green),
//                       hintStyle: TextStyle(color: Colors.green),
//                     ),
//                   ),
//                 ),
//                 Align(
//                   alignment: Alignment(-0.8, 0),
//                   child: Text(
//                     "confirm password ",
//                     style: TextStyle(
//                         fontSize:
//                         Theme.of(context).textTheme.bodyMedium?.fontSize,
//                         color: Theme.of(context).textTheme.bodyMedium?.color),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 // Padding(
//                 //   padding: const EdgeInsets.symmetric(horizontal: 18.0),
//                 //   child: TextFormField(
//                 //     keyboardType: TextInputType.visiblePassword,
//                 //     validator: (value) {
//                 //       if (value?.isEmpty ?? false) {
//                 //         return "Plz Enter Your Password";
//                 //       } else {
//                 //         return null;
//                 //       }
//                 //     },
//                 //     controller: newPassword,
//                 //     onFieldSubmitted: (value) {},
//                 //     decoration: InputDecoration(
//                 //       hintText: "ReEnter Your Password",
//                 //       enabled: true,
//                 //       focusedBorder: OutlineInputBorder(
//                 //           borderRadius: BorderRadius.circular(20),
//                 //           borderSide: BorderSide(color: Colors.green)),
//                 //       suffixIcon:
//                 //       Icon(Icons.password_outlined, color: Colors.green),
//                 //       hintStyle: TextStyle(color: Colors.green),
//                 //     ),
//                 //   ),
//                 // ),
//                 SizedBox(
//                   height: MediaQuery.sizeOf(context).height / 30,
//                 ),
//                 Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Obx(
//                           () => Checkbox(
//                         value: controller.isTerm.value,
//                         activeColor: Colors.green,
//                         onChanged: (value) {
//                           controller.isTerm.value = value ?? true;
//                         },
//                       ),
//                     ),
//                     Text.rich(
//                       TextSpan(children: [
//                         TextSpan(
//                             text: "I have read and agree to the",
//                             style: TextStyle(fontSize: 11)),
//                         TextSpan(
//                             text: "Term and Conditions",
//                             style: TextStyle(color: Colors.green, fontSize: 11))
//                       ]),
//                     ),
//                   ],
//                 ),
//                 ElevatedButton(
//                   style: ButtonStyle(
//                     backgroundColor: MaterialStatePropertyAll(Colors.green),
//                     shape: MaterialStatePropertyAll(RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(11))),
//                     fixedSize: MaterialStatePropertyAll(
//                       Size(MediaQuery.sizeOf(context).width / 1.1,
//                           MediaQuery.sizeOf(context).height / 17),
//                     ),
//                   ),
//                   onPressed: () {
//                     controller.goto();
//                   },
//                   child: Text(
//                     "Create account ",
//                     style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 18,
//                         fontWeight: FontWeight.w500),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   bool isEmail(String em) {
//     String p =
//         r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
//
//     RegExp regExp = RegExp(p);
//
//     return regExp.hasMatch(em);
//   }
// }
