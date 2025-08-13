import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista Horizontal',
      home: ListaHorizontal(),
    );
  }
}

class ListaHorizontal extends StatefulWidget {
  @override
  _ListaHorizontalState createState() => _ListaHorizontalState();
}

class _ListaHorizontalState extends State<ListaHorizontal> {
  List<Map<String, dynamic>> pessoas = [
    {'nome': '', 'data': null, 'sexo': null},
    {'nome': '', 'data': null, 'sexo': null},
    {'nome': '', 'data': null, 'sexo': null},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista Horizontal'),
      ),
      body: Container(
        height: 400,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: pessoas.length,
          itemBuilder: (context, index) {
            return Container(
              width: 300,
              margin: EdgeInsets.all(10),
              child: Card(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Text('Formulário ${index + 1}'),
                      SizedBox(height: 20),
                      
                      // Nome Completo
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Nome Completo',
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (value) {
                          pessoas[index]['nome'] = value;
                        },
                      ),
                      SizedBox(height: 15),
                      
                      // Data de Nascimento
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Data de Nascimento',
                          border: OutlineInputBorder(),
                          suffixIcon: Icon(Icons.calendar_today),
                        ),
                        readOnly: true,
                        onTap: () async {
                          DateTime? data = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime.now(),
                          );
                          if (data != null) {
                            setState(() {
                              pessoas[index]['data'] = data;
                            });
                          }
                        },
                        controller: TextEditingController(
                          text: pessoas[index]['data'] != null
                              ? '${pessoas[index]['data'].day}/${pessoas[index]['data'].month}/${pessoas[index]['data'].year}'
                              : '',
                        ),
                      ),
                      SizedBox(height: 15),
                      
                      // Sexo
                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          labelText: 'Sexo',
                          border: OutlineInputBorder(),
                        ),
                        value: pessoas[index]['sexo'],
                        items: [
                          DropdownMenuItem(
                            value: 'Homem',
                            child: Text('Homem'),
                          ),
                          DropdownMenuItem(
                            value: 'Mulher',
                            child: Text('Mulher'),
                          ),
                        ],
                        onChanged: (value) {
                          setState(() {
                            pessoas[index]['sexo'] = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
