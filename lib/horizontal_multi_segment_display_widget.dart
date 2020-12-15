import 'package:flutter/material.dart';

/// 水平多段显示小部件
class HorizontalMultiSegmentDisplayWidget extends StatelessWidget {

  final double defaultValue;// 值
  final List<double> doubleValues;// 值的区间
  final List<String> stringValues;// 区间提示
  final List<Color> colorValues;// 区间颜色
  final double strokeWidth;// 线的宽度
  final double radius;// 线上圆的半径
  final TextStyle textStyle;// 文字风格
  final TextAlign textAlign;// 文字对齐方式
  final TextDirection textDirection; // 文字方向

  HorizontalMultiSegmentDisplayWidget(
      this.defaultValue,
      this.doubleValues,
      this.stringValues,
      this.colorValues,
      {
        this.strokeWidth = 3,
        this.radius = 5,
        this.textStyle = const TextStyle(fontSize: 14,color: Colors.black),
        this.textAlign = TextAlign.center,
        this.textDirection = TextDirection.ltr,
      }
      ): assert(defaultValue != null && defaultValue>= 0),
        assert(doubleValues != null),
        assert(stringValues != null),
        assert(colorValues != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomPaint(
        painter: MyPainter(
          defaultValue,
          doubleValues,
          stringValues,
          colorValues,
          strokeWidth: strokeWidth,
          radius: radius,
          textStyle: textStyle,
          textAlign: textAlign,
          textDirection: textDirection,
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  MyPainter(
    this.defaultValue,
    this.doubleValues,
    this.stringValues,
    this.colorValues,
    {
      this.strokeWidth = 3,
      this.radius = 5,
      this.textStyle = const TextStyle(fontSize: 14,color: Colors.black),
      this.textAlign = TextAlign.center,
      this.textDirection = TextDirection.ltr,
    }
  ): assert(defaultValue != null && defaultValue>= 0),
    assert(doubleValues != null),
    assert(stringValues != null),
    assert(colorValues != null);

  final double defaultValue;// 值
  final List<double> doubleValues;// 值的区间
  final List<String> stringValues;// 区间提示
  final List<Color> colorValues;// 区间颜色
  final double strokeWidth;// 线的宽度
  final double radius;// 线上圆的半径
  final TextStyle textStyle;// 文字风格
  final TextAlign textAlign;// 文字对齐方式
  final TextDirection textDirection; // 文字方向
  bool isPainted = false;

  @override
  void paint(Canvas canvas, Size size) {
    // 区间数
    int totalInterval = doubleValues.length - 1;
    // 每一区间占用width
    double widthByInterval = size.width/totalInterval;
    // 值所在区间
    int valueInInterval = 1;
    // 画笔
    Paint paint = Paint();

    for(int i = 0; i < totalInterval; i++) {
      // 画分段区间线
      paint.strokeWidth = strokeWidth;
      paint.style = PaintingStyle.fill;
      paint.color = colorValues[i];
      canvas.drawLine(
        Offset(widthByInterval*i, size.height/2),
        Offset(widthByInterval*(i+1), size.height/2),
        paint,
      );

      // 画分段区间数值
      if (i > 0) {
        TextPainter textPainter1 = _getTextPainter(doubleValues[i].toString());
        Size textPainterSize1 = textPainter1.size;
        textPainter1.paint(canvas,
          Offset(
            widthByInterval*i - textPainterSize1.width/2,
            size.height/2 - textPainterSize1.height * 3/2,
          ),
        );
      }

      // 画分段区间等级提示
      TextPainter textPainter = _getTextPainter(stringValues[i]);
      Size textPainterSize = textPainter.size;
      textPainter.paint(canvas,
        Offset(
          widthByInterval*(i+1) - widthByInterval/2 - textPainterSize.width/2,
          size.height/2 + textPainterSize.height / 2,
        ),
      );

      // 计算值所在区间
      if (defaultValue < doubleValues.first) {
        valueInInterval = 1;
      } else if (defaultValue > doubleValues[totalInterval-1]) {
        // 值大于最大值
        valueInInterval = totalInterval;
      } else {
        if(i > 0 && defaultValue >= doubleValues[i-1] && defaultValue < doubleValues[i]) {
          valueInInterval = i;
        }
      }

    }

    // 画值的圆圈
    double _value = defaultValue;
    if (defaultValue < doubleValues.first) {
      _value = doubleValues.first;
    } else if (defaultValue > doubleValues.last) {
      // 值大于最大值
      _value = doubleValues.last;
    }
    paint.color = colorValues[valueInInterval-1];
    double step = widthByInterval/(doubleValues[valueInInterval] - doubleValues[valueInInterval-1]);
    canvas.drawCircle(
      Offset(step*(_value - doubleValues[valueInInterval-1]) + widthByInterval * (valueInInterval-1), size.height/2),
      radius,
      paint,
    );
  }

  TextPainter _getTextPainter(String text) {
    var textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: textStyle,
      ),
      textAlign: textAlign,
      textDirection: textDirection,
    );
    // 进行布局
    textPainter.layout();
    return textPainter;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

}
