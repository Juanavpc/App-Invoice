class Invoice{
  List<ModelInvoice> items = [];                            // Lista de facturas que se obtiene de la api         

  Invoice();                                                // Constructor            

  Invoice.fromJsonList(List<dynamic> jsonList){             // Constructor con parámetro de tipo lista dinámica
    if(jsonList == null) return;                            // Si no hay datos, no hace nada
    for(var item in jsonList){                              // Recorre la lista
      final invoice = ModelInvoice.fromJsonMap(item);       // Crea un objeto de tipo ModelInvoice con los datos de la lista
      items.add(invoice);                                   // Agrega el objeto a la lista
    }
  }
}

class ModelInvoice{                                        // Clase que contiene los datos de una factura       
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

  ModelInvoice.fromJsonMap(Map<String, dynamic> json){      // Constructor con parámetro de tipo mapa
    Invoice_ID=json['Invoice_ID'];
    Client_ID=json['Client_ID'];
    date_=json['date_'];
    discount=json['discount'];
    subtotal=json['subtotal'];
    total=json['total'];
  }
}