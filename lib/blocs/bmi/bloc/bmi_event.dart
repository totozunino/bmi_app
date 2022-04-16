import 'package:equatable/equatable.dart';

abstract class BMIEvent extends Equatable {
  const BMIEvent();

  @override
  List<Object?> get props => [];
}

class CalculateBMI extends BMIEvent {
  final double age;
  final double weight;
  final double height;

  const CalculateBMI(this.age, this.weight, this.height);
}

class CloseBMIDialog extends BMIEvent {
  const CloseBMIDialog();
}

class SaveBMI extends BMIEvent {
  final String status;
  final double value;

  const SaveBMI(this.status, this.value);
}
