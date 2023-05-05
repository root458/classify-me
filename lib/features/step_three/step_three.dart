import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StepThree extends StatelessWidget {
  const StepThree({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFF412294),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: .03 * height),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: .0984 * width),
            child: SvgPicture.asset(
              'assets/svgs/angle.svg',
              height: .0778 * height,
            ),
          ),
          SizedBox(height: .03 * height),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: .0984 * width),
                child: const Text(
                  '''Well,\nhere we are...''',
                  style: TextStyle(
                    fontFamily: 'InterSemiBold',
                    color: Color(0xFFF1EAE0),
                    fontSize: 50,
                  ),
                ),
              ),
              Container(
                height: .5192 * height,
                width: .642 * width,
                decoration: BoxDecoration(
                  color: const Color(0xFF512ABA),
                  border: Border.all(
                    color: const Color(0xFFF1EAE0),
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    bottomLeft: Radius.circular(8),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: .15 * width),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            '''1. Clinical medicine''',
                            style: TextStyle(
                              fontFamily: 'InterSemiBold',
                              color: Color(0xFFF1EAE0),
                              fontSize: 30,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            '''2. Public health''',
                            style: TextStyle(
                              fontFamily: 'InterSemiBold',
                              color: Color(0xFFF1EAE0),
                              fontSize: 30,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            '''3. Medical laboratory science''',
                            style: TextStyle(
                              fontFamily: 'InterSemiBold',
                              color: Color(0xFFF1EAE0),
                              fontSize: 30,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: SizedBox(
                        height: .2381 * height,
                        child: SvgPicture.asset('assets/svgs/right-bar.svg'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: .06 * height),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: .0984 * width),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '''We think you’ll make a great match!''',
                  style: TextStyle(
                    fontFamily: 'InterLight',
                    color: Color(0xFFF1EAE0),
                    fontSize: 15,
                  ),
                ),
                MaterialButton(
                  color: const Color(0xFFEB8054),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  minWidth: .191 * width,
                  height: .0698 * height,
                  onPressed: () {},
                  child: const Text(
                    '''Finish''',
                    style: TextStyle(
                      fontFamily: 'InterLight',
                      color: Color(0xFFFFFFFF),
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: .06 * height),
        ],
      ),
    );
  }
}
