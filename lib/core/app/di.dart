import 'package:chart/features/Ai%20Model/data/data%20source/remote_data_source.dart';
import 'package:chart/features/Ai%20Model/data/network/ai_model_service.dart';
import 'package:chart/features/Ai%20Model/data/repository/ai_model_rebo_Implement.dart';
import 'package:chart/features/Ai%20Model/domin/repository/ai_model_rebo.dart';
import 'package:chart/features/Ai%20Model/presintation/maneger/cubit/ai_model_cubit.dart';
import 'package:chart/features/add%20new%20message/Domain/repository/new_message_repo.dart';
import 'package:chart/features/add%20new%20message/Domain/usecase/new_message_usecase.dart';
import 'package:chart/features/add%20new%20message/data/data%20source/remote_data_source.dart';
import 'package:chart/features/add%20new%20message/data/network/new_message_service.dart';
import 'package:chart/features/add%20new%20message/presintation/maneger/cubit/add_new_message_cubit.dart';
import 'package:chart/features/log%20in/Domain/repository/log_in_repo.dart';
import 'package:chart/features/log%20in/data/data%20source/remote_data_source.dart';
import 'package:chart/features/log%20in/data/network/LogInService.dart';
import 'package:chart/features/log%20in/data/repository/log_in_repo.dart';
import 'package:chart/features/sign%20up/data/repository/sign_up_repo.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/add new message/data/repository/new_message_repo.dart';
import '../../features/log in/Domain/usecase/log_in_usecase.dart';
import '../../features/log in/presintation/maneger/log_in_cubit/log_in_cubit.dart';
import '../../features/sign up/Domain/repository/sign_up_repo.dart';
import '../../features/sign up/Domain/usecase/sign_up_usecase.dart';
import '../../features/sign up/data/data source/remote_data_source.dart';
import '../../features/sign up/data/network/signUpService.dart';
import '../../features/sign up/presintation/maneger/sign_up_cubit/sign_up_cubit.dart';
import '../data/network/dio_factory.dart';
import '../data/network/network_info.dart';
import 'app_prefs.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  // app module, its a module where we put all generic dependencies

  //shared prefs instance
  var sharedPrefs = await SharedPreferences.getInstance();

  instance.registerLazySingleton<SharedPreferences>(() => sharedPrefs);

  // app prefs instance
  instance
      .registerLazySingleton<AppPreferences>(() => AppPreferences(instance()));

  // network info
  instance.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(InternetConnectionChecker()));

  // dio factory
  instance.registerLazySingleton(() => DioFactory(instance()));
  Dio dio = await instance<DioFactory>().getDio();

  /// signUp Feature
  instance.registerLazySingleton<SignUpServiceClient>(
      () => SignUpServiceClient(dio));

  // remote signUp data source
  instance.registerLazySingleton<RemoteSignUpDataSource>(
      () => RemoteSignUpDataSourceImpl(instance()));

  // signUp repository
  instance.registerLazySingleton<SignUpRepo>(() => SignUpRepoImplement(
      instance<RemoteSignUpDataSource>(), instance<NetworkInfo>()));
//=====================================================
  /// login Feature
  instance
      .registerLazySingleton<LogInServiceClient>(() => LogInServiceClient(dio));

  // remote login data source
  instance.registerLazySingleton<RemoteLogInDataSource>(
      () => RemoteLogInDataSourceImpl(instance()));

  // login repository
  instance.registerLazySingleton<LogInRepo>(() => LogInRepoImplement(
      instance<RemoteLogInDataSource>(), instance<NetworkInfo>()));
//=================================================
  /// AiModel Feature
  instance.registerLazySingleton<AiModelServiceClient>(
      () => AiModelServiceClient(dio));

  // remote AiModel data source
  instance.registerLazySingleton<RemoteAiModelDataSource>(
      () => RemoteAiModelDataSourceImpl(instance()));

  // AiModel repository
  instance.registerLazySingleton<AiModelRepo>(() => AiModelRepoImplement(
      instance<RemoteAiModelDataSource>(), instance<NetworkInfo>()));
//=============================================
  /// Add Message Feature
  instance.registerLazySingleton<NewMessageServiceClient>(
      () => NewMessageServiceClient(dio));

  // remote add Message data source
  instance.registerLazySingleton<RemoteNewMessageDataSource>(
      () => RemoteNewMessageDataSourceImpl(instance()));

  // add Message repository
  instance.registerLazySingleton<NewMessageRepo>(() => NewMessageRepoImplement(
      instance<RemoteNewMessageDataSource>(), instance<NetworkInfo>()));
}

void initSignUpModule() {
  if (!GetIt.I.isRegistered<SignUpUsecase>()) {
    instance.registerFactory<SignUpUsecase>(() => SignUpUsecase(instance()));
    instance.registerFactory<SignUpCubit>(
        () => SignUpCubit.signUpCubit(instance()));
  }
}

void initLogInModule() {
  if (!GetIt.I.isRegistered<LogInUsecase>()) {
    instance.registerFactory<LogInUsecase>(() => LogInUsecase(instance()));
    instance.registerFactory<LogInCubit>(() => LogInCubit(instance()));
  }
}

void initAddMessageModule() {
  if (!GetIt.I.isRegistered<AddNewMessageUsecase>()) {
    instance.registerFactory<AddNewMessageUsecase>(
        () => AddNewMessageUsecase(instance()));
    instance.registerFactory<AddNewMessageCubit>(
        () => AddNewMessageCubit(instance()));
    instance.registerFactory<AiModelCubit>(() => AiModelCubit());
  }

  void initAiModelModule() {
    if (!GetIt.I.isRegistered<AiModelCubit>()) {
      instance.registerFactory<AiModelCubit>(() => AiModelCubit());
    }
  }
}
