class Product{
  List<ModelProduct> items = [];                          // Lista de productos que se obtiene de la api

  Product();                                              // Constructor

  Product.fromJsonList(List<dynamic> jsonList){           // Constructor con parámetro de tipo lista dinámica
    if(jsonList == null) return;                          // Si no hay datos, no hace nada
    for(var item in jsonList){                            // Recorre la lista   
      final product = ModelProduct.fromJsonMap(item);     // Crea un objeto de tipo ModelProduct con los datos de la lista
      items.add(product);                                 // Agrega el objeto a la lista
    }
  }
}

class ModelProduct{                                       // Clase que contiene los datos de un producto
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

  ModelProduct.fromJsonMap(Map<String, dynamic> json){    // Constructor con parámetro de tipo mapa
    Product_ID=json['Product_ID'];
    Product_name=json['Product_name'];
    Product_descr=json['Product_descr'];
    Price=json['Price'];
    category=json['category'];
    image=json['image'];
  }
}