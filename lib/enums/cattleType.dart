enum cattleType { Cow, Buffalo }

extension ParseToString on cattleType {
  String toShortString() {
    return this.toString().split('.').last;
  }
}
