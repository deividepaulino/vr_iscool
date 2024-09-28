import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';

class QuickStartPage extends StatefulWidget {
  const QuickStartPage({super.key});

  @override
  State<QuickStartPage> createState() => _QuickStartPageState();
}

class _QuickStartPageState extends State<QuickStartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IntroductionScreen(
          pages: [
            PageViewModel(
              title: "Seja bem vindo",
              body:
                  "O VR Is Cool é um app muito maneiro onde você pode gerenciar sua escola",
              image: Lottie.asset(
                'assets/animations/floating_balloons.json',
              ),
              decoration: PageDecoration(
                pageColor: Theme.of(context).colorScheme.surface,
              ),
            ),
            PageViewModel(
              title: "Na palma da sua mão",
              body:
                  "Cadastre os diversos cursos da sua instituição com poucos cliques!",
              image: Lottie.asset(
                'assets/animations/book_pile.json',
              ),
              decoration: PageDecoration(
                pageColor: Theme.of(context).colorScheme.surface,
              ),
            ),
            PageViewModel(
              title: "Controle os estudantes",
              body:
                  "Sempre que precisar, consulte a lista ou faça uma nova matrícula",
              image: Lottie.asset('assets/animations/student.json'),
              decoration: PageDecoration(
                pageColor: Theme.of(context).colorScheme.surface,
              ),
            ),
            PageViewModel(
              title: "Flexível como você!",
              body:
                  "Matricule e remova alunos de cursos sempre que precisar, sem burocracia!",
              image: Lottie.asset('assets/animations/quick_start_finish.json'),
              decoration: PageDecoration(
                pageColor: Theme.of(context).colorScheme.surface,
              ),
            ),
          ],
          showNextButton: true,
          done: const Icon(Icons.arrow_forward),
          next: const Text("Avançar"),
          dotsDecorator: DotsDecorator(
            size: const Size.square(10.0),
            activeSize: const Size(20.0, 10.0),
            activeColor: Theme.of(context).primaryColor,
            color: Colors.black26,
            spacing: const EdgeInsets.symmetric(horizontal: 3.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0)),
          ),
          onDone: () {
            Modular.to.pushNamedAndRemoveUntil('/index/', (_) => false);
          },
        ),
      ),
    );
  }
}
