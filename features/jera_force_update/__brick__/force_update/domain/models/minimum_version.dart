class MinimumVersion {
  String platform;
  String buildNumber;
  String? description;
  String versionNumber;
  bool? isRequiredVersion;

  MinimumVersion.fromMap(Map<String, dynamic> map)
      : platform = map['platform'],
        description = map['description'],
        buildNumber = map['build_number'],
        isRequiredVersion = map['required'],
        versionNumber = map['version_number'];
}
