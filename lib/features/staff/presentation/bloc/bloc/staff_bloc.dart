import 'package:bloc/bloc.dart';
import 'package:easy_pms/config/locator/locator.dart';
import 'package:easy_pms/features/staff/data/data_src/staff_firebase_service.dart';
import 'package:easy_pms/features/staff/data/models/staff_model.dart';
import 'package:easy_pms/features/staff/domain/add_task_usecase.dart';
import 'package:easy_pms/features/staff/domain/get_staff_usecase.dart';
import 'package:equatable/equatable.dart';

part 'staff_event.dart';
part 'staff_state.dart';

class StaffBloc extends Bloc<StaffEvent, StaffState> {
  StaffBloc() : super(StaffInitial()) {
    on<StaffEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<GetStaffEvent>(
      (event, emit) async {
        emit(StaffLoading());
        var result = await getInstance<GetStaffUsecase>().call(null);
        result.fold((l) {
          emit(StaffFailure());
        }, (data) {
          emit(StaffLoaded(models: data));
        });
      },
    );
    on<AddTaskStaffEvent>(
      (event, emit) async {
        var result = await getInstance<StaffFirebaseService>()
            .addTask(event.name, event.type, event.task);
        var staff = await getInstance<GetStaffUsecase>().call(null);
        result.fold((l) {
          emit(StaffFailure());
        }, (r) {
          staff.fold((l) {
            emit(StaffFailure());
          }, (data) {
            emit(StaffLoaded(models: data));
          });
        });
      },
    );
  }
}
