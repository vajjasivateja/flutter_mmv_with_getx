/// token : "QpwL5tke4Pnpja7X4"

class UserDataModel {
  String? _token;
  bool? isLogin;

  String? get token => _token;

  UserDataModel({String? token, bool? isLogin}) {
    _token = token;
    isLogin = isLogin;
  }

  UserDataModel.fromJson(dynamic json) {
    _token = json['token'];
    isLogin = json['isLogin'];
  }

  UserDataModel copyWith({String? token}) => UserDataModel(token: token ?? _token);

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = _token;
    map['isLogin'] = isLogin;
    return map;
  }
}
