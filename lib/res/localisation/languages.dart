import 'package:get/get_navigation/src/root/internacionalization.dart';

class Languages extends Translations{
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
    "en_US":{
      "welcome_back":"Welcome Back",
      "email_hint":"Enter Email",
      "password_hint":"Enter Password",
      "login":"Login",
      "dont_have_account_signup":"Don't have account? SignUp now",
      "internet_exception":"No Internet found.\n Please check your internet connection",
      "retry_button":"Retry",
      "general_exception":"We are unable to process your request\nPlease try again after some time",
    },
    "te_IN":{
      "email_hint":"ఇమెయిల్ నమోదు చేయండి",
      "password_hint":"రహస్య సంకేతం తెలపండి",
    }
  };

}