import '../model/user_app.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Database {
  final String uid;
  Database(this.uid);

  final CollectionReference userCollection= FirebaseFirestore.instance.collection("Users");

  final FirebaseStorage _storage= FirebaseStorage.instance;

  Future<void> saveUser(String name, bool status, String numberPhone, String bio, String userUrlImg) async {
    return await userCollection.doc(uid).set({
      'name': name,
      'userUrlImg': userUrlImg
    });
  }

  AppUserData _userFromSnapshot(DocumentSnapshot snapshot){
    return AppUserData(
      uid: uid,
      name: snapshot.data().toString().contains('name') ? snapshot.get('name') : '',
        userUrlImg: snapshot.data().toString().contains('userUrlImg')? snapshot.get('userUrlImg'): ''
    );
  }

  Stream<AppUserData> get user {
    return userCollection.doc(uid).snapshots().map(_userFromSnapshot);
  }


  void updateCurrentUser(AppUserData appUserData, uid){
  userCollection.doc(uid).update({
    "name": appUserData.name,
  }).then((value) {
    print("Données utilisateur modifiées avec succès");
  }).catchError((onError){
    print(onError);
  });
}

  Future<String> uploadPictureProfile(file, AppUserData appUserData) async {
    Reference reference = _storage.ref().child('users/${appUserData.uid}.png');
    UploadTask uploadTask = reference.putFile(file);
    TaskSnapshot taskSnapshot = await uploadTask;
    return await taskSnapshot.ref.getDownloadURL();
  }

  Future<void> deletePicture(AppUserData appUserData) async {
    print(appUserData.userUrlImg);
    Reference reference = _storage.ref().child('users/${appUserData.uid}.png');
    reference.delete();

    userCollection.doc(appUserData.uid).update(
        {
          "userUrlImg": ""
        }
    ).then((value){
     /** print("photo utilisateur supprimée");**/
    }).catchError(
            (onError){
          /**print(onError);**/
        }
    );
  }

  void updatePictureUser(AppUserData appUserData, uid){
    userCollection.doc(uid).update(
        {
          "userUrlImg": appUserData.userUrlImg
        }
    ).then((value){
     /* print("photo utilisateur modifiée");*/
    }).catchError(
            (onError){
          /**print(onError);**/
        }
    );
  }
}