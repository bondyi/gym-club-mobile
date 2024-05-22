import 'package:flutter/material.dart';
import 'package:gym_club_mobile/src/auth/presentation/views/login_screen.dart';

import 'core/services/injection_container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true
      ),
      home: const LoginScreen(),
    );
  }
}
