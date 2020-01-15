import 'screen.dart';

//根据屏幕大小自适应字体大小
double fixedFontSize(double fontSize) {
  return fontSize / Screen.textScaleFactor;
}
