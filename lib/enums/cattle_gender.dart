enum CattleGender { Male, Female, Other }

extension ParseToString on CattleGender {
  String toShortString() {
    return this.toString().split('.').last;
  }
}
