import 'package:flutter/material.dart';
import 'package:mvvm_pattern/users_list/models/model.dart';
// import 'package:mvvm_pattern/users_list/models/user_error.dart';
import 'package:mvvm_pattern/users_list/repo/api_status.dart';
import 'package:mvvm_pattern/users_list/repo/user_service.dart';

class UsersViewModel extends ChangeNotifier {
  bool _loading = false;
  List<UserModel> _userListModel = [];
  late UserModel _selectedUser;

  // UserError _userError = UserError();

  bool get loading => _loading;
  List<UserModel> get userListModel => _userListModel;
  UserModel get selectedUser => _selectedUser;
  // UserError get userError => _userError;

  UsersViewModel() {
    getUsers();
  }

  setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }

  setUserListModel(List<UserModel> userListModel) async {
    _userListModel = userListModel;
  }

  // setUserError(UserError userError) async {
  //   _userError = userError;
  // }

  setSelectedUser(UserModel selectedUser) {
    _selectedUser = selectedUser;
  }

  getUsers() async {
    setLoading(true);
    var res = await UserService.getUsers();

    if (res is Success) {
      setUserListModel(res.response as List<UserModel>);
    }
    // if (res is Failure) {
    //   UserError userError =
    //       UserError(code: res.code, message: res.errorResponse);
    //   setUserError(userError);
    // }

    setLoading(false);
  }
}
