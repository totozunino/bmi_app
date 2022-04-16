import 'package:calculate_bmi/widgets/box_card.dart';
import 'package:flutter/cupertino.dart';

class SliderBox extends StatelessWidget {
  final double? width;
  final String title;
  final double value;
  final double minValue;
  final double maxValue;
  final void Function(double value) onChange;

  const SliderBox({
    Key? key,
    this.width,
    required this.title,
    required this.value,
    required this.minValue,
    required this.maxValue,
    required this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BoxCard(
      width: width,
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 15,
            ),
          ),
          Text(
            value.toStringAsFixed(0),
            style: const TextStyle(
              fontSize: 42,
              fontWeight: FontWeight.bold,
            ),
          ),
          CupertinoSlider(
            min: minValue,
            max: maxValue,
            value: value,
            divisions: maxValue.toInt(),
            onChanged: (val) {
              onChange(val);
            },
          ),
        ],
      ),
    );
  }
}
