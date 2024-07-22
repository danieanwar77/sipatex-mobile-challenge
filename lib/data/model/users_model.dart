class UsersModel {
  // Define class properties
  int? id; // User ID
  String? username; // User name
  String? password; // Password
  String? role;// User role

  // Constructor with optional 'id' parameter
  UsersModel(this.username, this.password, this.role, {this.id});

  // Convert a Users into a Map. The keys must correspond to the names of the
  // columns in the database.
  UsersModel.fromJson(Map<String, dynamic> map) {
    id = map['id'];
    username = map['username'];
    password = map['password'];
    role = map['role'];
  }

// Method to convert a 'UsersModel' to a map
  Map<String, dynamic> toJson() {
    return {
      'id' : id,
      'username': username,
      'password': password,
      'role': role,
    };
  }
}