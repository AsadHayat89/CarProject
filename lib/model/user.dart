class User{
  String? Name;
  String? Email;
  String? UserName; // verified=>green, pending=>yellow, rejected=>red,
  String? Password;

  User(
  {this.Name, this.Email, this.UserName, this.Password});

  User.fromModel(
  String Name, String Email, String UserName, String Password) {
  this.Name = Name;
  this.Email = Email;
  this.UserName = UserName;
  this.Password = Password;
  }

}