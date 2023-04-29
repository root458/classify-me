import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ValueProposition extends StatelessWidget {
  const ValueProposition({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SvgPicture.asset('assets/svgs/angle.svg'),
          const Text('''Welcome aboard, Jepkorir!'''),
          const Text(
            '''We’ve been waiting for you. Let us help you shapeyour career. ''',
          ),
          const Text('''Your future depends on it!'''),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              MaterialButton(
                onPressed: () {},
                child: const Text('''Start'''),
              ),
            ],
          )
        ],
      ),
    );
  }
}
