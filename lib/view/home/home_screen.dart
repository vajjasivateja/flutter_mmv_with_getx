import 'package:flutter/material.dart';
import 'package:flutter_mmv_with_getx/data/response/status.dart';
import 'package:flutter_mmv_with_getx/data/shared_preferences/user_preferences.dart';
import 'package:flutter_mmv_with_getx/res/components/internet_exception_widget.dart';
import 'package:flutter_mmv_with_getx/res/routes/routes_name.dart';
import 'package:flutter_mmv_with_getx/viewModels/controllers/users_list_view_model.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  UserPreferences preferences = UserPreferences();
  final userListViewModel = Get.put(UsersListViewModel());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userListViewModel.getUserList(2);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    Get.delete<UsersListViewModel>();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  preferences.remove();
                  Get.toNamed(RoutesName.login_screen);
                },
                icon: Icon(Icons.logout)),
          ],
        ),
        body: Obx(() {
          switch (userListViewModel.rxRequestStatus.value) {
            case Status.LOADING:
              return const Center(child: CircularProgressIndicator(color: Colors.lightBlue));
            case Status.COMPLETED:
              return ListView.builder(
                itemCount: userListViewModel.userList.value.data!.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: ListTile(
                        leading: CircleAvatar(backgroundImage: NetworkImage(userListViewModel.userList.value.data![index].avatar.toString()), radius: 40),
                        title: Text(userListViewModel.userList.value.data![index].firstName.toString()),
                        subtitle: Text(userListViewModel.userList.value.data![index].email.toString()),
                      ),
                    ),
                  );
                },
              );
            case Status.ERROR:
              return InternetExceptionWidget(
                onPressed: () {
                  userListViewModel.getUserList(2);
                },
                errorMessage: userListViewModel.error.value,
              );
          }
        }),
      ),
    );
  }
}
