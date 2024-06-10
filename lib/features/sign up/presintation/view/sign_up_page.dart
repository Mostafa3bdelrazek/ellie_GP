// ignore_for_file: must_be_immutable

import 'package:chart/features/sign%20up/data/network/request.dart';
import 'package:chart/features/sign%20up/presintation/maneger/sign_up_cubit/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/app/di.dart';
import '../../../../core/presentation/resources/color_manager.dart';
import '../../../../core/presentation/resources/font_manager.dart';
import '../../../../core/presentation/resources/routes_manager.dart';
import '../../../../core/presentation/resources/styles_manager.dart';
import '../../../../core/presentation/widgets/custom_text_form_field.dart';
import '../../../../core/presentation/widgets/defaultButton.dart';
import '../../../log in/presintation/view/custom_signup_row.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});
  final TextEditingController _nameController=TextEditingController(text: '');
  final TextEditingController _ageController=TextEditingController();
  final TextEditingController _emailController=TextEditingController();
  final TextEditingController _passwordController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => instance<SignUpCubit>(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: BlocConsumer<SignUpCubit, SignUpCubitState>(
          listener: (context, state) {},
          builder: (context, state) {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/Hi.png',height: 200,),
                        Text(
                          'Sign Up',
                          style: getBoldLexendStyle(
                            color: ColorManager.black,
                            fontSize: FontSize.s32,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Create your account to unlock a world of knowledge and learning opportunities.',
                          textAlign: TextAlign.center,
                          style: getMediumInterStyle(
                            color: ColorManager.greLight,
                            fontSize: FontSize.s14,
                          ),
                        ),
                        const SizedBox(height: 16),
                        CustomTextField(
                          controller: _nameController,
                          hintText: 'Mohamed',
                          labelText: 'Name',
                        ),
                        const SizedBox(height: 16),
                        CustomTextField(
                          controller: _ageController,
                          hintText: '15',
                          labelText: 'Age',
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
                        const SizedBox(height: 48),
                        DefaultButton(
                          text: 'SIGN UP',
                          onPressed: () {
                            context
                                .read<SignUpCubit>()
                                .createUser(SignUpRequest(
                                  age: 22,
                                  email: "mostafa7777@gmail.com",
                                  firstName: "Mostafa7777",
                                  middleName: "Abdelrazek1",
                                  lastName: 'Mohamed1',
                                  password: "P@ssw0rd_6542361",
                                  type: "V",
                                ));
                          },
                        ),
                        const SizedBox(height: 16),
                        CustomSignUpRow(onTap: (){
                          Navigator.pushNamed(context, Routes.loginRoute);
                        }, buttonDesc: "Already have an account?   ", buttonName: "Sign in here"),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
