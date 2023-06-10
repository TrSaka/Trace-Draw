// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class VersionNumber {
  final String oldVersion;
  final String newVersion;
  final bool state;
  VersionNumber({
    required this.oldVersion,
    required this.newVersion,
    required this.state,
  });

  VersionNumber copyWith({
    String? oldVersion,
    String? newVersion,
    bool? state,
  }) {
    return VersionNumber(
      oldVersion: oldVersion ?? this.oldVersion,
      newVersion: newVersion ?? this.newVersion,
      state: state ?? this.state,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'oldVersion': oldVersion,
      'newVersion': newVersion,
      'state': state,
    };
  }

  factory VersionNumber.fromMap(Map<String, dynamic> map) {
    return VersionNumber(
      oldVersion: map['oldVersion'] as String,
      newVersion: map['newVersion'] as String,
      state: map['state'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory VersionNumber.fromJson(String source) => VersionNumber.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'VersionNumber(oldVersion: $oldVersion, newVersion: $newVersion, state: $state)';

  @override
  bool operator ==(covariant VersionNumber other) {
    if (identical(this, other)) return true;
  
    return 
      other.oldVersion == oldVersion &&
      other.newVersion == newVersion &&
      other.state == state;
  }

  @override
  int get hashCode => oldVersion.hashCode ^ newVersion.hashCode ^ state.hashCode;
}
