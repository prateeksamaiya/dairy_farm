enum CattleType { Cow, Buffalo }

extension ParseToString on CattleType {
  String toShortString() {
    return this.toString().split('.').last;
  }
}
