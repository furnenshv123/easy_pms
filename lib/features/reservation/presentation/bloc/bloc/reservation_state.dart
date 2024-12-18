// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'reservation_bloc.dart';

sealed class ReservationState extends Equatable {
  const ReservationState();
  
  @override
  List<Object> get props => [];
}

final class ReservationInitial extends ReservationState {}


class ReservationLoaded extends ReservationState{
  final List<GuestReqModel> models;

  const ReservationLoaded({required this.models});
  @override
  // TODO: implement props
  List<Object> get props => [models];
}


class ReservationAddFailure extends ReservationState {
  String? message;
  ReservationAddFailure({
    this.message,
  });
}
class ReservationChangeGet extends ReservationState{
  final GuestReqModel model;

  const ReservationChangeGet({required this.model});
  @override
  // TODO: implement props
  List<Object> get props => [model];
}

class ReservationLoading extends ReservationState{}

class ReservationFailure extends ReservationState{}