part of 'reservation_bloc.dart';

sealed class ReservationEvent extends Equatable {
  const ReservationEvent();

  @override
  List<Object> get props => [];
}

class GetGuestsEvent extends ReservationEvent {}

class AddGuestEvent extends ReservationEvent {
  final GuestReqModel model;

  const AddGuestEvent({required this.model});
  @override
  // TODO: implement props
  List<Object> get props => [model];
}

class GetGuestForChangeEvent extends ReservationEvent {
  final int roomNumber;

  const GetGuestForChangeEvent({required this.roomNumber});
}

class ChangeGuestsInfoEvent extends ReservationEvent {
  final GuestReqModel model;

  const ChangeGuestsInfoEvent({required this.model});
  @override
  // TODO: implement props
  List<Object> get props => [model];
}

class DeleteGuestEvent extends ReservationEvent {
  final GuestReqModel model;

  const DeleteGuestEvent({required this.model});
  @override
  // TODO: implement props
  List<Object> get props => [model];
}
