import 'package:car_rent_app/bloc/bloc/car_bloc.dart';
import 'package:car_rent_app/data/datasources/firebase_car_data_source.dart';
import 'package:car_rent_app/data/repositories/car_repository_impl.dart';
import 'package:car_rent_app/domain/repositories/car_repository.dart';
import 'package:car_rent_app/domain/usecases/get_cars.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void initInjection() {
  try {
    getIt.registerLazySingleton(() => FirebaseFirestore.instance);
    getIt.registerLazySingleton<FirebaseCarDataSource>(
      () => FirebaseCarDataSource(
        firestore: getIt<FirebaseFirestore>(),
      ),
    );
    getIt.registerLazySingleton<CarRepository>(
      () => CarRepositoryImpl(
        dataSource: getIt<FirebaseCarDataSource>(),
      ),
    );
    getIt.registerLazySingleton<GetCars>(
      () => GetCars(
        getIt<CarRepository>(),
      ),
    );
    getIt.registerFactory(
      () => CarBloc(
        getIt<GetCars>(),
      ),
    );
  } catch (e) {
    rethrow;
  }
}
