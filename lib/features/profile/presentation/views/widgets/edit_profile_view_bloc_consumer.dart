import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_dreams/core/helper_funcations/build_error_bar.dart';
import 'package:home_dreams/features/profile/presentation/manager/update_user_data_cubit/update_user_data_cubit.dart';
import 'package:home_dreams/features/profile/presentation/views/widgets/edit_profile_view_body.dart';

class EditProfileViewBlocConsumer extends StatelessWidget {
  const EditProfileViewBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdateUserDataCubit, UpdateUserDataState>(
      listener: (context, state) {
        if (state is UpdateUserNameSuccess) {
          showBar(context, 'تم التعديل بنجاح');
        }
        if (state is UpdateEmailSuccess) {
          showBar(context, 'تأكد من البريد الوارد للتفعيل');
        }
        if (state is UpdatePasswordSuccess) {
          showBar(context, 'تم التعديل بنجاح');
        }
        if (state is UpdateUserNameFailure) {
          showBar(context, state.message);
        }
        if (state is UpdateEmailFailure) {
          showBar(context, state.message);
        }
        if (state is UpdatePasswordFailure) {
          showBar(context, state.message);
        }
      },
      builder: (context, state) {
        if (state is UpdateUserNameLoading ||
            state is UpdateEmailLoading ||
            state is UpdatePasswordLoading) {
          return Stack(
            children: [
              Opacity(opacity: 0.7, child: EditProfileViewBody()),
              Center(child: CircularProgressIndicator()),
            ],
          );
        } else {
          return EditProfileViewBody();
        }
      },
    );
  }
}
