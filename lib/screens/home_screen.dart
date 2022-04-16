import 'package:calculate_bmi/blocs/bmi/bloc/bmi_bloc.dart';
import 'package:calculate_bmi/blocs/bmi/bloc/bmi_event.dart';
import 'package:calculate_bmi/blocs/bmi/bloc/bmi_state.dart';
import 'package:calculate_bmi/widgets/box_card.dart';
import 'package:calculate_bmi/widgets/slider_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double age = 30;
  double weight = 130;
  double height = 60;
  int gender = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: SliderBox(
                    title: "Age yr",
                    value: age,
                    minValue: 0,
                    maxValue: 100,
                    onChange: (val) {
                      setState(() {
                        age = val;
                      });
                    },
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: SliderBox(
                    title: "Weight lbs",
                    value: weight,
                    minValue: 0,
                    maxValue: 300,
                    onChange: (val) {
                      setState(() {
                        weight = val;
                      });
                    },
                  ),
                ),
              ],
            ),
            SliderBox(
              width: double.infinity,
              title: "Height in",
              value: height,
              minValue: 0,
              maxValue: 100,
              onChange: (val) {
                setState(() {
                  height = val;
                });
              },
            ),
            BoxCard(
              width: double.infinity,
              child: Column(
                children: [
                  const Text(
                    "Gender",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  CupertinoSlidingSegmentedControl(
                    children: const {
                      0: Text("Male"),
                      1: Text("Female"),
                    },
                    groupValue: gender,
                    onValueChanged: (val) {
                      setState(() {
                        gender = val as int;
                      });
                    },
                  ),
                ],
              ),
            ),
            BlocConsumer<BMIBloc, BMIState>(
              listener: (context, state) {
                if (state is BMICalculated) {
                  showCupertinoDialog(
                    context: context,
                    builder: (ctx) {
                      return CupertinoAlertDialog(
                        title: Text(state.status),
                        content: Text(
                          state.bmi.toStringAsFixed(2),
                        ),
                        actions: [
                          CupertinoDialogAction(
                            child: const Text(
                              "CLOSE",
                              style: TextStyle(
                                color: Color.fromRGBO(244, 67, 54, 1),
                              ),
                            ),
                            onPressed: () {
                              context
                                  .read<BMIBloc>()
                                  .add(const CloseBMIDialog());
                              Navigator.of(ctx).pop();
                            },
                          ),
                          CupertinoDialogAction(
                            child: const Text("SAVE"),
                            onPressed: () {
                              context
                                  .read<BMIBloc>()
                                  .add(SaveBMI(state.status, state.bmi));
                              Navigator.of(ctx).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              builder: (context, state) {
                return CupertinoButton.filled(
                  child: const Text("Calculate BMI"),
                  onPressed: () {
                    context.read<BMIBloc>().add(
                          CalculateBMI(age, weight, height),
                        );
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
