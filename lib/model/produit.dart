class Produit{

    int _id;
    String _type;
    String _description;
    int _prix;
    int _code_barre;

    Produit(this._id, this._type, this._description, this._prix, this._code_barre);

    int get code_barre => _code_barre;

    int get prix => _prix;

    String get description => _description;

    String get type => _type;

    int get id => _id;

    set code_barre(int value) {
      _code_barre = value;
    }

    set prix(int value) {
      _prix = value;
    }

    set description(String value) {
      _description = value;
    }

    set type(String value) {
      _type = value;
    }
}