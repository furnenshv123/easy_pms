


import 'package:easy_pms/features/log_in/data/data_source/auth_firebase_service.dart';
import 'package:easy_pms/features/log_in/data/repositories/login_repository_impl.dart';
import 'package:easy_pms/features/log_in/domain/repositories/login_repository.dart';
import 'package:easy_pms/features/log_in/domain/usecases/login_usecase.dart';
import 'package:get_it/get_it.dart';

final getInstance = GetIt.instance;

Future<void> initializeDependencies () async{
  getInstance.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());
  getInstance.registerSingleton<LoginRepository>(LoginRepositoryImpl());
  getInstance.registerSingleton<LoginUsecase>(LoginUsecase());
}