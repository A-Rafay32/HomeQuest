enum Gender {
  male,
  female,
  other;

  static Gender? toGender(String? str) {
    return Gender.values.firstWhere((element) => element.name == str);
  }
}
