class UserModel {
  final String? id;
  final String fullName;
  final String email;
  final String phoneNo;
  final String address;
  final String
      role; // This field will store roles like 'customer', 'caretaker', 'doctor'

  // Constructor
  const UserModel({
    this.id,
    required this.fullName,
    required this.email,
    required this.phoneNo,
    required this.address,
    this.role = 'customer', // Default to 'customer'
  });

  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      "FullName": fullName,
      "Email": email,
      "Phone": phoneNo,
      "Address": address,
      "Role": role,
    };
  }

  // Convert from JSON
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      fullName: json['FullName'],
      email: json['Email'],
      phoneNo: json['Phone'],
      address: json['Address'],
      role: json['Role'] ?? 'customer', // Default to 'customer'
    );
  }
}
