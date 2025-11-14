import 'package:flutter/material.dart';
import 'package:hackathon_isra/routes/app_routes.dart';
import 'package:hackathon_isra/routes/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.login,
      onGenerateRoute: AppPages.generateRoute,
    );
  }
}
