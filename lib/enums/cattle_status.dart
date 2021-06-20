enum CattleStatusEnum { Lactating, Dry, Pregnant }

extension ParseToString on CattleStatusEnum {
  String toShortString() {
    return this.toString().split('.').last;
  }
}
