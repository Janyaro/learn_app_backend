class ProductModel {
  final String ptitle;
  final String pdescription;
  final String imgUrl;
  ProductModel({required this.ptitle,required this.pdescription , required this.imgUrl});
  
  factory ProductModel.fromjson(Map<String , dynamic> json){
    return ProductModel(
      ptitle: json['ptitle'],
      pdescription:json['pdescription'],
      imgUrl: json['imgUrl']);
  }
}