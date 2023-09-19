import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'models/user.dart';

abstract class SessionManagerProtocol {
  User? get user;
  bool get hasSession;
  Future<void> verifySession();
  Future<void> removeSession();
  Future<void> createSession(User user);
}

class SessionManager extends SessionManagerProtocol {
  final _user = ValueNotifier<User?>(null);
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  static final SessionManagerProtocol instance = SessionManager._();

  /// Init
  SessionManager._();

  /// SessionManagerProtocol
  @override
  User? get user => _user.value;

  @override
  bool get hasSession => _user.value != null;

  @override
  Future<void> verifySession() async {
    final userJson = await _secureStorage.read(key: 'user_session');
    if (userJson == null) return;

    _user.value = User.deserialize(userJson);
  }

  @override
  Future<void> removeSession() async {
    _user.value = null;

    await _secureStorage.deleteAll();
  }

  @override
  Future<void> createSession(User user) async {
    _user.value = user;
    await _secureStorage.write(key: 'user_session', value: User.serialize(user));
  }
}
