part of 'keys_bloc.dart';

sealed class KeysEvent extends Equatable {
  const KeysEvent();

  @override
  List<Object> get props => [];
}


class GetElectronicKeysEvent extends KeysEvent{
}