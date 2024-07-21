import 'package:demo_app_provider/Provider/count_provider.dart';
import 'package:demo_app_provider/Provider/darkmode.dart';
import 'package:demo_app_provider/Provider/favorite_provider.dart';
import 'package:demo_app_provider/Provider/login_provider.dart';
import 'package:demo_app_provider/Provider/slider_provider.dart';
import 'package:demo_app_provider/Screen/DarkMode/darkmode.dart';
import 'package:demo_app_provider/Screen/Favorite/favorite.dart';
import 'package:demo_app_provider/Screen/login.dart';
import 'package:demo_app_provider/Screen/provider_state_management.dart';
import 'package:demo_app_provider/Screen/slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => countProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => SliderProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => FavoriteProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => themeModeProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => LoginProvider(),
          )
        ],
        child: Builder(builder: (BuildContext context) {
          final themeChanger = Provider.of<themeModeProvider>(context);

          return MaterialApp(
            themeMode: themeChanger.themeMode,
            theme: ThemeData(
                appBarTheme: AppBarTheme(backgroundColor: Colors.yellow)),
            darkTheme: ThemeData(
                brightness: Brightness.dark,
                appBarTheme: AppBarTheme(backgroundColor: Colors.lightBlue)),
            title: 'Flutter Demo',
            home: LoginScreen(),
          );
        }));
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//   final String title;
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     final countNum = Provider.of<countProvider>(context);
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               "${countNum.num}",
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           countNum.IncreaseNum();
//         },
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }
