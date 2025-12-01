import 'package:flutter/material.dart';
import 'package:qubit_ov/shared/ui/logos/enterprise_logo.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.surfaceContainer,
      child: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 30),
            child: EnterpriseLogo(),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text(
              "Resumen de mi servicio",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            leading: Icon(Icons.document_scanner),
            title: Text(
              "Mis Facturas",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text(
              "Mis Notificaciones",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Divider(),
          ExpansionTile(
            leading: Icon(Icons.batch_prediction),
            title: Text(
              "Mis Trámites",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            children: [
              ListTile(
                leading: Icon(Icons.tab),
                title: Text(
                  "Resumen de mis trámites",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                leading: Icon(Icons.person_add),
                title: Text(
                  "Alta de suministro",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                leading: Icon(Icons.cached),
                title: Text(
                  "Reconexión de suministro",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                leading: Icon(Icons.person_remove),
                title: Text(
                  "Baja de suministro",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                leading: Icon(Icons.switch_account),
                title: Text(
                  "Cambio de titularidad",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                leading: Icon(Icons.edit_document),
                title: Text(
                  "Cambio de tarifa",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                leading: Icon(Icons.speed),
                title: Text(
                  "Modificación Potencia Contratada",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),

          ExpansionTile(
            leading: Icon(Icons.edit_document),
            title: Text(
              "Mis Reclamos",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            children: [
              ListTile(
                leading: Icon(Icons.power),
                title: Text(
                  "Reclamo Técnico",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                leading: Icon(Icons.article),
                title: Text(
                  "Reclamo de Facturación/Consumo",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                leading: Icon(Icons.bolt),
                title: Text(
                  "Reclamos de Artefactos Dañados",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          ExpansionTile(
            leading: Icon(Icons.attach_money),
            title: Text(
              "Mis pagos",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            children: [
              ListTile(
                leading: Icon(Icons.payments),
                title: Text(
                  "Informar un pago",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                leading: Icon(Icons.payment),
                title: Text(
                  "Débito automático",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                leading: Icon(Icons.account_balance_wallet),
                title: Text(
                  "Depósitos y transferencias",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.phishing),
            title: Text(
              "Denuncia de Ilícitos",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          ExpansionTile(
            leading: Icon(Icons.info),
            title: Text(
              "Información del servicio",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            children: [
              ListTile(
                leading: Icon(Icons.account_balance),
                title: Text(
                  "Información de Subsidios",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                leading: Icon(Icons.electrical_services),
                title: Text(
                  "Cortes Programados",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                leading: Icon(Icons.table_chart),
                title: Text(
                  "Cuadro Tarifario",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                leading: Icon(Icons.credit_score),
                title: Text(
                  "Como Pagar mi factura",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                leading: Icon(Icons.apartment),
                title: Text(
                  "Oficinas Comerciales",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                leading: Icon(Icons.checklist),
                title: Text(
                  "Reglamento de Suministro",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                leading: Icon(Icons.dangerous),
                title: Text(
                  "Peligro Eléctrico",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
