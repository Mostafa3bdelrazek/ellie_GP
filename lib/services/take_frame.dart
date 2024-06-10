// import 'dart:async';
// import 'dart:developer';
// import 'dart:io';
// import 'package:camera/camera.dart';
// import 'package:chart/features/Ai%20Model/presintation/maneger/cubit/ai_model_cubit.dart';
// import 'package:flutter/material.dart';
// import 'package:path_provider/path_provider.dart';

// class BackgroundFrameCapture {
//   late CameraController _controller;
//   late List<CameraDescription> _cameras;
//   Timer? _timer;

//   Future<void> initialize(context) async {
//     // Get a list of available cameras
//     _cameras = await availableCameras();
//     // Initialize the camera controller for the front camera
//     _controller = CameraController(
//       _cameras.firstWhere(
//           (camera) => camera.lensDirection == CameraLensDirection.front),
//       ResolutionPreset.medium,
//     );
//     // Initialize the camera controller
//     await _controller.initialize();
//     // Start capturing frames every second
//     startCapture(context);
//   }

//   void startCapture(context) {
//     captureFrame(context); // Capture a frame immediately after initialization
//     _timer = Timer.periodic(const Duration(seconds: 60), (timer) {
//       captureFrame(context);
//     });
//   }

//   Future<File?> captureFrame(BuildContext context) async {
//     try {
//       // Capture a frame from the camera
//       final XFile imageFile = await _controller.takePicture();

//       // Get the temporary directory
//       final directory = await getApplicationDocumentsDirectory();
//       final String path =
//           '${directory.path}/${DateTime.now().millisecondsSinceEpoch}.jpg';

//       // Save the file as a JPG
//       final File jpgFile = await File(path).create();

//       await jpgFile.writeAsBytes(await imageFile.readAsBytes());
//       AiModelCubit ai = AiModelCubit.get(context);
//       ai.aiFunction(jpgFile);
//       // Log the captured frame
//       log('Captured frame: ${jpgFile.path}');
//       // Return the JPG file
//       return jpgFile;
//     } catch (e) {
//       log('Error capturing frame: $e');
//       return null;
//     }
//   }

//   void dispose() {
//     _controller.dispose();
//     _timer?.cancel();
//   }
// }
