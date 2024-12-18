import 'package:easy_pms/features/analytics/data/datasources/analytics_service.dart';
import 'package:easy_pms/features/analytics/domain/get_analytics_usecase.dart';
import 'package:easy_pms/features/electronic_keys/data/data_src/electronic_keys_service.dart';
import 'package:easy_pms/features/electronic_keys/domain/usecases/get_electronic_keys_usecase.dart';
import 'package:easy_pms/features/electronic_keys/presentation/view/electronic_keys_screen.dart';
import 'package:easy_pms/features/log_in/data/data_source/auth_firebase_service.dart';
import 'package:easy_pms/features/log_in/data/repositories/login_repository_impl.dart';
import 'package:easy_pms/features/log_in/domain/repositories/login_repository.dart';
import 'package:easy_pms/features/log_in/domain/usecases/login_usecase.dart';
import 'package:easy_pms/features/reservation/data/data_source/reservation_firebase_service.dart';
import 'package:easy_pms/features/reservation/domain/usecases/add_guest_usecase.dart';
import 'package:easy_pms/features/reservation/domain/usecases/change_guest_info_usecase.dart';
import 'package:easy_pms/features/reservation/domain/usecases/delete_guest_usecase.dart';
import 'package:easy_pms/features/reservation/domain/usecases/get_guest_usecase.dart';
import 'package:easy_pms/features/reservation/domain/usecases/get_guests_usecase.dart';
import 'package:easy_pms/features/staff/data/data_src/staff_firebase_service.dart';
import 'package:easy_pms/features/staff/domain/add_task_usecase.dart';
import 'package:easy_pms/features/staff/domain/get_staff_usecase.dart';
import 'package:get_it/get_it.dart';

final getInstance = GetIt.instance;

Future<void> initializeDependencies() async {
  getInstance.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());
  getInstance.registerSingleton<LoginRepository>(LoginRepositoryImpl());
  getInstance.registerSingleton<LoginUsecase>(LoginUsecase());
  getInstance.registerSingleton<ReservationFirebaseService>(
      ReservationFirebaseServiceImpl());
  getInstance.registerSingleton<AddGuestUsecase>(AddGuestUsecase());
  getInstance.registerSingleton<GetGuestsUsecase>(GetGuestsUsecase());
  getInstance.registerSingleton<GetGuestUsecase>(GetGuestUsecase());
  getInstance
      .registerSingleton<ChangeGuestInfoUsecase>(ChangeGuestInfoUsecase());
  getInstance.registerSingleton<DeleteGuestUsecase>(DeleteGuestUsecase());
  getInstance.registerSingleton<AnalyticsService>(AnalyticsServiceImpl());
  getInstance.registerSingleton<GetAnalyticsUsecase>(GetAnalyticsUsecase());
  getInstance
      .registerSingleton<ElectronicKeysService>(ElectronicKeysServiceImpl());
  getInstance
      .registerSingleton<GetElectronicKeysUsecase>(GetElectronicKeysUsecase());
  getInstance
      .registerSingleton<StaffFirebaseService>(StaffFirebaseServiceImpl());
  getInstance.registerSingleton<GetStaffUsecase>(GetStaffUsecase());
  getInstance.registerSingleton<AddTaskUsecase>(AddTaskUsecase());
}
