part of 'analytics_bloc.dart';

sealed class AnalyticsState extends Equatable {
  const AnalyticsState();
  
  @override
  List<Object> get props => [];
}

final class AnalyticsInitial extends AnalyticsState {}


class AnalyticsFailure extends AnalyticsState{}

class AnalyticsLoading extends AnalyticsState{
}
class AnalyticsLoaded extends AnalyticsState{
  final AnalyticModel model;

  const AnalyticsLoaded({required this.model});
}