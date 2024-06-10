import 'package:flutter/material.dart';

import '../core/presentation/widgets/defaultButton.dart';
import 'question_page.dart';

class ToTestPage extends StatelessWidget {
  const ToTestPage({super.key});

  @override
  Widget build(BuildContext context) {
    
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Image.asset(
              'assets/images/test image.png',
              fit: BoxFit.cover,
              height: screenHeight*0.5,
              width: screenWidth,
            ),
            const Spacer(flex: 1),
            Center(
              child: SizedBox(
                height: screenHeight*0.3,
                width: screenWidth*1.0,
                child: const Text(
                  "Let's find out how to learn better",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const Spacer(flex: 1),
            DefaultButton(
              textSize: 22,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Question(
                          Q: 'When learning from the Internet I like',
                          button1: 'interesting design and visual features',
                          button2: 'videos showing how to do things',
                          button3: 'listen to experts',
                          button4: 'detailed articles'),
                    ));
              },
              text: 'Get start',
              
                height: screenHeight * 0.08,
                width: screenWidth * 0.8,
            ),
            const SizedBox(height: 48),
          ],
        ),
      ),
    );
  }
}