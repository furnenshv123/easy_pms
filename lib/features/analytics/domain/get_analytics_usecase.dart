import 'package:dartz/dartz.dart';
import 'package:easy_pms/config/locator/locator.dart';
import 'package:easy_pms/core/usecase/usecase.dart';
import 'package:easy_pms/features/analytics/data/datasources/analytics_service.dart';

class GetAnalyticsUsecase extends Usecase<Either, dynamic> {
  @override
  Future<Either> call(params) async {
    return await getInstance<AnalyticsService>().getAllAnalytics();
  }
}
