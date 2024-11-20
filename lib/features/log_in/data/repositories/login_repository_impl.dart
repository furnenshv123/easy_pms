import 'package:dartz/dartz.dart';
import 'package:easy_pms/config/locator/locator.dart';
import 'package:easy_pms/features/log_in/data/data_source/auth_firebase_service.dart';
import 'package:easy_pms/features/log_in/data/models/user_model.dart';
import 'package:easy_pms/features/log_in/domain/entities/user_entity.dart';
import 'package:easy_pms/features/log_in/domain/repositories/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository{
  @override
  Future<Either> logInUser(UserEntity entity) async{
    return await getInstance<AuthFirebaseService>().logInUser(entity.toModel());
  }
}