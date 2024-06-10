// ignore_for_file: avoid_print, unused_field

import 'dart:developer';

import 'package:chart/core/presentation/resources/color_manager.dart';
import 'package:chart/features/Ai%20Model/presintation/maneger/cubit/ai_model_cubit.dart';
import 'package:chart/widgets/avatar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:speech_to_text/speech_to_text.dart';
import '../../../../core/presentation/widgets/custom_text_form_field.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import '../../../../pages/drawer_screen.dart';
import 'dart:async';

import '../../data/network/new_message_request.dart';
import '../maneger/cubit/add_new_message_cubit.dart';

class Avatar extends StatefulWidget {
  const Avatar({Key? key}) : super(key: key);

  @override
  State<Avatar> createState() => _AvatarState();
}

class _AvatarState extends State<Avatar> {
  SpeechToText speech = SpeechToText();
  bool isListening = false;
  String lastWords = '';

  final FlutterTts _flutterTts = FlutterTts();
  Map _currentVoices = {};
  List<Map> _voices = [];
  int? _currentWordStart, _currentWordEnd;

  late stt.SpeechToText _speech;
  bool _isListening = false;
  String _text = 'Press the button and start speaking';
  final TextEditingController _controller = TextEditingController();
  double _confidence = 1.0;

  late AiModelCubit cubit;

  @override
  void initState() {
    super.initState();
    initSpeechToText();
    _speech = stt.SpeechToText();
    _controller.text = lastWords;
  }

  @override
  void dispose() {
    cubit.dispose();
    super.dispose();
  }

  void initTTS() {
    _flutterTts.setProgressHandler((text, start, end, word) {
      setState(() {
        _currentWordStart = start;
        _currentWordEnd = end;
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

  Future<void> initSpeechToText() async {
    bool available = await speech.initialize();
    if (available) {
      setState(() {
        isListening = false;
      });
    }
  }

  void _listen() async {
    await _flutterTts.stop();
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (val) => print('onStatus: $val'),
        onError: (val) => print('onError: $val'),
      );
      if (available) {
        setState(() => _isListening = true);
        _speech.listen(
          onResult: (val) => setState(() {
            _text = val.recognizedWords;
            _controller.text = val.recognizedWords;
            if (val.hasConfidenceRating && val.confidence > 0) {
              _confidence = val.confidence;
            }
          }),
        );
      }
    } else {
      setState(() => _isListening = false);
      _speech.stop();
    }
  }

  String message = "";
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        drawer: const DrawerScreen(),
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: ColorManager.baseColor,
          ),
        ),
        body: BlocListener<AddNewMessageCubit, AddNewMessageState>(
          listener: (context, state) {
            if (state is AddNewMessageSuccess) {
              message = state.newMessageModel.mText;
              log("==================================$message");
            }
          },
          child: BlocConsumer<AiModelCubit, AiModelState>(
            listener: (context, state) {
              if (state is AiModelSuccess) {
                if (state.aiModel.state == "Undetermined") {
                  _flutterTts.stop();

                  //diagonal
                  //ok ==> start again and capture

                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          content: const Text(
                            'You are currently distracted',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          actions: <Widget>[
                            TextButton(
                              child: const Text(
                                'OK',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              onPressed: () {
                                _flutterTts.speak(message);
                                cubit.captureFrame(context);
                                Navigator.of(context).pop();
                              },
                            ),
                            TextButton(
                              child: const Text(
                                'cancel',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      });
                } else {
                  cubit.captureFrame(context);
                }
              }
            },
            builder: (context, state) {
              return SizedBox(
                width: screenWidth,
                height: screenHeight,
                child: Stack(
                  children: [
                    const AvatarWidget(
                      height: double.infinity,
                      moveName: 'ExplanationWithFoldedHands',
                    ),
                    Positioned(
                      bottom: 30,
                      left: 16,
                      right: 16,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(
                              child: CustomTextField(
                                hintText: 'Message Ellie...',
                                maxLength: 5,
                                suffixIcon: IconButton(
                                  onPressed: () async {
                                    cubit = AiModelCubit.get(context);
                                    AddNewMessageCubit cubit1 =
                                        AddNewMessageCubit.get(context);
                                    cubit1.addNewMessage(
                                      NewMessageRequest(
                                        cID: '66450b92d9d05ba9094c17b3',
                                        isUserMessage: true,
                                        mText: _controller.toString(),
                                        mTime: "2024-04-20T21:41:16.413Z",
                                      ),
                                      _flutterTts,
                                    );
                                    _controller.clear();
                                    cubit.initialize(context);
                                  },
                                  icon: const Icon(
                                    Icons.send,
                                    size: 30,
                                  ),
                                ),
                                controller: _controller,
                              ),
                            ),
                            const SizedBox(width: 8),
                            GestureDetector(
                              onTap: _listen,
                              child: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      color: ColorManager.baseColor,
                                      shape: BoxShape.circle),
                                  child: Icon(
                                    size: 32,
                                    _isListening ? Icons.pause : Icons.mic,
                                  )),
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
        ),
      ),
    );
  }
}
