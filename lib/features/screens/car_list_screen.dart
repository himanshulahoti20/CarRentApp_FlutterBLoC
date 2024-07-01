import 'package:car_rent_app/data/models/car.dart';
import 'package:car_rent_app/features/widgets/car_card.dart';
import 'package:flutter/material.dart';

class CarListScreen extends StatelessWidget {
  final List<Car> cars = [
    Car(
        model: 'Fortuner',
        color: 'Black',
        distance: 790,
        fuelCapacity: 40,
        pricePerHour: 20),
    Car(
        model: 'Fortuner',
        color: 'Black',
        distance: 790,
        fuelCapacity: 40,
        pricePerHour: 20),
    Car(
        model: 'Fortuner',
        color: 'Black',
        distance: 790,
        fuelCapacity: 40,
        pricePerHour: 20),
    Car(
        model: 'Fortuner',
        color: 'Black',
        distance: 790,
        fuelCapacity: 40,
        pricePerHour: 20),
    Car(
        model: 'Fortuner',
        color: 'Black',
        distance: 790,
        fuelCapacity: 40,
        pricePerHour: 20),
    Car(
        model: 'Fortuner',
        color: 'Black',
        distance: 790,
        fuelCapacity: 40,
        pricePerHour: 20),
    Car(
        model: 'Fortuner',
        color: 'Black',
        distance: 790,
        fuelCapacity: 40,
        pricePerHour: 20),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose your Car'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: ListView.builder(
        itemCount: cars.length,
        itemBuilder: (context, index) {
          return CarCard(car: cars[index]);
        },
      ),
    );
  }
}
