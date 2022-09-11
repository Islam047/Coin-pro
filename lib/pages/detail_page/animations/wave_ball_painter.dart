

import 'package:flutter/material.dart';

const int waveCount = 4;

class WaveBall extends StatefulWidget {
  final double progress;
  final double size;
  final Color foregroundColor;
  final Color backgroundColor;
  final Color circleColor;
  final Widget? child;
  final double range;
  final Duration duration;

  const WaveBall({
    Key? key,
    this.size = 150.0,
    this.progress = 0.0,
    this.foregroundColor = Colors.blue,
    this.backgroundColor = Colors.lightBlue,
    this.circleColor = Colors.grey,
    this.child,
    this.duration = const Duration(seconds: 2),
    this.range = 10.0,
  })  : assert(progress >= 0.0 && progress <= 1.0),
        super(key: key);

  @override
  WaveBallState createState() => WaveBallState();
}

class WaveBallState extends State<WaveBall> with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    controller.repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(animation: controller, builder: (context,child){
      return Container(
        constraints: BoxConstraints.tightFor(
          height: widget.size,
          width: widget.size,
        ),
        child: CustomPaint(
          painter: WaveBallPainter(
            animationValue: controller.value,
            range: widget.range,
            progress: widget.progress,
            foregroundColor: widget.foregroundColor,
            backgroundColor: widget.backgroundColor,
            circleColor: widget.circleColor,
          ),
          child: widget.child,
        ),
      );
    });
  }
}

class WaveBallPainter extends CustomPainter {
  final double progress;
  final double animationValue;
  final double range;
  final Color foregroundColor;
  final Color backgroundColor;
  final Color circleColor;

  WaveBallPainter({
    required this.foregroundColor,
    required  this.circleColor,
    required  this.backgroundColor,
    required  this.animationValue,
    this.progress = 0.0,
    this.range = 10.0,
  })  : assert(animationValue >= 0.0 && animationValue <= 1.0),
        assert(progress >= 0.0 && progress <= 1.0);

  @override
  void paint(Canvas canvas, Size size) {
    double levelHeight = (1.0 - progress) * size.height;
    double specWidget = size.width / waveCount;
    double translateX = size.width * animationValue;
    double translateX2 = size.width * (1 - animationValue);

    Path path = Path();
    path.moveTo(0 - translateX, size.height);
    path.lineTo(0 - translateX, levelHeight);
    for (int i = 1; i <= waveCount; i++) {
      double controllerX = specWidget * (i * 2 - 1) - translateX;
      double controllerY = i % 2 == 0 ? levelHeight - range : levelHeight + range;
      double toX = specWidget * (2 * i) - translateX;
      path.quadraticBezierTo(controllerX, controllerY, toX, levelHeight);
    }
    path.lineTo(size.width + translateX, size.height);
    path.close();

    Path path2 = Path();
    path2.moveTo(0 - translateX2, size.height);
    path2.lineTo(0 - translateX2, levelHeight);
    for (int i = 1; i <= waveCount; i++) {
      double controllerX = specWidget * (i * 2 - 1) - translateX2;
      double controllerY = i % 2 != 0 ? levelHeight - range : levelHeight + range;
      double toX = specWidget * (2 * i) - translateX2;

    path2.quadraticBezierTo(controllerX, controllerY, toX, levelHeight);
    }
    path2.lineTo(size.width + translateX2, size.height);
    path2.close();

    Path path3 = Path();
    path3.addOval(Rect.fromCircle(center: Offset(size.width / 2, size.height / 2), radius: size.width / 2));
    path3.close();

    canvas.clipPath(path3, doAntiAlias: true);

    Paint mPaint = Paint();

    mPaint.style = PaintingStyle.fill;
    mPaint.isAntiAlias = true;

    mPaint.color = circleColor;
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), size.width / 2, mPaint);

    mPaint.color = backgroundColor;
    canvas.drawPath(path2, mPaint);

    mPaint.color = foregroundColor;
    canvas.drawPath(path, mPaint);
  }

  @override
  bool shouldRepaint(WaveBallPainter oldDelegate) {
    return oldDelegate.animationValue != animationValue ||
        oldDelegate.range != range ||
        oldDelegate.progress != progress ||
        oldDelegate.backgroundColor != backgroundColor ||
        oldDelegate.foregroundColor != foregroundColor ||
        oldDelegate.circleColor != circleColor;
  }
}