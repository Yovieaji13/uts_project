class Login {
  int _id;
  String _username;
  String _password;

  int get id => _id;
  get username => this._username;
  set username( value) => this._username = value;

  get password => this._password;
  set password( value) => this._password = value;

  // konstruktor versi 1
  Login(this._username, this._password);

// konstruktor versi 2: konversi dari Map ke Login
  Login.fromMap(Map<String, dynamic> map) {
    this._id = map['idLogin'];
    this._username = map['username'];
    this._password = map['password'];
  }

  // konversi dari Login ke Map
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['idLogin'] = this._id;
    map['username'] = this._username;
    map['password'] = this._password;
    return map;
  }
}

