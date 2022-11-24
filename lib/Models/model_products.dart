class Product{
  List<ModelProduct> items = [];

  Product();

  Product.fromJsonList(List<dynamic> jsonList){
    if(jsonList == null) return;
    for(var item in jsonList){
      final product = ModelProduct.fromJsonMap(item);
      items.add(product);
    }
  }
}

class ModelProduct{
  late int Product_ID;
  late String Product_name;
  late String Product_descr;
  late int Price;
  late String category;
  late String image;

  ModelProduct(
    this.Product_ID,
    this.Product_name,
    this.Product_descr,
    this.Price,
    this.category,
    this.image
  );

  ModelProduct.fromJsonMap(Map<String, dynamic> json){
    Product_ID=json['Product_ID'];
    Product_name=json['Product_name'];
    Product_descr=json['Product_descr'];
    Price=json['Price'];
    category=json['category'];
    image=json['image'];
  }
}