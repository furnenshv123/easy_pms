import 'package:easy_pms/config/locator/locator.dart';
import 'package:easy_pms/features/reservation/data/models/guest_req_model.dart';
import 'package:easy_pms/features/reservation/domain/usecases/add_guest_usecase.dart';
import 'package:easy_pms/features/reservation/domain/usecases/change_guest_info_usecase.dart';
import 'package:easy_pms/features/reservation/domain/usecases/delete_guest_usecase.dart';
import 'package:easy_pms/features/reservation/domain/usecases/get_guest_usecase.dart';
import 'package:easy_pms/features/reservation/domain/usecases/get_guests_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'reservation_event.dart';
part 'reservation_state.dart';

class ReservationBloc extends Bloc<ReservationEvent, ReservationState> {
  ReservationBloc() : super(ReservationInitial()) {
    on<ReservationEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<AddGuestEvent>(
      (event, emit) async {
        final result = await getInstance<AddGuestUsecase>().call(event.model);
        var responce = await getInstance<GetGuestsUsecase>().call(null);
        result.fold((l) {
          emit(ReservationAddFailure(message: l));
        }, (r) {
          responce.fold((l) {
            emit(ReservationFailure());
          }, (data) {
            emit(ReservationLoaded(models: data));
          });
        });
      },
    );
    on<ChangeGuestsInfoEvent>(
      (event, emit) async {
        var result =
            await getInstance<ChangeGuestInfoUsecase>().call(event.model);
        var responce = await getInstance<GetGuestsUsecase>().call(null);
        result.fold((l) {
          emit(ReservationFailure());
        }, (r) {
          responce.fold((l) {
            emit(ReservationFailure());
          }, (data) {
            emit(ReservationLoaded(models: data));
          });
        });
      },
    );
    on<GetGuestsEvent>(
      (event, emit) async {
        emit(ReservationLoading());
        var models = await getInstance<GetGuestsUsecase>().call(null);
        models.fold((l) {
          emit(ReservationFailure());
        }, (data) {
          emit(ReservationLoaded(models: data));
        });
      },
    );
    on<DeleteGuestEvent>(
      (event, emit) async {
        emit(ReservationLoading());
        var response =
            await getInstance<DeleteGuestUsecase>().call(event.model);
        var models = await getInstance<GetGuestsUsecase>().call(null);

        models.fold((l) {
          emit(ReservationFailure());
        }, (data) {
          emit(ReservationLoaded(models: data));
        });
      },
    );
  }
}
