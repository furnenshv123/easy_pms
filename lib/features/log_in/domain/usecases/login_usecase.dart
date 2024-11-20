import 'package:dartz/dartz.dart';
import 'package:easy_pms/config/locator/locator.dart';
import 'package:easy_pms/core/usecase/usecase.dart';
import 'package:easy_pms/features/log_in/domain/repositories/login_repository.dart';

class LoginUsecase implements Usecase<Either, dynamic>{
  @override
  Future<Either> call(params) async{
    return await getInstance<LoginRepository>().logInUser(params);
  }
}