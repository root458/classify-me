import 'package:classifyme/features/step_one/step_one.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ValueProposition extends StatelessWidget {
  const ValueProposition({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xFF412294),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: .0984 * width),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: .11 * height),
            Row(
              children: [
                SvgPicture.asset(
                  'assets/svgs/angle.svg',
                  height: .0778 * height,
                ),
              ],
            ),
            SizedBox(height: .08 * height),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '''Welcome aboard!''',
                      style: TextStyle(
                        fontFamily: 'InterSemiBold',
                        color: Color(0xFFFFFFFF),
                        fontSize: 50,
                      ),
                    ),
                    SizedBox(height: .05 * height),
                    const Text(
                      '''We’ve been waiting for you. Let us help you shape your career.''',
                      style: TextStyle(
                        fontFamily: 'InterLight',
                        color: Color(0xFFFFFFFF),
                        fontSize: 30,
                      ),
                    ),
                    SizedBox(height: .05 * height),
                    const Text(
                      '''Your future depends on it!''',
                      style: TextStyle(
                        fontFamily: 'InterLight',
                        color: Color(0xFFFFFFFF),
                        fontSize: 30,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: .2381 * height,
                  child: SvgPicture.asset('assets/svgs/right-bar.svg'),
                ),
              ],
            ),
            SizedBox(height: .20 * height),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MaterialButton(
                  color: const Color(0xFFEB8054),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  minWidth: .191 * width,
                  height: .0698 * height,
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (context) => const StepOne(),
                    ),
                  ),
                  child: const Text(
                    '''Start''',
                    style: TextStyle(
                      fontFamily: 'InterLight',
                      color: Color(0xFFFFFFFF),
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: .06 * height),
          ],
        ),
      ),
    );
  }
}
