import 'package:chart/core/presentation/resources/routes_manager.dart';
import 'package:flutter/material.dart';
import '../core/presentation/widgets/defaultButton.dart';

class HelloPage extends StatelessWidget {
  const HelloPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.purple,
              Color(0xffF3E5F5),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: Image.asset(
                'assets/images/Hi.png',
                fit: BoxFit.cover,
                height: screenHeight * 0.4, // Adjusted height
                width: screenWidth,
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Enjoy a wonderful way of learning with Ellie',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(height: screenHeight*0.02),
                  const Text(
                    'Techno Avatar',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height:  screenHeight*0.02),
                  DefaultButton(
                    textSize: 20,
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.registerRoute);
                    },
                    text: "Let’s  get started",
                      height: screenHeight * 0.08,
                width: screenWidth * 0.8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "already have an account?",
                        style: TextStyle(
                          color: Color(0xffD989D9),
                          fontSize: 12,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, Routes.loginRoute);
                        },
                        child: const Text(
                          "Login",
                          style: TextStyle(
                            color: Color(0XffD989D9),
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
