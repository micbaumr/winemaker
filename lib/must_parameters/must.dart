import 'package:lombok/lombok.dart';

@data
class Must {
  double volume;
  double sugarInBlg;

  Must(this.volume, this.sugarInBlg);
}