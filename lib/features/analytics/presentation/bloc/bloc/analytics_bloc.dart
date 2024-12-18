import 'package:bloc/bloc.dart';
import 'package:easy_pms/config/locator/locator.dart';
import 'package:easy_pms/features/analytics/data/models/analytic_model.dart';
import 'package:easy_pms/features/analytics/domain/get_analytics_usecase.dart';
import 'package:equatable/equatable.dart';

part 'analytics_event.dart';
part 'analytics_state.dart';

class AnalyticsBloc extends Bloc<AnalyticsEvent, AnalyticsState> {
  AnalyticsBloc() : super(AnalyticsInitial()) {
    on<AnalyticsEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<GetAnalyticsEvent>(
      (event, emit) async {
        emit(AnalyticsLoading());
        var response = await getInstance<GetAnalyticsUsecase>().call(null);
        response.fold((l) {
          emit(AnalyticsFailure());
        }, (data) {
          emit(AnalyticsLoaded(model: data));
        });
      },
    );
  }
}
