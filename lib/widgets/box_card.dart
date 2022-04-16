import 'package:flutter/cupertino.dart';

class BoxCard extends StatelessWidget {
  final double? width;
  final Widget child;

  const BoxCard({Key? key, this.width, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(255, 255, 255, 1),
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.259),
            blurRadius: 5,
          ),
        ],
      ),
      child: child,
    );
  }
}
