import 'package:chart/core/app/app.dart';
import 'package:chart/features/Ai%20Model/presintation/maneger/cubit/ai_model_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/app/bloc_observer.dart';
import 'core/app/di.dart';
import 'core/app/functions.dart';
import 'core/presentation/resources/language_manager.dart';
import 'features/add new message/presintation/maneger/cubit/add_new_message_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  setStatusBarTextLight();
  // /// prevent rotation
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  init();
  Bloc.observer = AppBlocObserver();
  await initAppModule();
  runApp(
    EasyLocalization(
      supportedLocales: const [ENGLISH_LOCAL, ARABIC_LOCAL],
      path: ASSTET_PATH_LOCALISATION,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => instance<AddNewMessageCubit>(),
          ),
          BlocProvider(
            create: (context) => instance<AiModelCubit>(),
          ),
        ],
        child: MyApp()),
    ),
  );
}
