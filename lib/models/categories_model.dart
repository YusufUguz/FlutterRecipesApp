// ignore_for_file: file_names

class Categories {

  int? kategoriID;
  String? kategoriAd;
  String? kategoriImage;

  Categories({
    this.kategoriID,
    this.kategoriAd,
    this.kategoriImage,
  });

  Map<String, dynamic> toMap() {
    return {
      'KategoriID': kategoriID,
      'KategoriAd': kategoriAd,  
      'KategoriImage': kategoriImage,
    };
  }

  Categories.fromMap(Map<String, dynamic> map) {
    kategoriID = map['KategoriID'];
    kategoriAd = map['KategoriAd'];
    kategoriImage = map['KategoriImage'];
  }

  
}
