import 'package:app_invoice/Models/model_invoice.dart';
import 'package:app_invoice/Providers/invoice_provider.dart';
import 'package:app_invoice/Widgets/Cart_Items.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Widgets/invoices_items.dart';


class InvoicePage extends StatefulWidget {
  int id;
  InvoicePage(this.id);

  @override
  State<InvoicePage> createState() => _InvoicePage(id);
}

class _InvoicePage extends State<InvoicePage>{
  int id;
  _InvoicePage(this.id);

  final getProvider1 = InvoiceProvider();           // Instancia de la clase InvoiceProvider

  @override
  void initState() {                                // Método que se ejecuta al iniciar el widget
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    getProvider1.getInvoicesClient(id);             // Método que obtiene las facturas del cliente
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          size: 22,
                        ),
                      ),
                      Text(
                        "Orders",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);               
                        },
                        child: Icon(
                          Icons.more_horiz,
                          size: 30,
                        ),
                      )
                    ]),
              ),
              ContentStreamInvoices(getProvider1,context)         // Widget que muestra las facturas del cliente
            ],
          ),
        ),
      ),
    );
  }
}
