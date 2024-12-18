import 'package:dartz/dartz.dart';
import 'package:easy_pms/config/locator/locator.dart';
import 'package:easy_pms/core/usecase/usecase.dart';
import 'package:easy_pms/features/reservation/data/data_source/reservation_firebase_service.dart';

class DeleteGuestUsecase extends Usecase<Either, dynamic>{
  @override
  Future<Either> call(params) async{
    return await getInstance<ReservationFirebaseService>().deleteGuest(params);
  }
}