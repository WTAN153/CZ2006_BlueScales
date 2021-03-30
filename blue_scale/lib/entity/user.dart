class User {

  final String uid;

  User({ this.uid });

}
// a model of how the database is store in the fire store that link with the account(all)
class Userdatabase{
  final String email;

  Userdatabase({this.email});   // can add bookmark here
}

class Userprofiledata{
  final String uid;
  final String email;
  final String name;
  final String phone;
  String avatarUrl;
  Userprofiledata({this.uid,this.email,this.name,this.phone,this.avatarUrl});
}