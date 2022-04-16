import 'package:equatable/equatable.dart';

abstract class BMIState extends Equatable {
  const BMIState();

  @override
  List<Object?> get props => [];
}

class BMIInitial extends BMIState {
  const BMIInitial();
}

class BMICalculated extends BMIState {
  final double bmi;
  final String status;

  const BMICalculated(this.bmi, this.status);
}

class BMISaved extends BMIState {
  const BMISaved();
}

class BMIError extends BMIState {
  final String message;

  const BMIError(this.message);
}
