import 'package:flutter/material.dart';

import '../../servidses/local_notification.dart';



class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                LocalNotification.istrue ? "yoniq" : "ochiq"
            ),
            FilledButton(onPressed: (){
                LocalNotification.showNotification();
            }, child: Text("bosma"))

          ],
        ),
      ),
    );
  }
}
