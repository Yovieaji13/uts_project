class Item {
  int _id;
  String _name;
  int _price;
  String _code;
  String _color;

  int get id => _id;
  String get name => this._name;
  set name(String value) => this._name = value;

  get price => this._price;
  set price(value) => this._price = value;

  String get code => this._code;
  set code(String value) => this._code = value;

  String get color => this._color;
  set color(String value) => this._color = value;
  

// konstruktor versi 1
  Item(this._name, this._price, this._code, this._color);

// konstruktor versi 2: konversi dari Map ke Item
  Item.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._name = map['name'];
    this._price = map['price'];
    this._code = map['code'];
    this._color = map['color'];
  }

  // konversi dari Item ke Map
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['id'] = this._id;
    map['name'] = name;
    map['price'] = price;
    map['code'] = code;
    map['color'] = color;
    return map;
  }
}
