import 'package:flutter/foundation.dart';

enum RemoteConfigValues {
  baseUrl('mobile_base_url', 'https://base_url.com.br');

  final String key;
  final Object defaultValue;

  Map<String, dynamic> toMap() {
    return {key: defaultValue};
  }

  static Map<String, dynamic> get defaultValues {
    final values = <String, dynamic>{};

    for (final value in RemoteConfigValues.values) {
      values.addAll(value.toMap());
    }

    return values;
  }

  String get valueKey {
    if (kDebugMode) {
      return key.replaceAll('mobile', 'staging');
    }
    return key;
  }

  const RemoteConfigValues(this.key, this.defaultValue);
}
