class Fav {
  int id;
   String title;
  String carb;
   String dec;
   String imgUrl;
   String ingr;
   String kcal;
   String method;
   String protein;
  Fav(this.id, this.title,
       this.carb,
       this.dec,
       this.imgUrl,
       this.ingr,
       this.kcal,
       this.method,
       this.protein);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'title' :title,
      'carb' :carb,
      'dec' :dec,
      'imgUrl':imgUrl,
      'ingr' :ingr,
      'kcal':kcal,
      'method':method,
      'protein':protein
    };
    return map;
  }

  Fav.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    title=map['title'];
       carb=map['carb'];
       dec=map['dec'];
       imgUrl=map['imgUrl'];
       ingr=map['ingr'];
       kcal=map['kcal'];
       method=map['method'];
       protein=map['protein'];
  }
}
