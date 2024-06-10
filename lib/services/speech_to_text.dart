import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart';

class SpeechToTextPage extends StatefulWidget {
  const SpeechToTextPage({super.key});

  @override
  State<SpeechToTextPage> createState() => _SpeechToTextPageState();
}

class _SpeechToTextPageState extends State<SpeechToTextPage> {
  SpeechToText speech = SpeechToText();
  bool isListening = false;
  String lastWords = '';
  @override
  void initState() {
    super.initState();
    initSpeechToText();
  }

  Future<void> initSpeechToText() async {
    bool available = await speech.initialize();
    if (available) {
      setState(() {
        isListening = false;
      });
    }
  }

  void startListening() async {
    await speech.listen(
      onResult: (result) {
        setState(() {
          lastWords = result.recognizedWords;
        });
      },
    );
    setState(() {
      isListening = true;
    });
  }

  void stopListening() async {
    if (isListening) {
      speech.stop();
      setState(() {
        isListening = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                lastWords,
                style: const TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(height: 100),
            Text(isListening ? "Listening..." : "Not Listening"),
            const SizedBox(height: 20),
            IconButton(
              onPressed: isListening ? stopListening : startListening,
              icon: Icon(isListening ? Icons.send : Icons.keyboard_voice_sharp),
            ),
          ],
        ),
      ),
    );
  }
}
