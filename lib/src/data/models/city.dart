import 'package:hive/hive.dart';

part 'city.g.dart';

@HiveType(typeId: 0)
class City extends HiveObject {

  @HiveField(0)
  final String name;

  @HiveField(1)
  final String country; // country

  @HiveField(2)
  final double lat;

  @HiveField(3)
  final double lon;

  @HiveField(4)
  final String timezone; 
  
  @HiveField(5)
  final int order;

  City({
        // deleted id field
    required this.name,
    required this.country,  /// country
    required this.lat,
    required this.lon,
    required this.timezone,
    this.order = 0 
    
  });
}

