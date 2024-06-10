import 'package:flutter/material.dart';

import '../core/presentation/widgets/defaultButton.dart';
import '../features/add new message/presintation/view/glp_avatar.dart';


class Question extends StatelessWidget {
  const Question({
    Key? key,
    required this.Q,
    required this.button1,
    required this.button2,
    required this.button3,
    required this.button4,
  }) : super(key: key);

  final String Q;
  final String button1;
  final String button2;
  final String button3;
  final String button4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 120),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    Q,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                const SizedBox(height: 100),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: DefaultButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Avatar(),
                        ),
                      );
                    },
                    text: button1,
                    height: 51,
                    width: double.infinity,
                    textSize: 15,
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: DefaultButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Avatar(),
                        ),
                      );
                    },
                    text: button2,
                    height: 51,
                    width: double.infinity,
                    textSize: 15,
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: DefaultButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Avatar(),
                        ),
                      );
                    },
                    text: button3,
                    height: 51,
                    width: double.infinity,
                    textSize: 15,
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: DefaultButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Avatar(),
                        ),
                      );
                    },
                    text: button4,
                    height: 51,
                    width: double.infinity,
                    textSize: 15,
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
