import 'package:campus_sync/components/custom_appBar.dart';
import 'package:campus_sync/components/event_Card.dart';
import 'package:campus_sync/consts/colors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        scaffoldBackgroundColor: primary_2,
        useMaterial3: true,
      ),
      home: const DefaultTextStyle(
        style: TextStyle(inherit: true, color: Colors.white),
        child: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        context: context,
        titleText: 'Profile',
        icon: Icons.person,
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            EventCard(
              eventName: 'Taabir - An Poetry Evening',
              committeeName: 'Literary Council',
              venue: 'M203',
              schedule: DateTime(2024, 01, 30, 16, 00),
            ),
          ],
        ),
      ),
    );
  }
}
