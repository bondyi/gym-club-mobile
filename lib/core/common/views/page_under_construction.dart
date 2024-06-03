import 'package:flutter/material.dart';
import 'package:gym_club_mobile/core/common/widgets/background.dart';

class PageUnderConstruction extends StatelessWidget {
  const PageUnderConstruction({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Background(
        child: Center(
          child: Text('Under construction.'),
        ),
      ),
    );
  }
}
