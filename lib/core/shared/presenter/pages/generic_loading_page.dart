import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class GenericLoadingPage extends StatefulWidget {
  const GenericLoadingPage({super.key});

  @override
  State<GenericLoadingPage> createState() => _GenericLoadingPageState();
}

class _GenericLoadingPageState extends State<GenericLoadingPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Lottie.asset('assets/animations/progress.json', height: 150),
          const Text('Carregando...'),
        ],
      ),
    );
  }
}
