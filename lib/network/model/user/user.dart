import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable(includeIfNull: false)
class User {
  String? name;
  String? surname;
  String? birthDate;
  int? sallary;
  String? phoneNumber;
  String? identity;
  String? id;

  User({this.name, this.surname, this.birthDate, this.sallary, this.phoneNumber, this.identity, this.id});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  User copyWith({
    String? name,
    String? surname,
    String? birthDate,
    int? sallary,
    String? phoneNumber,
    String? identity,
    String? id,
  }) {
    return User(
      name: name ?? this.name,
      surname: surname ?? this.surname,
      birthDate: birthDate ?? this.birthDate,
      sallary: sallary ?? this.sallary,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      identity: identity ?? this.identity,
      id: id ?? this.id,
    );
  }
}
