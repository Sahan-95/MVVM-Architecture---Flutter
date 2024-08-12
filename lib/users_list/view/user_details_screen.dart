import 'package:flutter/material.dart';
import 'package:mvvm_pattern/users_list/view_model/users_view_model.dart';
import 'package:provider/provider.dart';


class UserDetailsScreen extends StatelessWidget {
  const UserDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    UsersViewModel userViewModel = context.watch<UsersViewModel>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(userViewModel.selectedUser.name),
      ),
    );
  }
}