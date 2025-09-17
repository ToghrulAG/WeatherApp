import './src/data/models/city.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(CityAdapter());

  await Hive.openBox<City>('cities');

  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: const HomeScreen(),
    );
  }
}

// Home Screen Widget

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Box<City> _cityBox;

  @override
  void initState() {
    super.initState();
    _cityBox = Hive.box<City>('cities');
  }

  void _addTestCity() {
    final city = City(
      id: DateTime.now().millisecondsSinceEpoch,
      name: 'Baku',
      lat: 40.4093,
      lon: 49.8671,
      createdAt: DateTime.now(),
      order: _cityBox.length,
    );

    _cityBox.add(city);
  
  }

  @override
  Widget build(BuildContext context) {
    final cities = _cityBox.values.toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Weather App')),
      body: ListView.builder(
        itemCount: cities.length,
        itemBuilder: (context, index) {
          final city = cities[index];
          return ListTile(
            title: Text(city.name),
            subtitle: Text('Lat: ${city.lat}, Lon: ${city.lon}'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addTestCity,
        child: const Icon(Icons.add),
      ),
    );
  }
}
