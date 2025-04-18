import 'package:fitness/services/db_services/models/app_model.dart';
import 'package:fitness/services/db_services/models/model_constant.dart';

class UserModel implements AppModel {
  final String uid;
  final String email;
  final String name;
  final String? photoUrl;

  UserModel({
    required this.uid,
    required this.email,
    required this.name,
    this.photoUrl,
  });

  UserModel.newUser({
    required this.uid,
    required this.email,
    required this.name,
    this.photoUrl,
  });

  UserModel copyWith({
    String? uid,
    String? email,
    String? name,
    String? photoUrl,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      name: name ?? this.name,
      photoUrl: photoUrl ?? this.photoUrl,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      ModelConstant.uid: uid,
      ModelConstant.email: email,
      ModelConstant.name: name,
      ModelConstant.photoUrl: photoUrl,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map[ModelConstant.uid],
      email: map[ModelConstant.email],
      name: map[ModelConstant.name],
      photoUrl: map[ModelConstant.photoUrl],
    );
  }
}
