import 'db.dart';
import '../model/user_app.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  final FirebaseAuth _auth= FirebaseAuth.instance;
  UserApp? _userFromFirebaseUser(User? user){
    return user !=null? UserApp(user.uid):null;
  }

  Stream<UserApp?> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result =
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return _userFromFirebaseUser(user);
    }   on FirebaseAuthException catch(e) {
      print(e.code);
      if(e.code =='user-not-found')  {
        String msg= "No user found for this email";
        return msg;
      }else if(e.code=="wrong-password") {
        String msg= "Email or password incorrect.";
        return msg;
      }  else if(e.code == 'invalid-credential'){
        String msg= "Your credentials are incorrect.";
        return msg;
      } else if(e.code == 'operation-not-allowed'){
        String msg= "Login operation has been disabled for now.";
        return msg;
      }else if(e.code == 'user-disabled'){
        String msg= "This account has been deactivated.";
        return msg;
      } else if(e.code == 'invalid-email'){
        String msg= "Invalid email address.";
        return msg;
      } else if (e.code == "too-many-requests"){
        String msg= "We have blocked all requests from this device due to unusual activity. Please try again later.";
        return msg;
      }
      else {
        String msg= "Check your internet connection and try again.";
        return msg;
      }
    }
  }

  Future registerWithEmailAndPassword(String nickName, String email, String password) async {
    try {
      UserCredential result =
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      await Database(user!.uid).saveUser(nickName, "");

      return _userFromFirebaseUser(user);
    }on FirebaseAuthException catch(e) {
      if(e.code == 'week-password') {
        String msg="Le mot de passe est trop simple";
        return msg;
      }else if( e.code == 'email-already-in-use') {
        String msg= "Ce mail est déjà relié à un compte existant";
        return msg;
      }else if (e.code == "too-many-requests"){
        String msg= "Nous avons bloqué toutes les demandes en provenance de cet appareil en raison d'une activité inhabituelle. Veuillez réessayer plus tard.";
        return msg;
      }
    }
  }

  Future signOut() async {
    try{
      return await _auth.signOut();
    }catch(exception){
      return null;
    }
  }

}