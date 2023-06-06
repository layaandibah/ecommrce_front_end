class AppLinks{


  static const String serverlink="http://192.168.34.214/ecommerce";

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
//items
  static const String itemspage="$serverlink/items/view.php";
 //cart
  static const String cartview="$serverlink/cart/view.php";
  static const String cartadd="$serverlink/cart/add.php";
  static const String cartdelete="$serverlink/cart/delete.php";
  //search
  static const String search="$serverlink/search.php";






}