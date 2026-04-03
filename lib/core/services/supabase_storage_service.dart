import 'dart:developer';
import 'dart:io';

import 'package:home_dreams/core/services/supabase_services.dart';
import 'package:home_dreams/core/utils/keys.dart';
import 'package:path/path.dart' as b;
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseStorageService implements StorageService {
  static late Supabase _supabase;
  static createBuckets(String bucketName) async {
    var buckets = await _supabase.client.storage.listBuckets();
    bool isBucketExists = false;
    for (var bucket in buckets) {
      if (bucket.id == bucketName) {
        isBucketExists = true;
        break;
      }
    }
    if (!isBucketExists) {
      await _supabase.client.storage.createBucket(bucketName);
    }
  }

  static initSupabase() async {
    _supabase = await Supabase.initialize(
      url: kSupabaseUrl,
      anonKey: kSupabaseKey,
    );
  }

  @override
  Future<String> uploadFile(File file, String path) async {
    String fileName = b.basename(file.path);
    String extensionName = b.extension(file.path);
    var result = await _supabase.client.storage
        .from('profile_image')
        .upload('$path/$fileName.$extensionName', file);
    final String publicUrl = _supabase.client.storage
        .from('profile_image')
        .getPublicUrl('$path/$fileName.$extensionName');
    log(publicUrl);
    return result;
  }
}
