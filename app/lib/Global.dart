enum user {USERNAME, PASSWORD}
class Global{

  
  static bool isLogin = false;
  static String username = "";
  static String password = "";
  
  static void setLogin(bool value){
    isLogin = value;
  }
}