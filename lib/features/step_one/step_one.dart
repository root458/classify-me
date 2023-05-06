import 'package:classifyme/features/step_two/step_two.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StepOne extends StatelessWidget {
  const StepOne({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final circlePositions =
        _generateCirclePositions(context, .684 * height, .845 * width);
    return Scaffold(
      backgroundColor: const Color(0xFFF1EAE0),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: .0984 * width),
          child: Column(
            children: [
              SizedBox(height: .03 * height),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    '''Have your interests at heart!''',
                    style: TextStyle(
                      fontFamily: 'InterSemiBold',
                      color: Color(0xFF412294),
                      fontSize: 50,
                    ),
                  ),
                  SvgPicture.asset(
                    'assets/svgs/angle.svg',
                    height: .0778 * height,
                  ),
                ],
              ),
              SizedBox(height: .1 * height),
              SizedBox(
                height: .684 * height,
                width: double.infinity,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Positioned(
                      left: circlePositions[0].dx,
                      top: circlePositions[0].dy,
                      child: InterestItem(
                        height: height,
                        title: 'Pharmacy',
                      ),
                    ),
                    Positioned(
                      left: circlePositions[1].dx,
                      top: circlePositions[1].dy,
                      child: InterestItem(
                        height: height,
                        title: 'Surgery',
                      ),
                    ),
                    Positioned(
                      left: circlePositions[2].dx,
                      top: circlePositions[2].dy,
                      child: InterestItem(
                        height: height,
                        title: 'Laboratories',
                      ),
                    ),
                    Positioned(
                      left: circlePositions[3].dx,
                      top: circlePositions[3].dy,
                      child: InterestItem(
                        height: height,
                        title: 'Nursing',
                      ),
                    ),
                    Positioned(
                      left: circlePositions[4].dx,
                      top: circlePositions[4].dy,
                      child: InterestItem(
                        height: height,
                        title: 'Physiotherapy',
                      ),
                    ),
                  ],
                ),
              ),
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
                        builder: (context) => const StepTwo(),
                      ),
                    ),
                    child: const Text(
                      '''Next''',
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
      ),
    );
  }

  List<Offset> _generateCirclePositions(
    BuildContext context,
    double height,
    double width,
  ) {
    final circlePositions = <Offset>[
      Offset.zero,
      Offset(width * .3, 0),
      Offset(width * .6, 0),
      Offset(width * .45, height * .4),
      Offset(width * .15, height * .5),
    ];

    return circlePositions;
  }
}

class InterestItem extends StatefulWidget {
  const InterestItem({
    super.key,
    required this.height,
    required this.title,
  });

  final double height;
  final String title;

  @override
  State<InterestItem> createState() => _InterestItemState();
}

class _InterestItemState extends State<InterestItem> {
  bool _selected = false;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: _selected ? const Color(0xFF412294) : const Color(0xFFF1EAE0),
      shape: const CircleBorder(
        side: BorderSide(
          width: 2,
          color: Color(0xFF412294),
        ),
      ),
      minWidth: .324 * widget.height,
      height: .324 * widget.height,
      onPressed: () {
        setState(() {
          _selected = !_selected;
        });
      },
      child: Text(
        widget.title,
        style: TextStyle(
          fontFamily: 'InterLight',
          color: _selected ? const Color(0xFFF1EAE0) : const Color(0xFF412294),
          fontSize: 20,
        ),
      ),
    );
  }
}
