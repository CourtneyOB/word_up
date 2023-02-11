class VowelFilter {
  VowelType type;
  bool inactive;
  int roundNumberUsed;

  VowelFilter(
      {required this.type, this.inactive = false, this.roundNumberUsed = 0});
}

enum VowelType { a, e, i, o, u, notA, notE, notI, notO, notU, wildcard }

extension Convert on VowelType {
  String stringValue() {
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
