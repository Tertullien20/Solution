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
      if(e.code =='user-not-found')  {
        String msg= "Pas d'utilisateur trouvé pour cet email";
        return msg;
      }else if(e.code=="wrong-password") {
        String msg= "email ou mot de pass incorrect";
        return msg;
      } else {
        String msg= "Vérifiez votre connexion internet puis réessayer";
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