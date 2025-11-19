import 'dart:convert';

import 'package:home_dreams/constants.dart';
import 'package:home_dreams/core/services/shared_preferences_singleton.dart';
import 'package:home_dreams/features/auth/data/models/user_model.dart';
import 'package:home_dreams/features/auth/domain/entites/user_entity.dart';

UserEntity getUser() {
  var jsonString = Prefs.getString(kUserData);
  var userEntity = UserModel.fromJson(jsonDecode(jsonString));
  return userEntity;
}
