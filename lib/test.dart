
// import 'package:avatar_glow/avatar_glow.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:highlight_text/highlight_text.dart';
// import 'package:speech_to_text/speech_to_text.dart' as stt;

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

//   late stt.SpeechToText _speech;
//   bool _isListening = false;
//   String _text = 'Press the button and start speaking';
//   final TextEditingController _controller=TextEditingController(text: 'Press the button and start speaking');
//   double _confidence = 1.0;

//   @override
//   void initState() {
//     super.initState();
//     _speech = stt.SpeechToText();
//   }

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

// class Test extends StatefulWidget {
//   @override
//   _TestState createState() => _TestState();
// }
