import 'package:bloc/bloc.dart';
import 'package:car_rent_app/data/models/car.dart';
import 'package:car_rent_app/domain/usecases/get_cars.dart';
import 'package:meta/meta.dart';

part 'car_event.dart';
part 'car_state.dart';

class CarBloc extends Bloc<CarEvent, CarState> {
  final GetCars getCars;
  CarBloc(this.getCars) : super(CarInitial()) {
    on<LoadCars>((event, emit) async {
      emit(CarLoadingState());
      try {
        await Future.delayed(const Duration(seconds: 2));
        final cars = await getCars.call();
        emit(CarSuccessState(cars));
      } catch (e) {
        emit(CarErrorState(e.toString()));
      }
    });
  }
}
