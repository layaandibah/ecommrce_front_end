class AppLinks{


  static const String serverlink="http://192.168.50.214/ecommerce";

  //image
  static const String imagestatic="$serverlink/upload";
  static const String categories="$imagestatic/categories";
  static const String items="$imagestatic/items";


  //auth
  static const String signup="$serverlink/auth/signup.php";
  static const String login="$serverlink/auth/login.php";
  static const String verifycodeSignUp="$serverlink/auth/verifycode.php";
  static const String verifycode="$serverlink/forgetpassword/verifycode.php";
  static const String checkemail="$serverlink/forgetpassword/checkemail.php";
  static const String resetpassword="$serverlink/forgetpassword/resetpassword.php";
//home
  static const String homepage="$serverlink/home.php";






}