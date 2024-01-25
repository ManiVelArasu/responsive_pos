import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:localization/localization.dart';
import 'package:provider/provider.dart';
import 'package:responsive_design/pallete.dart';
import 'package:responsive_design/providers/home_screen_provider.dart';
import 'package:responsive_design/providers/local_providers/app_local_provider.dart';
import 'package:responsive_design/providers/local_providers/local_provider.dart';
import 'package:responsive_design/widget/button_widget.dart';
import 'package:responsive_design/widget/custom_textfield.dart';
import 'package:responsive_design/widget/size.dart';

import '../../Utils/routes.dart';
import '../../helper/validate_helper.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  String? userNameError;
  String? emailError;
  String? phoneNumberError;
  String? passwordError;
  String? confirmPasswordError;

  final LocaleProvider _localeProvider = Get.find();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AppLocalProviders(
      child: (context, localProvider, snapshot) {
        return ChangeNotifierProvider(
          create: (_) => HomeScreenProvider(),
          builder: (context, provider) => Consumer<HomeScreenProvider>(
            builder: (context, provider, child) {
              Get.replace(provider);
              return Scaffold(
                backgroundColor: Pallete.whiteColor,
                body: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      child: Center(
                        child: Column(
                          children: [
                            Container(
                              height: size.height * 0.30,
                              width: size.width * 0.50,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/cts_logo.png'),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Text(
                              "login responsive screen",
                              style: Theme.of(context).textTheme.subtitle1?.copyWith(
                                fontSize: (size.height + size.width) / 2 * 0.07 / 2,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.grey,
                                    offset: Offset(0.0, 0.3), //(x,y)
                                    blurRadius: 1.0,
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                              ),
                              height: size.height * 0.50,
                              width: size.width * 0.40,
                              child: Padding(
                                padding: EdgeInsets.only(
                                  top: size.height * 0.04,
                                  left: size.width * 0.04,
                                  right: size.width * 0.04,
                                  bottom: size.height * 0.04,
                                ),
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      ResponsiveCustomTextField(
                                        title: 'UserName',
                                        controller:userNameController ,
                                        errorText: userNameError,
                                        onChanged: (value) {
                                          if (userNameError == null) return;
                                          userNameError = globalValidate(
                                            userNameController.text,
                                            0,
                                            0,
                                            false,
                                            "username".i18n(),
                                          );
                                        },
                                      ),
                                      ResponsiveCustomTextField(
                                        title: 'Email',
                                        errorText: emailError,
                                        controller:emailController ,
                                        onChanged: (value) {
                                          if (emailError == null) return;
                                          emailError = globalValidate(
                                            emailController.text,
                                            0,
                                            0,
                                            true,
                                            "email".i18n(),
                                          );

                                        },
                                      ),
                                      ResponsiveCustomTextField(
                                        title: 'PhoneNumber',
                                        errorText: phoneNumberError,
                                        controller:phoneNumberController ,
                                        onChanged: (value) {
                                          if (phoneNumberError == null) return;
                                          phoneNumberError = globalValidate(
                                            phoneNumberController.text,
                                            10,
                                            10,
                                            false,
                                            "username".i18n(),
                                          );
                                        },
                                      ),
                                      ResponsiveCustomTextField(
                                        title: "Password",
                                        errorText: passwordError,
                                        controller:passwordController ,
                                        isPassword: true,
                                        onChanged: (value) {
                                          if (passwordError == null) return;
                                          passwordError = globalValidate(
                                            passwordController.text,
                                            8,
                                            8,
                                            false,
                                            "password".i18n(),
                                          );
                                        },
                                      ),
                                      ResponsiveCustomTextField(
                                        title: 'ConfirmPassword',
                                        errorText: confirmPasswordError,
                                        controller: confirmPasswordController,
                                        isPassword: true,
                                        onChanged: (value) {
                                          confirmPasswordError = globalValidate(
                                            confirmPasswordController.text,
                                            8,
                                            8,
                                            false,
                                            "confirmPassword".i18n(),
                                          );
                                          setState(() {}); // Ensure the UI gets updated after the error changes.
                                        },
                                      ),

                                      Container(
                                        height: size.height * 0.05,
                                        width: size.width,
                                        margin: EdgeInsets.only(left: size.width * 0.01),
                                        child: Text(
                                          "Forget password?",
                                          style: TextStyle(
                                              fontSize: (size.height + size.width) / 2 * 0.03 / 2,
                                              color: Colors.blueAccent),
                                        ),
                                      ),
                                      ResponsiveButton(
                                        onTap: (){
                                          userNameError=   globalValidate(userNameController.text, 0, 0, false, "username");
                                          passwordError=   globalValidate(passwordController.text, 8, 8, false, "password");
                                          emailError=   globalValidate(emailController.text, 0, 0, true, "email");
                                          phoneNumberError=   globalValidate(phoneNumberController.text, 10, 10, false, "phoneNumber");
                                          confirmPasswordError=   globalValidate(confirmPasswordController.text, 8, 8, false, "confirmPassword");
                                          if (passwordController.text != confirmPasswordController.text) {
                                            confirmPasswordError = "Passwords do not match";
                                          } else {
                                            confirmPasswordError = null;
                                          }
                                          if (userNameError == null &&
                                              passwordError == null&&phoneNumberError==null&&confirmPasswordError==null&&emailError==null) {
                                            localProvider.navigateDeleteAll(
                                                AppRoutes.homeScreen);
                                          }
                                          setState(() {

                                          });
                                        },
                                        title: 'Sign In',
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
