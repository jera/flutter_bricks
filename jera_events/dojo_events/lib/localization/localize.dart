import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localization.dart';

abstract class LocalizeProtocol {
  Localization get l10n;
}

class Localize extends LocalizeProtocol {
  Localization? _l10n;
  static Localize instance = Localize._();

  Localize._();

  @override
  Localization get l10n => _l10n!;

  Localization of(BuildContext context) {
    _l10n ??= Localization.of(context);
    return l10n;
  }
}
