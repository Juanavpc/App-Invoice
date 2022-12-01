class InvoiceDetails{
  List<ModelInvoiceDetails> items = [];                           // Lista del detalle de facturas que se obtiene de la api 

  InvoiceDetails();                                               // Constructor             

  InvoiceDetails.fromJsonList(List<dynamic> jsonList){            // Constructor con parámetro de tipo lista dinámica
    if(jsonList == null) return;                                  // Si no hay datos, no hace nada         
    for(var item in jsonList){                                    // Recorre la lista
      final details = ModelInvoiceDetails.fromJsonMap(item);      // Crea un objeto de tipo ModelInvoiceDetails con los datos de la lista
      items.add(details);                                         // Agrega el objeto a la lista             
    }
  }
}

class ModelInvoiceDetails{                                        // Clase que contiene los datos del detalle de la factura
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

  ModelInvoiceDetails.fromJsonMap(Map<String, dynamic> json){     // Constructor con parámetro de tipo mapa
    invoice_ID=json['invoice_ID'];
    Product_name=json['Product_name'];
    Product_ID=json['Product_ID'];
    Price=json['Price'];
    Quantity=json['Quantity'];
    Total=json['Total'];
  }
}