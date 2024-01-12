import 'package:flutter/material.dart';
import 'package:flutter_api_mvvm/routes.dart';
import 'package:flutter_api_mvvm/utils/constants/constant_fields.dart';
import 'package:flutter_api_mvvm/view_model/auth_view_model.dart';
import 'package:flutter_api_mvvm/view_model/home_view_model.dart';
import 'package:flutter_api_mvvm/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthViewModel>(
          create: (context) => AuthViewModel(),
        ),
        ChangeNotifierProvider<UserViewModel>(
          create: (context) => UserViewModel(),
        ),
        ChangeNotifierProvider<HomeViewModel>(
          create: (context) => HomeViewModel(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: RoutesGenerator.generateRoute,
        initialRoute: kSplashScreen,
      ),
    );
  }
}
