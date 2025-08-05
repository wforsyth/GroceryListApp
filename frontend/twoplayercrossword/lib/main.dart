import 'package:flutter/material.dart';
import 'package:twoplayercrossword/styling.dart';
import 'routes.dart';
import 'constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

//Plugin to show flutter local notifications
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

//App initialisation
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //Firebase initialisation with platform specific options
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

//Sets up app theme and routing
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: kPrimaryColor,
        appBarTheme: AppBarTheme(
          backgroundColor: kBackgroundColor,
          elevation: 0,
        ),
        textTheme: appTextTheme,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: appButtonStyle,
        ),
      ),
      initialRoute: AppRoutes.login,
      routes: AppRoutes.routes,
    );
  }
}
