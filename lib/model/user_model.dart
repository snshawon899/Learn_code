class UserModel {
  String? uid;
  String? name;
  String? email;
  String? imageUrl;

  UserModel({this.uid, this.name, this.email, this.imageUrl});

  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map["uid"],
      name: map["name"],
      email: map["email"],
      imageUrl: map["imageUrl"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "uid": uid,
      "name": name,
      "email": email,
      "imageUrl": imageUrl,
    };
  }
}
