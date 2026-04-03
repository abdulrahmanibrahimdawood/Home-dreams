import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:home_dreams/core/errors/failures.dart';
import 'package:home_dreams/core/services/firestore_services.dart';
import 'package:home_dreams/core/services/supabase_services.dart';
import 'package:home_dreams/core/utils/backend_endpoints.dart';
import 'package:home_dreams/features/checkout/domain/repo/images_repo.dart';

class ImagesRepoImpl implements ImagesRepo {
  final StorageService storageService;
  final FirestoreServices firestoreServices;

  ImagesRepoImpl({
    required this.storageService,
    required this.firestoreServices,
  });
  @override
  Future<Either<Failure, String>> uploadImage(File image) async {
    try {
      String url = await storageService.uploadFile(
        image,
        BackendEndpoints.images,
      );
      return Right(url);
    } on Exception catch (e) {
      return Left(ServerFailure('Failed to upload image: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, String>> getImage(String id) async {
    try {
      final data =
          await firestoreServices.getData(
                path: 'profile_images',
                documentId: id,
              )
              as Map<String, dynamic>;

      final url = data['profileImageUrl'] as String?;

      if (url == null) {
        return Left(ServerFailure('No profile image found'));
      }

      return Right(url);
    } on Exception catch (e) {
      return Left(ServerFailure('Failed to get image: ${e.toString()}'));
    }
  }
}
