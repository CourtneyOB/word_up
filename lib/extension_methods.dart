import 'package:word_up/main.dart';

extension Convert on VowelType {
  String toStringValue() {
    String value = '';
    switch (this) {
      case VowelType.a:
        value = 'A';
        break;
      case VowelType.e:
        value = 'E';
        break;
      case VowelType.i:
        value = 'I';
        break;
      case VowelType.o:
        value = 'O';
        break;
      case VowelType.u:
        value = 'U';
        break;
      case VowelType.notA:
        value = 'A';
        break;
      case VowelType.notE:
        value = 'E';
        break;
      case VowelType.notI:
        value = 'I';
        break;
      case VowelType.notO:
        value = 'O';
        break;
      case VowelType.notU:
        value = 'U';
        break;
      case VowelType.wildcard:
        value = ' ';
        break;
    }
    return value;
  }

  BoxDecor? toBoxDecor() {
    BoxDecor? value;
    switch (this) {
      case VowelType.a:
        value = null;
        break;
      case VowelType.e:
        value = null;
        break;
      case VowelType.i:
        value = null;
        break;
      case VowelType.o:
        value = null;
        break;
      case VowelType.u:
        value = null;
        break;
      case VowelType.notA:
        value = BoxDecor.negative;
        break;
      case VowelType.notE:
        value = BoxDecor.negative;
        break;
      case VowelType.notI:
        value = BoxDecor.negative;
        break;
      case VowelType.notO:
        value = BoxDecor.negative;
        break;
      case VowelType.notU:
        value = BoxDecor.negative;
        break;
      case VowelType.wildcard:
        value = BoxDecor.multiLetter;
        break;
    }
    return value;
  }

  bool isPositive() {
    bool value = true;
    switch (this) {
      case VowelType.a:
        value = true;
        break;
      case VowelType.e:
        value = true;
        break;
      case VowelType.i:
        value = true;
        break;
      case VowelType.o:
        value = true;
        break;
      case VowelType.u:
        value = true;
        break;
      case VowelType.notA:
        value = false;
        break;
      case VowelType.notE:
        value = false;
        break;
      case VowelType.notI:
        value = false;
        break;
      case VowelType.notO:
        value = false;
        break;
      case VowelType.notU:
        value = false;
        break;
      case VowelType.wildcard:
        value = true;
        break;
    }
    return value;
  }
}
