import 'package:dartz/dartz.dart';
import 'package:easy_pms/config/locator/locator.dart';
import 'package:easy_pms/core/usecase/usecase.dart';
import 'package:easy_pms/features/electronic_keys/data/data_src/electronic_keys_service.dart';

class GetElectronicKeysUsecase extends Usecase<Either, dynamic> {
  @override
  Future<Either> call(params) async {
    return await getInstance<ElectronicKeysService>().getElectronicKeys();
  }
}
