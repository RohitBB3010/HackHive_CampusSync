import 'package:auto_size_text/auto_size_text.dart';
import 'package:campus_sync/app/app.dart';
import 'package:campus_sync/consts/colors.dart';
import 'package:campus_sync/consts/empty_spaces.dart';
import 'package:flutter/material.dart';

class UserType extends StatelessWidget {
  UserType({super.key});

  List<String> userTypeImage = ['Authority', 'User', 'Committee'];
  final navigatorKey = GlobalKey<NavigatorState>();
  String userType = '';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      theme: ThemeData(
        scaffoldBackgroundColor: primary_2,
        appBarTheme: const AppBarTheme(color: Color.fromARGB(255, 3, 128, 232)),
        colorScheme: ColorScheme.fromSwatch(
          accentColor: const Color(0xFF13B9FF),
        ),
        scrollbarTheme: ScrollbarThemeData(
          thumbColor: MaterialStateProperty.all(
            const Color(0xFF13B9FF),
          ),
          thumbVisibility: MaterialStateProperty.all<bool>(true),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const AutoSizeText(
                  'Welcome To CampusSync',
                  maxLines: 1,
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
                heightBetweenFields_2(context),
                const AutoSizeText(
                  'Where Every Event Finds its Perfect Pulse',
                  maxLines: 2,
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
                heightBetweenFields_2(context),
                GestureDetector(
                  onTap: () {
                    navigatorKey.currentState?.push(MaterialPageRoute(
                        builder: (context) =>
                            const App(userType: 'Authority')));
                  },
                  child: Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: MediaQuery.of(context).size.height * 0.05,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black)),
                      child: const Center(child: AutoSizeText('Authority'))),
                ),
                heightBetweenFields_1(context),
                GestureDetector(
                  onTap: () {
                    navigatorKey.currentState?.push(MaterialPageRoute(
                        builder: (context) =>
                            const App(userType: 'Committee')));
                  },
                  child: Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: MediaQuery.of(context).size.height * 0.05,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black)),
                      child: const Center(child: AutoSizeText('Committee'))),
                ),
                heightBetweenFields_2(context),
                GestureDetector(
                  onTap: () {
                    navigatorKey.currentState?.push(MaterialPageRoute(
                        builder: (context) => const App(userType: 'User')));
                  },
                  child: Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: MediaQuery.of(context).size.height * 0.05,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black)),
                      child: const Center(child: AutoSizeText('User'))),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget userTypeCard(BuildContext context, String role) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => App(userType: role)));
      },
      child: Container(
          width: MediaQuery.of(context).size.width * 0.3,
          height: MediaQuery.of(context).size.height * 0.05,
          decoration: BoxDecoration(border: Border.all(color: Colors.black)),
          child: Center(child: AutoSizeText(role))),
    );
  }
}
