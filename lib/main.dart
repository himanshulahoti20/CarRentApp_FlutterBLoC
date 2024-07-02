import 'package:car_rent_app/bloc/bloc/car_bloc.dart';
import 'package:car_rent_app/features/screens/onboarding_screen.dart';
import 'package:car_rent_app/firebase_options.dart';
import 'package:car_rent_app/injection_container.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  initInjection();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<CarBloc>()..add(LoadCars()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const OnboardingScreen(),
      ),
    );
  }

  Future<void> addCarsToFirestore() async {
    List<Map<String, dynamic>> carDataset = [
  {
    'model': 'Tesla Model S',
    'color': 'Red',
    'distance': 15000.0,
    'fuelCapacity': 100.0,
    'pricePerHour': 20.0,
    'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTMsklbYbzuk1FXL1e_nOMjFYXDVAV_oKnMEg&s',
  },
  {
    'model': 'BMW i8',
    'color': 'Blue',
    'distance': 20000.0,
    'fuelCapacity': 50.0,
    'pricePerHour': 25.0,
    'image': 'https://imgd.aeplcdn.com/370x208/n/q6ggura_1428548.jpg?q=80',
  },
  {
    'model': 'Audi R8',
    'color': 'Black',
    'distance': 10000.0,
    'fuelCapacity': 70.0,
    'pricePerHour': 30.0,
    'image': 'https://imgd.aeplcdn.com/370x208/n/x6ece5a_1435595.jpg?q=80',
  },
  {
    'model': 'Mercedes-Benz S-Class',
    'color': 'White',
    'distance': 12000.0,
    'fuelCapacity': 80.0,
    'pricePerHour': 22.0,
    'image': 'https://imgd.aeplcdn.com/370x208/n/cnugbua_1541067.jpg?q=80',
  },
  {
    'model': 'Porsche 911',
    'color': 'Yellow',
    'distance': 8000.0,
    'fuelCapacity': 60.0,
    'pricePerHour': 28.0,
    'image': 'https://imgd.aeplcdn.com/664x374/n/di6upsa_1476829.jpg?q=80',
  },
  {
    'model': 'Lamborghini Aventador',
    'color': 'Orange',
    'distance': 5000.0,
    'fuelCapacity': 80.0,
    'pricePerHour': 50.0,
    'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRMBGSXJHxCYwEp2fEIxXeEYAEfZvGr8dqzkg&s',
  },
  {
    'model': 'Ferrari F8',
    'color': 'Red',
    'distance': 3000.0,
    'fuelCapacity': 75.0,
    'pricePerHour': 55.0,
    'image': 'https://imgd.aeplcdn.com/1920x1080/n/cw/ec/49376/f8-tributo-exterior-left-front-three-quarter-5.jpeg?q=80&q=80',
  },
  {
    'model': 'Chevrolet Camaro',
    'color': 'Yellow',
    'distance': 25000.0,
    'fuelCapacity': 60.0,
    'pricePerHour': 18.0,
    'image': 'https://i.pinimg.com/736x/e5/5b/6d/e55b6d4ec4a04afb1263a0ae3ef2ea57.jpg',
  },
  {
    'model': 'Ford Mustang',
    'color': 'Blue',
    'distance': 18000.0,
    'fuelCapacity': 65.0,
    'pricePerHour': 20.0,
    'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR7C2iqR6b29iJ6FvV2YdFQhXfyq8PfDNgnNw&s',
  },
  {
    'model': 'Nissan GT-R',
    'color': 'Gray',
    'distance': 14000.0,
    'fuelCapacity': 70.0,
    'pricePerHour': 30.0,
    'image': 'https://i.pinimg.com/originals/4f/36/c0/4f36c01081785b8b517b624d6c4781c9.jpg',
  },
  {
    'model': 'Toyota Supra',
    'color': 'White',
    'distance': 22000.0,
    'fuelCapacity': 50.0,
    'pricePerHour': 22.0,
    'image': 'https://m.media-amazon.com/images/I/411bLQY4JbL._SR600%2C315_PIWhiteStrip%2CBottomLeft%2C0%2C35_SCLZZZZZZZ_FMpng_BG255%2C255%2C255.jpg',
  },
  {
    'model': 'McLaren 720S',
    'color': 'Orange',
    'distance': 6000.0,
    'fuelCapacity': 80.0,
    'pricePerHour': 55.0,
    'image': 'https://imgd.aeplcdn.com/664x374/n/ncksi4a_1521733.jpg?q=80',
  },
  {
    'model': 'Bugatti Chiron',
    'color': 'Blue',
    'distance': 2000.0,
    'fuelCapacity': 100.0,
    'pricePerHour': 100.0,
    'image': 'https://i.pinimg.com/originals/67/98/6b/67986b1282e7fa349094ce50a60a4d01.jpg'
  },
  {
    'model': 'Aston Martin DB11',
    'color': 'Green',
    'distance': 15000.0,
    'fuelCapacity': 60.0,
    'pricePerHour': 40.0,
    'image': 'https://imgcdn.oto.com/large/gallery/color/42/1354/aston-martin-db11-color-729374.jpg',
  },
  {
    'model': 'Jaguar F-Type',
    'color': 'Red',
    'distance': 17000.0,
    'fuelCapacity': 55.0,
    'pricePerHour': 35.0,
    'image': 'https://imgd-ct.aeplcdn.com/1056x660/n/0sbj3sa_1483562.jpg?q=80',
  },
  {
    'model': 'Alfa Romeo 4C',
    'color': 'White',
    'distance': 12000.0,
    'fuelCapacity': 40.0,
    'pricePerHour': 30.0,
    'image': 'https://example.com/images/alfa_romeo_4c_white.jpg',
  },
  {
    'model': 'Maserati GranTurismo',
    'color': 'Black',
    'distance': 9000.0,
    'fuelCapacity': 75.0,
    'pricePerHour': 45.0,
    'image': 'https://stimg.cardekho.com/images/car-images/large/Maserati/Gran-Turismo/6751/1582344824248/black_08090d.jpg?impolicy=resize&imwidth=420',
  },
  {
    'model': 'Rolls-Royce Phantom',
    'color': 'Silver',
    'distance': 5000.0,
    'fuelCapacity': 100.0,
    'pricePerHour': 80.0,
    'image': 'https://imgd.aeplcdn.com/1280x720/n/cw/ec/30181/phantom-exterior-right-front-three-quarter.jpeg?isig=0&q=80',
  },
  {
    'model': 'Bentley Continental GT',
    'color': 'Blue',
    'distance': 7000.0,
    'fuelCapacity': 90.0,
    'pricePerHour': 75.0,
    'image': 'https://imgd-ct.aeplcdn.com/1056x660/n/51pr9sa_1464080.jpg?q=80',
  },
  {
    'model': 'Lexus LC',
    'color': 'Red',
    'distance': 11000.0,
    'fuelCapacity': 65.0,
    'pricePerHour': 30.0,
    'image': 'https://imgd.aeplcdn.com/664x374/n/gt5nssa_1480133.jpg?q=80',
  },
  {
    'model': 'Toyota Fortuner',
    'color': 'Black',
    'distance': 22700.0,
    'fuelCapacity': 50.0,
    'pricePerHour': 18.0,
    'image': 'https://imgd.aeplcdn.com/664x374/n/cw/ec/44709/fortuner-exterior-right-front-three-quarter-20.jpeg?isig=0&q=80',
  },
{
    'model': 'Lamborghini Urus',
    'color': 'Orange',
    'distance': 10800.0,
    'fuelCapacity': 50.0,
    'pricePerHour': 38.0,
    'image': 'https://img.indianautosblog.com/2021/03/12/lamborghini-urus-pearl-capsule-edition-3d7f.jpg',
  },
];


    CollectionReference carsCollection =
        FirebaseFirestore.instance.collection('cars');

    for (Map<String, dynamic> car in carDataset) {
      await carsCollection.add(car);
    }

    print('Cars added to Firestore');
  }
}
