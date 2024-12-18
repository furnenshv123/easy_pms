import 'package:dartz/dartz.dart';
import 'package:easy_pms/config/locator/locator.dart';
import 'package:easy_pms/core/usecase/usecase.dart';
import 'package:easy_pms/features/staff/data/data_src/staff_firebase_service.dart';

class GetStaffUsecase extends Usecase<Either, dynamic> {
  @override
  Future<Either> call(params) async {
    return await getInstance<StaffFirebaseService>().getStaff();
  }
}
