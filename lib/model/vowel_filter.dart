class VowelFilter {
  VowelCategory type;
  bool inactive;

  VowelFilter({required this.type, this.inactive = false});
}

enum VowelCategory { a, e, i, o, u, notA, notE, notI, notO, notU, wildcard }

extension Convert on VowelCategory {
  String stringValue() {
    String value = '';
    switch (this) {
      case VowelCategory.a:
        value = 'A';
        break;
      case VowelCategory.e:
        value = 'E';
        break;
      case VowelCategory.i:
        value = 'I';
        break;
      case VowelCategory.o:
        value = 'O';
        break;
      case VowelCategory.u:
        value = 'U';
        break;
      case VowelCategory.notA:
        value = 'A';
        break;
      case VowelCategory.notE:
        value = 'E';
        break;
      case VowelCategory.notI:
        value = 'I';
        break;
      case VowelCategory.notO:
        value = 'O';
        break;
      case VowelCategory.notU:
        value = 'U';
        break;
      case VowelCategory.wildcard:
        value = ' ';
        break;
    }
    return value;
  }

  bool isPositive() {
    bool value = true;
    switch (this) {
      case VowelCategory.a:
        value = true;
        break;
      case VowelCategory.e:
        value = true;
        break;
      case VowelCategory.i:
        value = true;
        break;
      case VowelCategory.o:
        value = true;
        break;
      case VowelCategory.u:
        value = true;
        break;
      case VowelCategory.notA:
        value = false;
        break;
      case VowelCategory.notE:
        value = false;
        break;
      case VowelCategory.notI:
        value = false;
        break;
      case VowelCategory.notO:
        value = false;
        break;
      case VowelCategory.notU:
        value = false;
        break;
      case VowelCategory.wildcard:
        value = true;
        break;
    }
    return value;
  }
}
