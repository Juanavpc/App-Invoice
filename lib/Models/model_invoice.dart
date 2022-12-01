class Invoice{
  List<ModelInvoice> items = [];

  Invoice();

  Invoice.fromJsonList(List<dynamic> jsonList){
    if(jsonList == null) return;
    for(var item in jsonList){
      final invoice = ModelInvoice.fromJsonMap(item);
      items.add(invoice);
    }
  }
}

class ModelInvoice{
  late int Invoice_ID;
  late int Client_ID;
  late String date_;
  late int discount;
  late int subtotal;
  late int total;

  ModelInvoice(
      this.Invoice_ID,
      this.Client_ID,
      this.date_,
      this.discount,
      this.subtotal,
      this.total
      );

  ModelInvoice.fromJsonMap(Map<String, dynamic> json){
    Invoice_ID=json['Invoice_ID'];
    Client_ID=json['Client_ID'];
    date_=json['date_'];
    discount=json['discount'];
    subtotal=json['subtotal'];
    total=json['total'];

  }

}