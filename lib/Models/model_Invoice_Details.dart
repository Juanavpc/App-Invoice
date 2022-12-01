class InvoiceDetails{
  List<ModelInvoiceDetails> items = [];

  InvoiceDetails();

  InvoiceDetails.fromJsonList(List<dynamic> jsonList){
    if(jsonList == null) return;
    for(var item in jsonList){
      final details = ModelInvoiceDetails.fromJsonMap(item);
      items.add(details);
    }
  }
}

class ModelInvoiceDetails{
  late int invoice_ID;
  late String Product_name;
  late int Product_ID;
  late int Price;
  late int Quantity;
  late int Total;

  ModelInvoiceDetails(
      this.invoice_ID,
      this.Product_name,
      this.Product_ID,
      this.Price,
      this.Quantity,
      this.Total
      );

  ModelInvoiceDetails.fromJsonMap(Map<String, dynamic> json){
    invoice_ID=json['invoice_ID'];
    Product_name=json['Product_name'];
    Product_ID=json['Product_ID'];
    Price=json['Price'];
    Quantity=json['Quantity'];
    Total=json['Total'];



  }

}