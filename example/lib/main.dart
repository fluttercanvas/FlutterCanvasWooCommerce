import 'package:flutter/material.dart';
import 'package:flutter_canvas_woocommerce/flutter_canvas_woocommerce.dart';

import 'home.dart';

void main() async {
  runApp(const MyApp());
  await FlutterCanvasWooCommerce.instance.init(
      baseUrl: 'your site url',
      consumerKey: 'your consumer key',
      consumerSecret: 'your consumer secrete');
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Canvas WooCommerce API Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Home(),
    );
  }
}
