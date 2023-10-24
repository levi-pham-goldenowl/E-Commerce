enum ColorType { black, red, white, blue, yellow }

extension ColorTypeExt on ColorType {
  String value() {
    switch (this) {
      case ColorType.black:
        return "Black";
      case ColorType.red:
        return "Red";
      case ColorType.white:
        return "White";
      case ColorType.blue:
        return "Blue";
      case ColorType.yellow:
        return "Yellow";
      default:
        return "N/A";
    }
  }

  bool selectedColor(ColorType value) {
    return value == this ? true : false;
  }
}
