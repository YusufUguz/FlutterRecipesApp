class Recipe {
  int? tarifID;
  String? yemekIsim;
  String? malzemeler;
  String? adimlar;
  int? kacKisilik;
  int? yapilisSuresi;
  String? yapilisZorlugu;
  String? kategori;
  int? klasikMi;
  int? anaYemekMi;
  int? aperatifMi;
  int? icecekMi;
  String? mainImage;
  String? image1;
  String? image2;
  String? image3;
  int? favoriMi;

  Recipe(
      {this.tarifID,
      this.yemekIsim,
      this.malzemeler,
      this.adimlar,
      this.kacKisilik,
      this.yapilisSuresi,
      this.yapilisZorlugu,
      this.kategori,
      this.klasikMi,
      this.anaYemekMi,
      this.aperatifMi,
      this.icecekMi,
      this.mainImage,
      this.image1,
      this.image2,
      this.image3,
      this.favoriMi});

  Map<String, dynamic> toMap() {
    return {
      'tarifID': tarifID,
      'yemekIsim': yemekIsim,
      'malzemeler': malzemeler,
      'adimlar': adimlar,
      'kacKisilik': kacKisilik,
      'yapilisSuresi': yapilisSuresi,
      'yapilisZorlugu': yapilisZorlugu,
      'kategori': kategori,
      'klasikMi': klasikMi,
      'anaYemekMi': anaYemekMi,
      'aperatifMi': aperatifMi,
      'icecekMi': icecekMi,
      'mainImage': mainImage,
      'image1': image1,
      'image2': image2,
      'image3': image3,
      'favoriMi': favoriMi
    };
  }

  Recipe.fromMap(Map<String, dynamic> map) {
    tarifID = map['tarifID'];
    yemekIsim = map['yemekIsim'];
    malzemeler = map['malzemeler'];
    adimlar = map['adimlar'];
    kacKisilik = map['kacKisilik'];
    yapilisSuresi = map['yapilisSuresi'];
    yapilisZorlugu = map['yapilisZorlugu'];
    kategori = map['kategori'];
    klasikMi = map['klasikMi'];
    anaYemekMi = map['anaYemekMi'];
    aperatifMi = map['aperatifMi'];
    icecekMi = map['icecekMi'];
    mainImage = map['mainImage'];
    image1 = map['image1'];
    image2 = map['image2'];
    image3 = map['image3'];
    favoriMi = map['favoriMi'];
  }
}
