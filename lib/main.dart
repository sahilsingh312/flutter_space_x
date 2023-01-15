import 'package:flutter/material.dart';
import 'package:flutter_space_x/providers/favorites_provider.dart';
import 'package:flutter_space_x/screens/home_screen.dart';
import 'package:provider/provider.dart';

import 'providers/upcoming_launches_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LaunchesProvider()),
        ChangeNotifierProvider(create: (_) => FavoritesProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
