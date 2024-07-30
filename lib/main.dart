import 'package:demo_app_provider/utils/routes/routes.dart';
import 'package:demo_app_provider/utils/routes/routes_name.dart';
import 'package:demo_app_provider/view/home_screen.dart';
import 'package:demo_app_provider/view_model/auth_view_model.dart';
import 'package:demo_app_provider/view_model/user_view_model.dart';
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
          create: (_) => AuthViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => UserViewModel(),
        )
      ],
      child: MaterialApp(
        theme:
            ThemeData(appBarTheme: AppBarTheme(backgroundColor: Colors.yellow)),
        darkTheme: ThemeData(
            brightness: Brightness.dark,
            appBarTheme: AppBarTheme(backgroundColor: Colors.lightBlue)),
        title: 'Flutter Demo',
        initialRoute: RoutesName.splash,
        onGenerateRoute: Routes.generateRoute,
        home: HomeScreen(),
      ),
    );
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
