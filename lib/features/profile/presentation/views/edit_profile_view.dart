import 'package:flutter/material.dart';
import 'package:home_dreams/core/services/get_it_services.dart';
import 'package:home_dreams/core/widgets/custom_app_bar_inside.dart';
import 'package:home_dreams/features/profile/domain/repos/update_user_data_repo.dart';
import 'package:home_dreams/features/profile/presentation/views/widgets/edit_profile_view_body.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});
  static const routeName = 'edit-profile';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBarInside(
        title: 'الملف الشخصي',
        context,
        showNotification: false,
      ),
      body: EditProfileViewBody(
        updateUserDataRepo: getIt<UpdateUserDataRepo>(),
      ),
    );
  }
}
