// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PremiumUserModel {
  final String deviceIP;
  final bool adPremium;
  PremiumUserModel({
    required this.deviceIP,
    required this.adPremium,
  });
  

  PremiumUserModel copyWith({
    String? deviceIP,
    bool? adPremium,
  }) {
    return PremiumUserModel(
      deviceIP: deviceIP ?? this.deviceIP,
      adPremium: adPremium ?? this.adPremium,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'deviceIP': deviceIP,
      'adPremium': adPremium,
    };
  }

  factory PremiumUserModel.fromMap(Map<String, dynamic> map) {
    return PremiumUserModel(
      deviceIP: map['deviceIP'] as String,
      adPremium: map['adPremium'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory PremiumUserModel.fromJson(String source) => PremiumUserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'PremiumUserModel(deviceIP: $deviceIP, adPremium: $adPremium)';

  @override
  bool operator ==(covariant PremiumUserModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.deviceIP == deviceIP &&
      other.adPremium == adPremium;
  }

  @override
  int get hashCode => deviceIP.hashCode ^ adPremium.hashCode;
}
