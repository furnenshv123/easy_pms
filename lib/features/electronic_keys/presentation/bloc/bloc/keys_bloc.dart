import 'package:bloc/bloc.dart';
import 'package:easy_pms/config/locator/locator.dart';
import 'package:easy_pms/features/electronic_keys/data/models/electronic_key_model.dart';
import 'package:easy_pms/features/electronic_keys/domain/usecases/get_electronic_keys_usecase.dart';
import 'package:equatable/equatable.dart';

part 'keys_event.dart';
part 'keys_state.dart';

class KeysBloc extends Bloc<KeysEvent, KeysState> {
  KeysBloc() : super(KeysInitial()) {
    on<KeysEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<GetElectronicKeysEvent>(
      (event, emit) async {
        emit(KeysLoading());
        var result = await getInstance<GetElectronicKeysUsecase>().call(null);
        result.fold((l) {
          emit(KeysFailure());
        }, (data) {
          emit(KeysLoaded(models: data));
        });
      },
    );
  }
}
