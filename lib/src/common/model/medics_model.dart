class DoctorModel {
  final int? id;
  final String? about;
  final String? firstName;
  final String? lastName;
  final String? speciality;
  final double? price;
  final double? rating;
  final double? latitude;
  final double? longitude;
  final String? imageUrl;

  DoctorModel({
    this.id,
    this.about,
    this.firstName,
    this.lastName,
    this.speciality,
    this.price,
    this.rating,
    this.latitude,
    this.longitude,
    this.imageUrl,
  });

  factory DoctorModel.fromJson(Map<String, Object?> json) {
    return DoctorModel(
      id: json['id'] as int?,
      about: json['about'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      speciality: json['speciality'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      rating: (json['rating'] as num?)?.toDouble(),
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      imageUrl: json['imageUrl'] as String?,
    );
  }
}

class ArticleModel {
  final int? id;
  final String? title;
  final String? content;
  final int? authorId;
  final int? views;
  final String? imageUrl;
  final DateTime? createdAt;

  ArticleModel({
    this.id,
    this.title,
    this.content,
    this.authorId,
    this.views,
    this.imageUrl,
    this.createdAt,
  });

  factory ArticleModel.fromJson(Map<String, Object?> json) {
    return ArticleModel(
      id: json['id'] as int?,
      title: json['title'] as String?,
      content: json['content'] as String?,
      authorId: json['authorId'] as int?,
      views: json['views'] as int?,
      imageUrl: json['imageUrl'] as String?,
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'] as String)
          : null,
    );
  }

  Map<String, Object?> toJson() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'authorId': authorId,
      'views': views,
      'imageUrl': imageUrl,
      'createdAt': createdAt?.toIso8601String(),
    };
  }
}




class UserResponse {
  final bool success;
  final String? message;
  final UserData data;

  UserResponse({required this.success, this.message, required this.data});

  // CopyWith method
  UserResponse copyWith({
    bool? success,
    String? message,
    UserData? data,
  }) {
    return UserResponse(
      success: success ?? this.success,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  // fromJson method
  factory UserResponse.fromJson(Map<String, Object?> json) {
    return UserResponse(
      success: json['success'] as bool,
      message: json['message'] as String?,
      data: UserData.fromJson(json['data'] as Map<String, Object?>),
    );
  }

  // toJson method
  Map<String, Object?> toJson() {
    return {
      'success': success,
      'message': message,
      'data': data.toJson(),
    };
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is UserResponse &&
              runtimeType == other.runtimeType &&
              success == other.success &&
              message == other.message &&
              data == other.data;

  @override
  int get hashCode => Object.hash(success, message, data);

  @override
  String toString() {
    return 'UserResponse(success: $success, message: $message, data: $data)';
  }
}

class UserData {
  final int id;
  final String? fistName;
  final String? lastName;
  final String username;
  final String email;
  final String? age;
  final String gender;
  final Role role;
  final bool enable;
  final bool accountNonBlocked;
  final String? imageUrl;

  UserData({
    required this.id,
    this.fistName,
    this.lastName,
    required this.username,
    required this.email,
    this.age,
    required this.gender,
    required this.role,
    required this.enable,
    required this.accountNonBlocked,
    this.imageUrl,
  });

  // CopyWith method
  UserData copyWith({
    int? id,
    String? fistName,
    String? lastName,
    String? username,
    String? email,
    String? age,
    String? gender,
    Role? role,
    bool? enable,
    bool? accountNonBlocked,
    String? imageUrl,
  }) {
    return UserData(
      id: id ?? this.id,
      fistName: fistName ?? this.fistName,
      lastName: lastName ?? this.lastName,
      username: username ?? this.username,
      email: email ?? this.email,
      age: age ?? this.age,
      gender: gender ?? this.gender,
      role: role ?? this.role,
      enable: enable ?? this.enable,
      accountNonBlocked: accountNonBlocked ?? this.accountNonBlocked,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  // fromJson method
  factory UserData.fromJson(Map<String, Object?> json) {
    return UserData(
      id: json['id'] as int,
      fistName: json['fistName'] as String?,
      lastName: json['lastName'] as String?,
      username: json['username'] as String,
      email: json['email'] as String,
      age: json['age'] as String?,
      gender: json['gender'] as String,
      role: Role.fromJson(json['role'] as Map<String, Object?>),
      enable: json['enable'] as bool,
      accountNonBlocked: json['accountNonBlocked'] as bool,
      imageUrl: json['imageUrl'] as String?,
    );
  }

  // toJson method
  Map<String, Object?> toJson() {
    return {
      'id': id,
      'fistName': fistName,
      'lastName': lastName,
      'username': username,
      'email': email,
      'age': age,
      'gender': gender,
      'role': role.toJson(),
      'enable': enable,
      'accountNonBlocked': accountNonBlocked,
      'imageUrl': imageUrl,
    };
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is UserData &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              fistName == other.fistName &&
              lastName == other.lastName &&
              username == other.username &&
              email == other.email &&
              age == other.age &&
              gender == other.gender &&
              role == other.role &&
              enable == other.enable &&
              accountNonBlocked == other.accountNonBlocked &&
              imageUrl == other.imageUrl;

  @override
  int get hashCode => Object.hash(
    id,
    fistName,
    lastName,
    username,
    email,
    age,
    gender,
    role,
    enable,
    accountNonBlocked,
    imageUrl,
  );

  @override
  String toString() {
    return 'UserData(id: $id, fistName: $fistName, lastName: $lastName, username: $username, email: $email, '
        'age: $age, gender: $gender, role: $role, enable: $enable, accountNonBlocked: $accountNonBlocked, '
        'imageUrl: $imageUrl)';
  }
}

class Role {
  final int id;
  final String name;
  final List<Authority> authorities;

  Role({required this.id, required this.name, required this.authorities});

  // CopyWith method
  Role copyWith({
    int? id,
    String? name,
    List<Authority>? authorities,
  }) {
    return Role(
      id: id ?? this.id,
      name: name ?? this.name,
      authorities: authorities ?? this.authorities,
    );
  }

  // fromJson method
  factory Role.fromJson(Map<String, Object?> json) {
    var list = json['authorities'] as List<Object?>;
    List<Authority> authoritiesList = list.map((i) => Authority.fromJson(i as Map<String, Object?>)).toList();
    return Role(
      id: json['id'] as int,
      name: json['name'] as String,
      authorities: authoritiesList,
    );
  }

  // toJson method
  Map<String, Object?> toJson() {
    return {
      'id': id,
      'name': name,
      'authorities': authorities.map((e) => e.toJson()).toList(),
    };
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Role &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              name == other.name &&
              authorities == other.authorities;

  @override
  int get hashCode => Object.hash(id, name, authorities);

  @override
  String toString() {
    return 'Role(id: $id, name: $name, authorities: $authorities)';
  }
}

class Authority {
  final int id;
  final String authorities;

  Authority({required this.id, required this.authorities});

  // CopyWith method
  Authority copyWith({
    int? id,
    String? authorities,
  }) {
    return Authority(
      id: id ?? this.id,
      authorities: authorities ?? this.authorities,
    );
  }

  // fromJson method
  factory Authority.fromJson(Map<String, Object?> json) {
    return Authority(
      id: json['id'] as int,
      authorities: json['authorities'] as String,
    );
  }

  // toJson method
  Map<String, Object?> toJson() {
    return {
      'id': id,
      'authorities': authorities,
    };
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Authority &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              authorities == other.authorities;

  @override
  int get hashCode => Object.hash(id, authorities);

  @override
  String toString() {
    return 'Authority(id: $id, authorities: $authorities)';
  }
}
