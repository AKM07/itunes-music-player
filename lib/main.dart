import 'package:flutter/material.dart';
import 'package:mobile_skeleton/pages/MusicPlayerPage.dart';
import 'package:mobile_skeleton/utils/injector.dart';

import 'constants/Constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  await baseDio();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constants.appName,
      home: MusicPlayerPage(),
      initialRoute: '/',
      routes: {
        '/player': (context) => MusicPlayerPage(),
      },
      theme: ThemeData(
        appBarTheme:
            AppBarTheme(color: Color(Constants.appMainColor), elevation: 0),
        primaryColor: Color(Constants.appMainColor),
        primaryColorDark: Color(Constants.appMainColor),
        accentColor: Color(0xFFe0e0e0),
        backgroundColor: Constants.appBackgroundColor,
        scaffoldBackgroundColor: Colors.black,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
