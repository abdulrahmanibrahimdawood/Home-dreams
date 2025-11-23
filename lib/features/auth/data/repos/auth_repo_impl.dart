import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:home_dreams/constants.dart';
import 'package:home_dreams/core/errors/exceptions.dart';
import 'package:home_dreams/core/errors/failures.dart';
import 'package:home_dreams/core/services/data_service.dart';
import 'package:home_dreams/core/services/firebase_auth_service.dart';
import 'package:home_dreams/core/services/shared_preferences_singleton.dart';
import 'package:home_dreams/core/utils/backend_endpoints.dart';
import 'package:home_dreams/features/auth/data/models/user_model.dart';
import 'package:home_dreams/features/auth/domain/entites/user_entity.dart';
import 'package:home_dreams/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;
  final DatabaseServices databaseServices;

  AuthRepoImpl({
    required this.firebaseAuthService,
    required this.databaseServices,
  });

  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
    String email,
    String password,
    String name,
  ) async {
    User? user;
    try {
      user = await firebaseAuthService.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      var userEntity = UserEntity(name: name, email: email, uId: user.uid);
      await addUserData(user: userEntity);
      return right(userEntity);
    } on CustomException catch (e) {
      await deleteUser(user);
      return left(ServerFailure(e.message));
    } catch (e) {
      await deleteUser(user);
      log(
        'Exception in AuthRepoImpl.CreateUserWithEmailAndPassword: ${e.toString()}',
      );
      return left(ServerFailure('حدث خطأ ما. الرجاء المحاولة مرة اخرى.'));
    }
  }

  Future<void> deleteUser(User? user) async {
    if (user != null) {
      await firebaseAuthService.deleteUser();
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      var user = await firebaseAuthService.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      var userEntity = await getUserData(uid: user.uid);
      await saveUserData(user: userEntity);
      return right(userEntity);
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      log(
        'Exception in AuthRepoImpl.signInWithEmailAndPassword: ${e.toString()}',
      );
      return left(ServerFailure('حدث خطأ ما. الرجاء المحاولة مرة اخرى.'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    User? user;
    try {
      user = await firebaseAuthService.signInWithGoogle();
      var userEntity = UserModel.fromFirebaseUser(user);
      var isUserExist = await databaseServices.checkIfDataExists(
        path: BackendEndpoints.addUserData,
        documentId: userEntity.uId,
      );
      if (isUserExist) {
        await getUserData(uid: user.uid);
      } else {
        await addUserData(user: userEntity);
      }
      await saveUserData(user: userEntity);
      return right(userEntity);
    } catch (e) {
      await deleteUser(user);
      log('Exception in AuthRepoImpl.signInWithGoogle: ${e.toString()}');
      return left(ServerFailure('حدث خطأ ما. الرجاء المحاولة مرة اخرى.'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithFacebook() async {
    User? user;
    try {
      user = await firebaseAuthService.signInWithFacebook();
      var userEntity = UserModel.fromFirebaseUser(user);
      var isUserExist = await databaseServices.checkIfDataExists(
        path: BackendEndpoints.addUserData,
        documentId: userEntity.uId,
      );
      if (isUserExist) {
        await getUserData(uid: user.uid);
      } else {
        await addUserData(user: userEntity);
      }
      await saveUserData(user: userEntity);
      return right(userEntity);
    } catch (e) {
      await deleteUser(user);
      log('Exception in AuthRepoImpl.signInWithGoogle: ${e.toString()}');
      return left(ServerFailure('حدث خطأ ما. الرجاء المحاولة مرة اخرى.'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithApple() async {
    User? user;
    try {
      user = await firebaseAuthService.signInWithApple();
      var userEntity = UserModel.fromFirebaseUser(user);
      var isUserExist = await databaseServices.checkIfDataExists(
        path: BackendEndpoints.addUserData,
        documentId: userEntity.uId,
      );
      if (isUserExist) {
        await getUserData(uid: user.uid);
      } else {
        await addUserData(user: userEntity);
      }
      await saveUserData(user: userEntity);
      return right(userEntity);
    } catch (e) {
      await deleteUser(user);
      log('Exception in AuthRepoImpl.signInWithGoogle: ${e.toString()}');
      return left(ServerFailure('حدث خطأ ما. الرجاء المحاولة مرة اخرى.'));
    }
  }

  @override
  Future addUserData({required UserEntity user}) {
    databaseServices.addData(
      path: BackendEndpoints.addUserData,
      data: UserModel.fromEntity(user).toMap(),
      documentId: user.uId,
    );
    return Future.value(unit);
  }

  @override
  Future<UserEntity> getUserData({required String uid}) async {
    var userData = await databaseServices.getData(
      path: BackendEndpoints.getUserData,
      documentId: uid,
    );
    return UserModel.fromJson(userData);
  }

  @override
  Future saveUserData({required UserEntity user}) async {
    var jsonData = jsonEncode(UserModel.fromEntity(user).toMap());
    await Prefs.setString(kUserData, jsonData);
  }

  @override
  Future resetPassword({required String email}) async {
    try {
      await firebaseAuthService.resetPassword(email: email);
    } catch (e) {
      throw CustomException(
        message: 'لقد حدث خطأ ما. الرجاء المحاولة مرة اخرى.',
      );
    }
  }
}
