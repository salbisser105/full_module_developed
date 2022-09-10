import 'package:flutter/material.dart';

class BasicHomePage extends StatelessWidget {
  const BasicHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Center(
          child: Text('Esta es la pagina principal'),
        )
      ],
    );
  }
}
