import 'package:flutter/material.dart';

// Imports de Firebase
import 'package:firebase_core/firebase_core.dart';
import 'package:wikifood/pages/add_name_page.dart' as add_page;
import 'package:wikifood/pages/home_page.dart' as home_page;
import 'package:wikifood/pages/edit_name_page.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Individual MUA',
      initialRoute: '/',
      routes: {
        '/': (context) => const home_page.Home(),
        '/add': (context) => const add_page.AddNamePage(),
        '/edit': (context) => const EditNamePage(),
      },
    );
  }
}
