import 'package:dartz/dartz.dart';
import 'package:easy_pms/features/log_in/data/models/user_model.dart';
import 'package:easy_pms/features/log_in/domain/entities/user_entity.dart';

abstract class LoginRepository {
  Future<Either> logInUser(UserEntity model);
}