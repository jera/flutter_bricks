enum ContactUsOptions {
  optionOne,
  optionTwo,
  optionThree,
  optionFour,
  other;

  String get description {
    switch (this) {
      case ContactUsOptions.optionOne:
        return 'Primeira Opção';
      case ContactUsOptions.optionTwo:
        return 'Segunda Opção';
      case ContactUsOptions.optionThree:
        return 'Terceira Opção';
      case ContactUsOptions.optionFour:
        return 'Quarta Opção';
      case ContactUsOptions.other:
        return 'Outra Opção';
    }
  }
}
