import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:netclan_app/pages/chat_page.dart';
import 'package:netclan_app/pages/home_page.dart';
import 'package:netclan_app/pages/refine_page.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NetClan App',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

//Theme Colors
Color appBarColor = Color(0xFF0E2E43);
Color primaryColor = Color(0xFF163F5C);
Color secondaryColor = Color(0xFF375569);

//Providers
final selectedSectionIndexProvider = StateProvider<int>((ref) => 0);
final selectedBottomTabIndexProvider = StateProvider<int>((ref) => 0);
final selectedCategoryProvider = StateProvider<List<String>>((ref) => []);
