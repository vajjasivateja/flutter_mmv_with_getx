import 'package:flutter/foundation.dart';
import 'package:flutter_mmv_with_getx/data/response/status.dart';
import 'package:get/get.dart';

import '../../models/UsersList.dart';
import '../../repositories/UsersListRepository.dart';

class UsersListViewModel extends GetxService {
  final _userListRepo = UserListRepository();

  final rxRequestStatus = Status.LOADING.obs;

  final userList = UsersList().obs;

  RxString error = "".obs;

  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value;

  void setUserList(UsersList _userList) => userList.value = _userList;

  void setError(String _error) => error.value = _error;

  void getUserList(int pageNumber) {
    _userListRepo.getUserList(pageNumber).then((value) {
      setRxRequestStatus(Status.COMPLETED);
      setUserList(value);
      if (kDebugMode) {
        print("value");
      }
    }).onError((error, stackTrace) {
      setRxRequestStatus(Status.ERROR);
      if (kDebugMode) {
        print(error);
      }
      setError(error.toString());
    });
  }
}
