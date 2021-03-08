class Coupon {
  int _id;
  String _type;
  String _description;
  double _prix;
  double _prix_pourcentage_reduction;
  String _codePromo;
  String _ville;
  String _stringDateRef;


  Coupon(
      this._id,
      this._type,
      this._description,
      this._prix,
      this._prix_pourcentage_reduction,
      this._codePromo,
      this._ville,
      this._stringDateRef);

  String get stringDateRef => _stringDateRef;

  String get description => _description;

  set description(String value) {
    _description = value;
  }

  set stringDateRef(String value) {
    _stringDateRef = value;
  }

  String get ville => _ville;

  set ville(String value) {
    _ville = value;
  }

  String get codePromo => _codePromo;

  set codePromo(String value) {
    _codePromo = value;
  }

  double get prix_pourcentage_reduction => _prix_pourcentage_reduction;

  set prix_pourcentage_reduction(double value) {
    _prix_pourcentage_reduction = value;
  }

  double get prix => _prix;

  set prix(double value) {
    _prix = value;
  }

  String get type => _type;

  set type(String value) {
    _type = value;
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }

  @override
  String toString() {
    return 'Coupon{_id: $_id, _type: $_type, _prix: $_prix, _prix_pourcentage_reduction: $_prix_pourcentage_reduction, _codePromo: $_codePromo, _ville: $_ville, _stringDateRef: $_stringDateRef}';
  }
}