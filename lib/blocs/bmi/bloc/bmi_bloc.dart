import 'dart:math';
import 'package:calculate_bmi/blocs/bmi/bloc/bmi_event.dart';
import 'package:calculate_bmi/blocs/bmi/bloc/bmi_state.dart';
import 'package:calculate_bmi/blocs/bmi/bmi_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BMIBloc extends Bloc<BMIEvent, BMIState> {
  final BMIRepository _bmiRepository;

  BMIBloc(this._bmiRepository) : super(const BMIInitial()) {
    on<CalculateBMI>(_onCalculateBMI);
    on<CloseBMIDialog>(_onCloseBMIDialog);
    on<SaveBMI>(_onSaveBMI);
  }

  void _onCalculateBMI(CalculateBMI event, Emitter<BMIState> emit) {
    final String status;
    final double bmi = 703 * (event.weight / pow(event.height, 2));
    if (bmi < 18.5) {
      status = "Underweight";
    } else if (bmi >= 18.5 && bmi < 25) {
      status = "Normal";
    } else if (bmi >= 25 && bmi < 30) {
      status = "Overweight";
    } else {
      status = "Obese";
    }

    emit(BMICalculated(bmi, status));
  }

  void _onCloseBMIDialog(CloseBMIDialog event, Emitter<BMIState> emit) {
    emit(const BMIInitial());
  }

  Future<void> _onSaveBMI(SaveBMI event, Emitter<BMIState> emit) async {
    try {
      await _bmiRepository.addBMI(event.value, event.status);
      emit(const BMIInitial());
    } catch (e) {
      emit(const BMIError("Oops we cloudn't save that bmi"));
    }
  }
}
