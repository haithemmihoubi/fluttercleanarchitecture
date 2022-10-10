import 'package:cleanarchitecture/shared/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'features/product/presentation/screen/products_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      home: MyStatefulWidget(),

    );
  }
  // function that revrse string
  String reverseString(String str) {
    String newString = '';
    for (int i = str.length - 1; i >= 0; i--) {
      newString += str[i];
    }
    return newString;
  }

}
