import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'package:device_preview/device_preview.dart';

void main()=> runApp(
  DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => const CountItApp(), // Wrap your app
  ),
); 

class CountItApp extends StatelessWidget {
  const CountItApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // ignore: deprecated_member_use
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      title: 'Counter App',
      home: const SplashScreen(),
    );
  }
}
