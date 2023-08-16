import 'dart:convert';

RegisterModel registerModelFromJson(String str) =>
    RegisterModel.fromJson(json.decode(str));

String registerModelToJson(RegisterModel data) => json.encode(data.toJson());

class RegisterModel {
  final String email;
  final String password;
  final String name;
  final String birthDate;
  final String addressId;
  final String age;
  final String smoked;
  final DateTime updatedAt;
  final DateTime createdAt;
  final int id;

  RegisterModel({
    required this.email,
    required this.password,
    required this.name,
    required this.birthDate,
    required this.addressId,
    required this.age,
    required this.smoked,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
        email: json["Email"],
        password: json["Password"],
        name: json["Name"],
        birthDate: json["BirthDate"],
        addressId: json["Address_id"],
        age: json["Age"],
        smoked: json["Smoked"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "Email": email,
        "Password": password,
        "Name": name,
        "BirthDate": birthDate,
        "Address_id": addressId,
        "Age": age,
        "Smoked": smoked,
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "id": id,
      };
}
