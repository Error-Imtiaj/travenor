import 'package:flutter/material.dart';
import 'package:travenor/app/colors.dart';

class TitleWidgetForSplashes extends StatelessWidget {
  final String text;
  final String coloredText;
  final double customPaintWidthSize;
  final double customPaintHeightSize;
  const TitleWidgetForSplashes({
    super.key,
    required this.text,
    required this.coloredText, required this.customPaintWidthSize, required this.customPaintHeightSize,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min, // Adjust column size to fit content
      children: <Widget>[
        // Text Row
        Wrap(
          //  mainAxisSize: MainAxisSize.min, // Adjust row size to fit content
          children: <Widget>[
            RichText(
                textAlign: TextAlign.center,
                text: TextSpan(children: [
                  TextSpan(
                    text: text,
                    style: TextStyle(
                      fontFamily: 'blk-bt', // Or any other suitable font
                      fontSize: 30, // Adjust as needed
                      fontWeight: FontWeight.normal, // Or bold if needed
                      color: Colors.black, // Adjust color as needed
                    ),
                  ),
                  TextSpan(
                    text: coloredText,
                    style: TextStyle(
                      fontFamily: 'blk-bt', // Or any other suitable font
                      fontSize: 30, // Adjust as needed
                      fontWeight: FontWeight.normal, // Or bold if needed
                      color: AppColors.primaryOrangeColor, // Orange color
                    ),
                  ),
                ]))
          ],
        ),
        // Swoosh (Curved Line)
        Padding(
          padding: const EdgeInsets.only(left: 48.0),
          child: CustomPaint(
            size: Size(100, 20), // Adjust width and height for curve size
            painter: SwooshPainter(),
          ),
        ),
      ],
    );
  }
}

class SwooshPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.primaryOrangeColor // Orange color
      ..style = PaintingStyle.stroke // Stroke for the line
      ..strokeWidth = 5; // Adjust thickness as needed

    final path = Path();

    // 1. Calculate the starting position under 'wide'
    final startX = size.width * 0.35; // Adjust this multiplier as needed
    final startY = size.height * 0.9; // Adjust vertical start as needed
    path.moveTo(startX, startY);

    // 2. Define the curve ending near the end of 'wide'
    final endX = size.width * 1.25; // Adjust as needed
    final endY = size.height * 0.5; // Adjust as needed

    // 3. Control point to shape the curve (experiment with these values)
    final controlX = startX + (endX - startX) * 0.3; // Adjust influence
    final controlY = size.height * 0.1; // Adjust curve height

    path.quadraticBezierTo(controlX, controlY, endX, endY);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(SwooshPainter oldDelegate) => false;
}
