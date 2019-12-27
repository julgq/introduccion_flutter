import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _nombre = '';
  String _email = '';
  String _password = '';
  String _fecha = '';
  String _opcionSeleccionada = 'Volar';

  List<String> _poderes = [
    'Volar',
    'Rayos X',
    'Super Aliento',
    'Super Poderes'
  ];

  TextEditingController _inputFieldDateController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Inputs de texto')),
      body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
          children: <Widget>[
            _crearEmail(),
            Divider(),
            _crearPassword(),
            Divider(),
            _crearInput(),
            Divider(),
            _crearFecha(context),
            Divider(),
            _crearDropdown(),
            Divider(),
            _crearPersona(),
          ]),
    );
  }

  _crearInput() {
    return TextField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
        counter: Text('Letras ${_nombre.length}'),
        hintText: 'Nombre de la persona',
        labelText: 'Nombre',
        helperText: 'Sólo es el nombre',
        suffixIcon: Icon(Icons.accessibility),
        icon: Icon(Icons.account_circle),
      ),
      onChanged: (valor) {
        setState(() {
          _nombre = valor;
          print(_nombre);
        });
      },
    );
  }

  List<DropdownMenuItem<String>> getOptionesDropdown() {
    List<DropdownMenuItem<String>> lista = new List();

    _poderes.forEach((poder) {
      lista.add(DropdownMenuItem(child: Text(poder), value: poder));
    });

    return lista;
  }

  _crearDropdown() {
    return Row(children: <Widget>[
      Icon(Icons.select_all),
      SizedBox(width: 30.0),
      DropdownButton(
        value: _opcionSeleccionada,
        items: getOptionesDropdown(),
        onChanged: (opt) {
          setState(() {
            _opcionSeleccionada = opt;
          });
        },
      )
    ]);
  }

  _crearPersona() {
    return ListTile(
      title: Text('Nombre es: $_nombre'),
      subtitle: Text('Email: $_email'),
      trailing: Text(_opcionSeleccionada),
    );
  }

  _crearEmail() {
    return TextField(
      textCapitalization: TextCapitalization.sentences,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
        hintText: 'Email',
        labelText: 'Email',
        suffixIcon: Icon(Icons.alternate_email),
        icon: Icon(Icons.email),
      ),
      onChanged: (valor) {
        setState(() {
          _email = valor;
          print(_email);
        });
      },
    );
  }

  _crearPassword() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
        hintText: 'Password',
        labelText: 'Password',
        suffixIcon: Icon(Icons.lock_open),
        icon: Icon(Icons.lock),
      ),
      onChanged: (valor) {
        setState(() {
          _password = valor;
          print(_password);
        });
      },
    );
  }

  _crearFecha(BuildContext context) {
    return TextField(
      controller: _inputFieldDateController,
      enableInteractiveSelection: false,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
        hintText: 'Fecha de nacimiento',
        labelText: 'Fecha de nacimiento',
        suffixIcon: Icon(Icons.perm_contact_calendar),
        icon: Icon(Icons.calendar_today),
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    );
  }

  _selectDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(2018),
      lastDate: new DateTime(2025),
      locale: Locale('es'),
    );

    if (picked != null) {
      setState(() {
        _fecha = picked.toString();
        _inputFieldDateController.text = _fecha;
      });
    }
  }
}
