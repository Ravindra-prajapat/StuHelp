import "package:application1/src/features/authentication/screens/login/login_screen.dart";
import "package:application1/src/features/authentication/screens/welcome/welcome_screen.dart";
import "package:application1/src/features/authentication/services/session_mamager.dart";
import "package:application1/src/features/core/screens/dashboard/dashboard.dart";
import "package:application1/src/units/utils.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:firebase_database/firebase_database.dart";
import "package:get/get.dart";

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();
  //Auth  variables
  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;
  //
  DatabaseReference ref = FirebaseDatabase.instance.ref().child('User');

  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    if(user == null){
      Get.offAll(() => const WelcomeScreen());
    }
    else{
      SessionController().userId = user.uid.toString();
      Get.offAll(() => const Dashboard());
    }
  }

  void signup(
      String fullName, String email, String phoneNo, String password) async {
    try {
      _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        SessionController().userId = value.user!.uid.toString();
        print(
            " user id inside repositry is :::  ${SessionController().userId.toString()}");
        ref.child(value.user!.uid.toString()).set({
          'uid': value.user!.uid.toString(),
          'email': value.user!.email.toString(),
          'onlineStatus': 'noOne',
          'phone': phoneNo,
          'userName': fullName,
          'profile': '',
        }).then((value) {
          firebaseUser.value != null
              ? Get.offAll(() => const Dashboard())
              : Get.to(() => const WelcomeScreen());
        }).onError((error, stackTrace) {
          print(error.toString());
          Utils.toastMessage(error.toString());
        });
      }).onError((error, stackTrace) {
        print(error.toString());
        Utils.toastMessage(error.toString());
      });
    } catch (e) {
      print(e.toString());
      Utils.toastMessage(e.toString());
    }
  }

  void loginWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password).then((value){
      SessionController().userId = value.user!.uid.toString();
      Get.offAll(() => const Dashboard());
      });
      // now added
    } catch (_) {}
  }

  Future<void> logout() async => await _auth.signOut();

  void phoneAuthentication(String phoneNo) {}

  void resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      Get.offAll(() => const LoginScreen());
    } catch (_) {}
  }

  // reset password
}
