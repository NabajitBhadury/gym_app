import 'package:fitness/services/db_services/models/app_model.dart';
import 'package:fitness/services/db_services/models/model_constant.dart';

class UserModel implements AppModel {
  final String uid;
  final String email;
  final String name;
  final String? photoUrl;
  final String? height;
  final String? weight;
  final String? age;

  UserModel({
    required this.uid,
    required this.email,
    required this.name,
    this.photoUrl,
    this.height,
    this.weight,
    this.age,
  });

  UserModel.newUser({
    required this.uid,
    required this.email,
    required this.name,
    this.photoUrl,
    this.height,
    this.weight,
    this.age,
  });

  UserModel copyWith({
    String? uid,
    String? email,
    String? name,
    String? photoUrl,
    String? height,
    String? weight,
    String? age,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      name: name ?? this.name,
      photoUrl: photoUrl ?? this.photoUrl,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      age: age ?? this.age,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      ModelConstant.uid: uid,
      ModelConstant.email: email,
      ModelConstant.name: name,
      ModelConstant.photoUrl: photoUrl,
      ModelConstant.height: height,
      ModelConstant.weight: weight,
      ModelConstant.age: age,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map[ModelConstant.uid],
      email: map[ModelConstant.email],
      name: map[ModelConstant.name],
      photoUrl: map[ModelConstant.photoUrl],
      height: map[ModelConstant.height],
      weight: map[ModelConstant.weight],
      age: map[ModelConstant.age],
    );
  }
}
