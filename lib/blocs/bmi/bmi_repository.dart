import 'package:calculate_bmi/blocs/bmi/model/bmi.dart';
import 'package:hive/hive.dart';

class BMIRepository {
  Future<Box<BMI>> _getBMIBox() async {
    return await Hive.openBox<BMI>('bmi_history');
  }

  Future<List<BMI>> getHistory() async {
    final history = await _getBMIBox();

    return history.values.toList();
  }

  Future<void> addBMI(final double value, final String status) async {
    final history = await _getBMIBox();
    await history
        .add(BMI(value: value, createdAt: DateTime.now(), status: status));
  }
}
