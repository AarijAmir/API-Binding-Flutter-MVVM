import 'package:flutter/material.dart';
import 'package:flutter_api_mvvm/view/services/splash_services.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  late final SplashServices _splashServices;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _splashServices = SplashServices();
    _splashServices.checkAuthentication(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Splash Screen',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
    );
  }
}
