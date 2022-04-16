import 'package:calculate_bmi/blocs/history/bloc/history_bloc.dart';
import 'package:calculate_bmi/blocs/history/bloc/history_state.dart';
import 'package:calculate_bmi/widgets/box_card.dart';
import 'package:calculate_bmi/widgets/formated_date.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<HistoryBloc, HistoryState>(
        builder: (context, state) {
          if (state is HistoryLoading) {
            return const Center(
              child: CupertinoActivityIndicator(),
            );
          }
          if (state is HistoryLoaded) {
            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: ListView.builder(
                itemCount: state.history.length,
                itemBuilder: (context, index) => Container(
                  margin: const EdgeInsets.all(8.0),
                  child: BoxCard(
                    child: Column(
                      children: [
                        Text(
                          state.history[index].status,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          state.history[index].value.toStringAsFixed(2),
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        FormatedDate(date: state.history[index].createdAt),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }

          return Container();
        },
      ),
    );
  }
}
