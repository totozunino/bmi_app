import 'package:hive/hive.dart';

part 'bmi.g.dart';

@HiveType(typeId: 1)
class BMI extends HiveObject {
  @HiveField(0)
  final double value;
  @HiveField(1)
  final String status;
  @HiveField(2)
  final DateTime createdAt;

  BMI({
    required this.value,
    required this.status,
    required this.createdAt,
  });
}
