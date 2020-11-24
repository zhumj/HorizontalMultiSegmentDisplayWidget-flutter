# 水平多段显示小部件

<img src="./screenshot/Screenshot_1606210471.png"  height="660" width="300">

## 参数：

    参数|格式|作用
    :-:|:-:|:-:
    defaultValue|double|值
    doubleValues|List<double>|区间
    stringValues|List<String>|区间提示
    colorValues|List<Color>|区间颜色
    strokeWidth|double|线的宽度
    radius|double|线上圆的半径
    textStyle|TextStyle|文字风格
    textAlign|TextAlign|文字对齐方式
    textDirection|TextDirection|文字方向
    
## 使用：

    double defaultValue = 37.5;
    List<double> doubleValues = [0, 18.5, 25.0, 30.0, 45.0,];
    List<String> stringValues = ['偏瘦', '健康', '偏胖', '肥胖',];
    List<Color> colorValues = [Colors.greenAccent, Colors.lightBlueAccent, Colors.orange, Colors.red,];
      
    Container(
      width: MediaQuery.of(context).size.width,
      height: 80,
      color: Colors.brown,
      margin: EdgeInsets.only(top: 8),
      child: HorizontalMultiSegmentDisplayWidget(
        defaultValue, doubleValues, stringValues, colorValues,
      ),
    )
