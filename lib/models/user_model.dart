class UserModel {
  String name;
  String email;
  String address;
  String phone;
  String? birthDate; // Optional to handle cases where birthDate might not exist

  UserModel({
    required this.name,
    required this.address,
    required this.email,
    required this.phone,
    this.birthDate, // Added birthDate to the constructor
  });

  // Convert the JSON to a UserModel object
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json["name"] ?? "User",
      address: json["address"] ?? "",
      email: json["email"] ?? "",
      phone: json["phone"] ?? "",
      birthDate: json["birthDate"], // Null-safe extraction of birthDate
    );
  }

  // Convert the UserModel object to JSON
  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "address": address,
      "email": email,
      "phone": phone,
      "birthDate": birthDate, // Include birthDate in the JSON representation
    };
  }
}
