import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:chart/core/app/functions.dart';
import 'package:chart/features/Ai%20Model/domin/models/ai_model_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
part 'ai_model_state.dart';

class AiModelCubit extends Cubit<AiModelState> {
  AiModelCubit() : super(AiModelInitial());
  static AiModelCubit get(context) => BlocProvider.of(context);

  late CameraController _controller;
  late List<CameraDescription> _cameras;
  Timer? _timer;

  Future<void> initialize(context) async {
    // Get a list of available cameras
    _cameras = await availableCameras();
    // Initialize the camera controller for the front camera
    _controller = CameraController(
      _cameras.firstWhere(
          (camera) => camera.lensDirection == CameraLensDirection.front),
      ResolutionPreset.medium,
    );
    // Initialize the camera controller
    await _controller.initialize();
    // Start capturing frames every second
    startCapture(context);
  }

  void startCapture(context) {
    captureFrame(context); // Capture a frame immediately after initialization
    _timer = Timer.periodic(const Duration(seconds: 40), (timer) {
      captureFrame(context);
    });
  }

  Future<File?> captureFrame(BuildContext context) async {
    try {
      // Capture a frame from the camera
      final XFile imageFile = await _controller.takePicture();

      // Get the temporary directory
      final directory = await getApplicationDocumentsDirectory();
      final String path =
          '${directory.path}/${DateTime.now().millisecondsSinceEpoch}.jpg';

      // Save the file as a JPG
      final File jpgFile = await File(path).create();

      await jpgFile.writeAsBytes(await imageFile.readAsBytes());
      // ignore: use_build_context_synchronously
      AiModelCubit ai = AiModelCubit.get(context);
      ai.aiFunction(jpgFile, context);
      // Log the captured frame
      log('Captured frame: ${jpgFile.path}');
      // Return the JPG file
      return jpgFile;
    } catch (e) {
      log('Error capturing frame: $e');
      return null;
    }
  }

  void dispose() {
    _controller.dispose();
    _timer?.cancel();
  }

  aiFunction(File file, BuildContext context) async {
    emit(AiModelLoading());

    FormData data = FormData.fromMap(
      {
        'image': await MultipartFile.fromFile(
          file.path,
          filename: file.path,
        ),
      },
    );
    postData(data: data).then((value) {
      log("success ${value.data["state"]}");

      emit(AiModelSuccess(AiModel(state: value.data["state"].toString())));
      // captureFrame(context);
    }).catchError((error) {
      log("error is $error");
      emit(AiModelFailure(error.toString()));
      captureFrame(context);
    });
  }
}
