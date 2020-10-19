class LoginResponse {
  String _error;
  String _action;
  String _msg;
  String _userID;
  String _email;
  String _firstName;
  String _lastName;
  String _phone;
  String _designation;
  dynamic _tokenId;

  String get error => _error;
  String get action => _action;
  String get msg => _msg;
  String get userID => _userID;
  String get email => _email;
  String get firstName => _firstName;
  String get lastName => _lastName;
  String get phone => _phone;
  String get designation => _designation;
  dynamic get tokenId => _tokenId;

  LoginResponse({
      String error, 
      String action, 
      String msg, 
      String userID, 
      String email, 
      String firstName, 
      String lastName, 
      String phone, 
      String designation, 
      dynamic tokenId}){
    _error = error;
    _action = action;
    _msg = msg;
    _userID = userID;
    _email = email;
    _firstName = firstName;
    _lastName = lastName;
    _phone = phone;
    _designation = designation;
    _tokenId = tokenId;
}

  LoginResponse.fromJson(dynamic json) {
    _error = json["error"];
    _action = json["action"];
    _msg = json["msg"];
    _userID = json["userID"];
    _email = json["Email"];
    _firstName = json["FirstName"];
    _lastName = json["LastName"];
    _phone = json["Phone"];
    _designation = json["Designation"];
    _tokenId = json["tokenId"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["error"] = _error;
    map["action"] = _action;
    map["msg"] = _msg;
    map["userID"] = _userID;
    map["Email"] = _email;
    map["FirstName"] = _firstName;
    map["LastName"] = _lastName;
    map["Phone"] = _phone;
    map["Designation"] = _designation;
    map["tokenId"] = _tokenId;
    return map;
  }

}