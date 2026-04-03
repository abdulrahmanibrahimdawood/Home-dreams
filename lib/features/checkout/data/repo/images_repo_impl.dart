import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:home_dreams/core/errors/failures.dart';
import 'package:home_dreams/core/services/supabase_services.dart';
import 'package:home_dreams/core/utils/backend_endpoints.dart';
import 'package:home_dreams/features/checkout/domain/repo/images_repo.dart';

class ImagesRepoImpl implements ImagesRepo {
  final StorageService storageService;

  ImagesRepoImpl({required this.storageService});
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
}
