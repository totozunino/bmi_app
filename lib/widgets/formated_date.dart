import 'package:flutter/material.dart';

class FormatedDate extends StatelessWidget {
  final DateTime date;

  const FormatedDate({Key? key, required this.date}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> splitedDate = date.toString().split(' ')[0].split('-');
    String splitedTime = date.toString().split(' ')[1].substring(0, 5);

    return Text(
      "$splitedTime ${splitedDate[0]}/${splitedDate[1]}/${splitedDate[2]}",
      style: const TextStyle(
        fontSize: 12,
        color: Color.fromRGBO(158, 158, 158, 1),
      ),
    );
  }
}
