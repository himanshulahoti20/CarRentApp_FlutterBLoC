import 'package:car_rent_app/bloc/bloc/car_bloc.dart';
import 'package:car_rent_app/features/widgets/car_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CarListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CarBloc, CarState>(
      builder: (context, state) {
        final sucessState = state.runtimeType;
        switch (sucessState) {
          case CarLoadingState:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case CarSuccessState:
            return Scaffold(
                appBar: AppBar(
                  title: const Text('Choose your Car'),
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                ),
                body: ListView.builder(
                  itemCount: state.cars.length,
                  itemBuilder: (context, index) {
                    return CarCard(car: state.cars[index]);
                  },
                ));
          case CarErrorState:
            return const Center(
              child: Text('Error'),
            );
          default:
            return const SizedBox();
        }
      },
    );
  }
}
