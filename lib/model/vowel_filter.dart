import 'package:word_up/main.dart';

class VowelFilter {
  String value;
  bool isPositive;
  bool isWildcard;
  bool inactive;

  VowelFilter(
      {this.value = ' ',
      this.isPositive = true,
      this.isWildcard = false,
      this.inactive = false});
}
