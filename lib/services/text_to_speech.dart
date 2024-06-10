//
// ignore_for_file: avoid_print, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
//
// class _TestState extends State<Test> {
//   final Map<String, HighlightedWord> _highlights = {
//     // 'can': HighlightedWord(
//     //   onTap: () => print('flutter'),
//     //   textStyle: const TextStyle(
//     //     color: Colors.blue,
//     //     fontWeight: FontWeight.bold,
//     //   ),
//     // ),
//     // 'voice': HighlightedWord(
//     //   onTap: () => print('voice'),
//     //   textStyle: const TextStyle(
//     //     color: Colors.green,
//     //     fontWeight: FontWeight.bold,
//     //   ),
//     // ),
//     // 'subscribe': HighlightedWord(
//     //   onTap: () => print('subscribe'),
//     //   textStyle: const TextStyle(
//     //     color: Colors.red,
//     //     fontWeight: FontWeight.bold,
//     //   ),
//     // ),
//     // 'like': HighlightedWord(
//     //   onTap: () => print('like'),
//     //   textStyle: const TextStyle(
//     //     color: Colors.blueAccent,
//     //     fontWeight: FontWeight.bold,
//     //   ),
//     // ),
//     // 'comment': HighlightedWord(
//     //   onTap: () => print('comment'),
//     //   textStyle: const TextStyle(
//     //     color: Colors.green,
//     //     fontWeight: FontWeight.bold,
//     //   ),
//     // ),
//   };
//
//   late stt.SpeechToText _speech;
//   bool _isListening = false;
//   String _text = 'Press the button and start speaking';
//   final TextEditingController _controller=TextEditingController(text: 'Press the button and start speaking');
//   double _confidence = 1.0;
//
//   @override
//   void initState() {
//     super.initState();
//     _speech = stt.SpeechToText();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Confidence: ${(_confidence * 100.0).toStringAsFixed(1)}%'),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//       floatingActionButton: AvatarGlow(
//         animate: _isListening,
//         glowColor: Theme.of(context).primaryColor,
//
//         duration: const Duration(milliseconds: 2000),
//         //repeatPauseDuration: const Duration(milliseconds: 100),
//         repeat: true,
//         child: FloatingActionButton(
//           onPressed: _listen,
//           child: Icon(_isListening ? Icons.mic : Icons.mic_none),
//         ),
//       ),
//       body: SingleChildScrollView(
//         reverse: true,
//         child: Container(
//           padding: const EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 150.0),
//           child: Column(
//             children: [
//               TextFormField(
//                 controller: _controller,
//               ),
//               TextHighlight(
//                 text: _text,
//                 words: {},//_highlights,
//                 textStyle: const TextStyle(
//                   fontSize: 32.0,
//                   color: Colors.black,
//                   fontWeight: FontWeight.w400,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   void _listen() async {
//     if (!_isListening) {
//       bool available = await _speech.initialize(
//         onStatus: (val) => print('onStatus: $val'),
//         onError: (val) => print('onError: $val'),
//       );
//       if (available) {
//         setState(() => _isListening = true);
//         _speech.listen(
//           onResult: (val) => setState(() {
//             _text = val.recognizedWords;
//             _controller.text=val.recognizedWords;
//             if (val.hasConfidenceRating && val.confidence > 0) {
//               _confidence = val.confidence;
//             }
//           }),
//         );
//       }
//     } else {
//       setState(() => _isListening = false);
//       _speech.stop();
//     }
//   }
// }
//
// class Test extends StatefulWidget {
//   @override
//   _TestState createState() => _TestState();
// }

///TTS



class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  final FlutterTts _flutterTts = FlutterTts();
  Map _currentVoices = {};
  List<Map> _voices = [];
  int?_currentWordStart,_currentWordEnd;
  @override
  void initState() {
    super.initState();
    initTTS();
  }

  void initTTS() {
    _flutterTts.setProgressHandler((text, start, end, word) {
      setState(() {
        _currentWordStart=start;
        _currentWordEnd=end;
      });
    });
    _flutterTts.getVoices.then((value) {
      try {
        _voices = List<Map>.from(value);
        setState(() {
          _voices =
              _voices.where((voice) => voice['name'].contains('en')).toList();
          _currentVoices = _voices.first;
          setVoice(_currentVoices);
        });
        print(_voices);
      } catch (e) {
        print(e);
      }
    });
  }

  void setVoice(Map voice) {
    _flutterTts.setVoice({'name': voice['name'], 'locale': voice['locale']});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          //_speakerSelector()
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text:
                      "There's a known issue with integrating plugins that use Swift into a Flutter project created with the",
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                        text:
                        "There's a known issue with integrating plugins that use Swift into a Flutter project created with the".substring(0,_currentWordStart),
                    ),
                    if(_currentWordStart!=null)
                      TextSpan(
                        text:
                        "There's a known issue with integrating plugins that use Swift into a Flutter project created with the".substring(_currentWordStart??0,_currentWordEnd),
                        style: const TextStyle(
                          color: Colors.purple,
                          fontSize: 25,
                        ),
                      ),
                    if(_currentWordEnd!=null)
                      TextSpan(
                        text:
                        "There's a known issue with integrating plugins that use Swift into a Flutter project created with the".substring(_currentWordEnd!),
                      ),
                  ]
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _flutterTts.speak(
              "There's a known issue with integrating plugins that use Swift into a Flutter project created with the");
        },
        child: const Icon(Icons.speaker),
      ),
    );
  }

  Widget speakerSelector() {
    return DropdownButton<Map<dynamic, dynamic>>(
      value: _currentVoices,
      items: _voices.map((Map<dynamic, dynamic> _voice) {
        return DropdownMenuItem<Map<dynamic, dynamic>>(
          value: _voice,
          child: Text(_voice['name']),
        );
      }).toList(),
      onChanged: (Map<dynamic, dynamic>? newValue) {
        setState(() {
          _currentVoices = newValue ?? {};
        });
      },
    );
  }
}





