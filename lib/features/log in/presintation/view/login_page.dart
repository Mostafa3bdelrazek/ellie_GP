// ignore_for_file: must_be_immutable

import 'package:chart/core/app/di.dart';
import 'package:chart/core/presentation/resources/font_manager.dart';
import 'package:chart/core/presentation/resources/routes_manager.dart';
import 'package:chart/core/presentation/resources/styles_manager.dart';
import 'package:chart/features/log%20in/data/network/request.dart';
import 'package:chart/features/log%20in/presintation/maneger/log_in_cubit/log_in_cubit.dart';
import 'package:chart/features/log%20in/presintation/view/custom_signup_row.dart';
import 'package:chart/features/log%20in/presintation/view/forget_password_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/presentation/resources/color_manager.dart';
import '../../../../core/presentation/widgets/custom_text_form_field.dart';
import '../../../../core/presentation/widgets/defaultButton.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  final TextEditingController _emailController=TextEditingController(text: 'yahia@gmail.com');
  final TextEditingController _passwordController=TextEditingController(text: 'P@ssw0rd_654236');
  @override
  Widget build(BuildContext context) {


    return BlocProvider(
      create: (context) => instance<LogInCubit>(),
      child: Scaffold(
        body: BlocConsumer<LogInCubit, LogInState>(
          listener: (context, state) {
            if(state is LogInCubitSuccess){
              Navigator.pushReplacementNamed(context, Routes.homeScreen);
            }
            if(state is LogInCubitFailure){
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: ColorManager.baseColor,
                  content: const Text(
                    'Email or password are not correct',
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            }
          },

          builder: (context, state) {
            return SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/Hi.png',height: 300,),
                      Text(
                        'Sign in',
                        style: getBoldLexendStyle(
                          color: ColorManager.black,
                          fontSize: FontSize.s32,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Join Our Community of Lifelong Learners and Explore Endless Possibilities',
                        textAlign: TextAlign.center,
                        style: getMediumInterStyle(
                          color: ColorManager.greLight,
                          fontSize: FontSize.s14,
                        ),
                      ),
                      const SizedBox(height: 16),
                      CustomTextField(
                        controller: _emailController,
                        hintText: 'youremail@gmail.com',
                        labelText: 'Email',
                      ),
                      const SizedBox(height: 16),
                      CustomTextField(
                        controller: _passwordController,
                        hintText: '*******',
                        labelText: 'Password',
                        obscureText: true,
                      ),
                      const SizedBox(height: 16),
                      const CustomForgetPassword(),
                      const SizedBox(height: 56),
                      state is LogInCubitLoading?Center(child: CircularProgressIndicator(color: ColorManager.baseColor,)):
                      DefaultButton(
                        textSize: 20,
                        text: 'SIGN IN',
                        onPressed: () {
                          if (_passwordController.text.isNotEmpty &&
                              _emailController.text.isNotEmpty) {
                            context.read<LogInCubit>().logInUser(
                                  LogInRequest(
                                      email: _emailController.text, //email,
                                      password: _passwordController.text //password,
                                      ),
                                );
                          }
                        },
                      ),
                      const SizedBox(height: 16),
                      CustomSignUpRow(onTap: (){
                        Navigator.pushNamed(context, Routes.registerRoute);
                      }, buttonDesc: "Don't have an account?   ", buttonName: "Sign up here"),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
