import 'package:flutter/material.dart';
import 'package:notification/servidses/local_notification.dart';
import 'package:notification/views/screens/home_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await LocalNotification.requestPermission();
  await LocalNotification.init();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
