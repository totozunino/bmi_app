import 'package:calculate_bmi/blocs/bmi/model/bmi.dart';
import 'package:equatable/equatable.dart';

abstract class HistoryState extends Equatable {
  const HistoryState();

  @override
  List<Object?> get props => [];
}

class HistoryInitial extends HistoryState {
  const HistoryInitial();
}

class HistoryLoading extends HistoryState {
  const HistoryLoading();
}

class HistoryLoaded extends HistoryState {
  final List<BMI> history;

  const HistoryLoaded(this.history);
}

class HistoryError extends HistoryState {
  final String message;

  const HistoryError(this.message);
}
