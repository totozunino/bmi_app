import 'dart:async';

import 'package:calculate_bmi/blocs/bmi/bloc/bmi_bloc.dart';
import 'package:calculate_bmi/blocs/bmi/bloc/bmi_state.dart';
import 'package:calculate_bmi/blocs/bmi/bmi_repository.dart';
import 'package:calculate_bmi/blocs/bmi/model/bmi.dart';
import 'package:calculate_bmi/blocs/history/bloc/history_event.dart';
import 'package:calculate_bmi/blocs/history/bloc/history_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  final BMIRepository _bmiRepository;
  final BMIBloc _bmiBloc;
  late StreamSubscription bmiStreamSubscription;

  HistoryBloc(this._bmiRepository, this._bmiBloc)
      : super(const HistoryInitial()) {
    on<GetHistory>(_onGetHistory);

    bmiStreamSubscription = _bmiBloc.stream.listen((state) {
      if (state is BMISaved) {
        add(const GetHistory());
      }
    });
  }

  Future<void> _onGetHistory(
      GetHistory event, Emitter<HistoryState> emit) async {
    try {
      emit(const HistoryLoading());
      List<BMI> history = await _bmiRepository.getHistory();
      emit(HistoryLoaded(history));
    } catch (e) {
      emit(const HistoryError("Oops we cloudn't get your history"));
    }
  }
}
