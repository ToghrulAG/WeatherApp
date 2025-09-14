import 'package:hive/hive.dart';
part 'city.g.dart';

@HiveType(typeId: 0)
class City extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final double lat;

  @HiveField(3)
  final double lon;

  @HiveField(4)
  final DateTime createdAt;

  @HiveField(5)
  final int order;

  City({
    required this.id,
    required this.name,
    required this.lat,
    required this.lon,
    required this.createdAt,
    required this.order
  });
}

