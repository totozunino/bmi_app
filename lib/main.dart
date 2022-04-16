import 'package:calculate_bmi/blocs/bmi/bloc/bmi_bloc.dart';
import 'package:calculate_bmi/blocs/bmi/bmi_repository.dart';
import 'package:calculate_bmi/blocs/bmi/model/bmi.dart';
import 'package:calculate_bmi/blocs/history/bloc/history_bloc.dart';
import 'package:calculate_bmi/blocs/history/bloc/history_event.dart';
import 'package:calculate_bmi/screens/history_screen.dart';
import 'package:calculate_bmi/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(BMIAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: "Calculate BMI",
      debugShowCheckedModeBanner: false,
      theme: const CupertinoThemeData(
        primaryColor: Color.fromRGBO(103, 58, 183, 1),
      ),
      home: CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          middle: Text("BMI"),
        ),
        child: RepositoryProvider(
          create: (context) => BMIRepository(),
          child: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => BMIBloc(
                  context.read<BMIRepository>(),
                ),
              ),
              BlocProvider(
                create: (context) => HistoryBloc(
                  context.read<BMIRepository>(),
                  context.read<BMIBloc>(),
                )..add(const GetHistory()),
              ),
            ],
            child: CupertinoTabScaffold(
              tabBar: CupertinoTabBar(
                items: const [
                  BottomNavigationBarItem(icon: Icon(CupertinoIcons.home)),
                  BottomNavigationBarItem(icon: Icon(CupertinoIcons.person))
                ],
              ),
              tabBuilder: (context, index) {
                if (index == 1) return const HistoryScreen();

                return const HomeScreen();
              },
            ),
          ),
        ),
      ),
    );
  }
}
