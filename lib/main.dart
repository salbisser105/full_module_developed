import 'package:flutter/material.dart';
import 'package:full_module/ui/pages/home_page_app.dart';
import 'package:full_module/ui/pages/main_preloader_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {'/home': ((context) => HomePage())},
      home: const MainPreLoaderPage(),
    );
  }
}
