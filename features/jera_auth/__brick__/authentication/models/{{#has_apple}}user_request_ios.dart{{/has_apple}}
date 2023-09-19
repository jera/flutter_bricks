class UserRequestIOS {
  final String givenName;
  final String familyName;
  final String appleToken;

  UserRequestIOS({
    required this.givenName,
    required this.familyName,
    required this.appleToken,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'oauth2_token': appleToken,
      'user_info': {
        'given_name': givenName,
        'family_name': familyName,
      },
    };
  }
}
