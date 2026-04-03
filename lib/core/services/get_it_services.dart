import 'package:get_it/get_it.dart';
import 'package:home_dreams/core/repos/order_repo/order_repo.dart';
import 'package:home_dreams/core/repos/order_repo/order_repo_impl.dart';
import 'package:home_dreams/core/repos/products_repo/product_repo.dart';
import 'package:home_dreams/core/repos/products_repo/product_repo_impl.dart';
import 'package:home_dreams/core/services/data_service.dart';
import 'package:home_dreams/core/services/firebase_auth_service.dart';
import 'package:home_dreams/core/services/firestore_services.dart';
import 'package:home_dreams/core/services/supabase_services.dart';
import 'package:home_dreams/core/services/supabase_storage_service.dart';
import 'package:home_dreams/features/auth/data/repos/auth_repo_impl.dart';
import 'package:home_dreams/features/auth/domain/repos/auth_repo.dart';
import 'package:home_dreams/features/checkout/data/repo/images_repo_impl.dart';
import 'package:home_dreams/features/checkout/domain/repo/images_repo.dart';
import 'package:home_dreams/features/profile/data/repo/update_user_data_repo_impl.dart';
import 'package:home_dreams/features/profile/domain/repos/update_user_data_repo.dart';
import 'package:home_dreams/features/search/data/repo/search_repo_impl.dart';
import 'package:home_dreams/features/search/domain/repo/search_repo.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  /// ====== Services ======
  // Firestore service نفسها متاحة لأي repo يحتاجها مباشرة
  getIt.registerSingleton<FirestoreServices>(FirestoreServices());

  // DatabaseServices abstraction يظل موجود
  getIt.registerSingleton<DatabaseServices>(getIt<FirestoreServices>());

  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());

  // Storage service
  getIt.registerLazySingleton<StorageService>(() => SupabaseStorageService());

  /// ====== Repos ======
  // Auth repo
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(
      firebaseAuthService: getIt<FirebaseAuthService>(),
      databaseServices: getIt<DatabaseServices>(),
    ),
  );

  // Products repo
  getIt.registerSingleton<ProductsRepo>(
    ProductsRepoImpl(databaseServices: getIt<DatabaseServices>()),
  );

  // Order repo
  getIt.registerSingleton<OrderRepo>(
    OrderRepoImpl(firestoreServices: getIt<FirestoreServices>()),
  );

  // Search repo
  getIt.registerSingleton<SearchRepo>(
    SearchRepoImpl(databaseServices: getIt<DatabaseServices>()),
  );

  // Images repo
  getIt.registerSingleton<ImagesRepo>(
    ImagesRepoImpl(
      storageService: getIt<StorageService>(),
      firestoreServices: getIt<FirestoreServices>(),
    ),
  );

  // Update user data repo
  getIt.registerSingleton<UpdateUserDataRepo>(
    UpdateUserDataRepoImpl(
      authRepo: getIt<AuthRepo>(),
      firebaseAuthService: getIt<FirebaseAuthService>(),
      databaseServices: getIt<DatabaseServices>(),
    ),
  );
}
