import 'package:word_up/main.dart';

extension StringValue on VowelType {
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
        value = '';
        break;
    }
    return value;
  }
}
