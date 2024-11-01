import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainscreenGradient extends StatelessWidget {
  const MainscreenGradient(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
// Implementação de UI com botões e Texto
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/SwordBrother.png',
            width: 350,
          ),
          const SizedBox(height: 30),
          Text(
            'Black Templars Quiz',
            style: GoogleFonts.lato(
              color: const Color.fromARGB(255, 255, 255, 255),
              fontSize: 28,
            ),
          ),
          const SizedBox(height: 100),
          ElevatedButton.icon(
            onPressed: startQuiz,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 163, 5, 5),
              foregroundColor: const Color.fromARGB(255, 243, 239, 239),
            ),
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text('Iniciar'),
          )
        ],
      ),
    );
  }
}
