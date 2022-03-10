import 'package:flutter/material.dart';
import 'package:flutterproject/Constant/app_assets.dart';
import 'package:flutterproject/Constant/app_colors.dart';
import 'package:flutterproject/Constant/globals.dart';
import 'package:flutterproject/Utilities/utilities.dart';
import 'package:flutterproject/Widgets/buttons/custom_button.dart';
import 'package:flutterproject/Widgets/buttons/custom_text_button.dart';
import 'package:flutterproject/Widgets/custom_rich_text.dart';
import 'package:flutterproject/Widgets/custom_text_field.dart';

class SignIn extends StatefulWidget {
  SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  String _passwordIcon = AppIcons.eye;
  bool _hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColors.bgColor,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
            // image: DecorationImage(
            //   image: AssetImage(
            //     AppImages.bg1,
            //   ),
            //   fit: BoxFit.fill,
            // ),
            ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(height: 30),
                    Text(
                      'Welcome back!',
                      style: Utilities.setTextStyle(24,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(height: 30),
                    CustomTextField(
                      hintText: 'Email',
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) => value!.trim().isEmpty
                          ? 'Please enter email'
                          : !(RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(value))
                              ? 'Please enter valid email'
                              : null,
                    ),
                    SizedBox(height: 20),
                    CustomTextField(
                      hintText: 'Password',
                      controller: _passwordController,
                      isPasswordField: _hidePassword,
                      suffixIcon: _passwordIcon,
                      iconTap: () {
                        setState(() {
                          _hidePassword = !_hidePassword;
                          if (_hidePassword) {
                            _passwordIcon = AppIcons.eye;
                          } else {
                            _passwordIcon = AppIcons.noEye;
                          }
                        });
                      },
                      validator: (value) => value!.trim().isEmpty
                          ? 'Please enter password'
                          : value.trim().length < 8
                              ? 'password is at least 8 characters'
                              : null,
                    ),
                    SizedBox(height: 30),
                    // CustomRichText(
                    //   title: 'Forget password? ',
                    //   linkTitle: 'Reset',
                    //   navigateToClass: ForgotPassword(),
                    // ),
                    SizedBox(height: 30),
                    CustomButton(
                      title: 'Log In',
                      bgColor: AppColors.lightGreen,
                      onTap: () async {
                        if (_formKey.currentState!.validate()) {
                          CustomTextField.unFocus(context);

                          // SignInProvider.signIn(
                          //   email: _emailController.text.trim().toLowerCase(),
                          //   password: _passwordController.text.trim(),
                          // );
                        }
                      },
                    ),
                    SizedBox(height: 20),
                    CustomButton(
                      title: 'sign In with phone number',
                      textColor: AppColors.lightGreen,
                      bgColor: Colors.transparent,
                      borderColor: AppColors.lightGreen,
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (BuildContext context) =>
                        //           SignInWithPhone(),
                        //     ));
                      },
                    ),
                    // Container(
                    //   margin: EdgeInsets.symmetric(
                    //       vertical: AppGlobals.screenHeight * 0.06),
                    //   //child:
                    //   //  Image.asset(
                    //   //   AppGifs.buddy,
                    //   //   height: AppGlobals.screenHeight * 0.12,
                    //   // ),
                    // ),
                    CustomRichText(
                      title: 'Don’t have an account? ',
                      linkTitle: 'Sign Up',
                      navigateToClass: Container(),
                      //DogParent(),
                    ),
                    SizedBox(height: 30),
                    CustomTextButton(
                      title: '*Terms & Conditions',
                      onTap: () {
                        // AppGlobals().urlLuncher(
                        //   url: AppStaticUrls.termURL,
                        // );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
