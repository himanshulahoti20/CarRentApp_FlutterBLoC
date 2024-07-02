part of 'car_bloc.dart';

@immutable
sealed class CarState {
  get cars => null;
}

final class CarInitial extends CarState {}

final class CarLoadingState extends CarState {}

final class CarSuccessState extends CarState {
  final List<Car> cars;
  CarSuccessState(this.cars);
}

final class CarErrorState extends CarState {
  final String message;
  CarErrorState(this.message);
}