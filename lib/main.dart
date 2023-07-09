import 'package:flutter/material.dart';
import 'package:movie_suggester/Providers/home_provider.dart';
import 'package:movie_suggester/modules/Home_page.dart';
import 'package:movie_suggester/modules/detail_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      initialRoute: '/homePage',
      routes: {
        '/homePage': (context) => ChangeNotifierProvider(
              create: (_) => HomeState(),
              child: const HomePage(),
            ),
        '/detailPage': (context) => const DetailPage(),
      },
    );
  }
}
