import 'package:flutter/material.dart';
import 'package:mvvm_pattern/users_list/models/model.dart';
import 'package:mvvm_pattern/users_list/view/user_details_screen.dart';
import 'package:mvvm_pattern/users_list/view_model/users_view_model.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    UsersViewModel userViewModel = context.watch<UsersViewModel>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Column(
          children: [_ui(userViewModel)],
        ),
      ),
    );
  }

  _ui(UsersViewModel userViewModel) {
    if (userViewModel.loading) {
      const CircularProgressIndicator();
    }

    // if (userViewModel.userError != null) {
    //   return Container();
    // }

    return Expanded(
      child: ListView.separated(
          itemBuilder: (context, index) {
            UserModel userModel = userViewModel.userListModel[index];

            return InkWell(
              onTap: () {
                userViewModel.setSelectedUser(userModel);
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const UserDetailsScreen()));
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userModel.name,
                    style: const TextStyle(color: Colors.black),
                  ),
                  Text(userModel.email)
                ],
              ),
            );
          },
          separatorBuilder: (context, index) => Divider(),
          itemCount: userViewModel.userListModel.length),
    );
  }
}
