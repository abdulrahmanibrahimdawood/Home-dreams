import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_dreams/core/services/get_it_services.dart';
import 'package:home_dreams/core/widgets/custom_app_bar_inside.dart';
import 'package:home_dreams/features/profile/domain/repos/update_user_data_repo.dart';
import 'package:home_dreams/features/profile/presentation/manager/update_user_data_cubit/update_user_data_cubit.dart';
import 'package:home_dreams/features/profile/presentation/views/widgets/edit_profile_view_bloc_consumer.dart';
import 'package:home_dreams/generated/l10n.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});
  static const routeName = 'edit-profile';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UpdateUserDataCubit(getIt<UpdateUserDataRepo>()),
      child: Scaffold(
        appBar: buildAppBarInside(
          title: S.of(context).personalProfile,
          context,
          showNotification: false,
        ),
        body: const EditProfileViewBlocConsumer(),
      ),
    );
  }
}
