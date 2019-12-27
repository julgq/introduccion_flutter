import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page'),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.all(5.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://www.informador.mx/__export/1571093812644/sites/elinformador/img/2019/10/14/katy_perry_crop1571093456748.jpg_1970638775.jpg'),
            ),
          ),
          Container(
              margin: EdgeInsets.only(right: 10),
              child: CircleAvatar(
                  child: Text('SL'), backgroundColor: Colors.brown))
        ],
      ),
      body: Center(child: FadeInImage(
        image: NetworkImage('https://www.perfilan.com/images/logo-dark.png'),
        placeholder: AssetImage('assets/jar-loading.gif'),
        fadeInDuration: Duration(milliseconds: 200),
      )),
    );
  }
}
