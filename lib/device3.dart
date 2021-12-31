import 'package:flutter/material.dart';
import 'main.dart';


// ignore: camel_case_types
class thirdtab extends StatefulWidget {
  const thirdtab({Key? key}) : super(key: key);


  @override 
  _GridthreeState createState()=> _GridthreeState();
}

class _GridthreeState extends State<thirdtab> with SingleTickerProviderStateMixin{
  List<Devices> devices= Home.getLivingRoom();
  @override 
  Widget build(BuildContext context){
    return Scaffold(
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(
          devices.length ,
          (index){
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            elevation: 10.0,
            margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children:  <Widget>[
                  ListTile(
                    contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
                    leading: Icon(devices[index].icon, size: 60, color:devices[index].on?Colors.purple : null),
                    trailing: IconButton(onPressed: () {setState(() {
                          devices[index].on = !devices[index].on;
                });}, icon: const Icon(Icons.power_settings_new_rounded)),
                  ),
                  ListTile(
                    contentPadding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
                    title: Text(devices[index].title, style: const TextStyle(color: Colors.black)),
                    subtitle: Text(devices[index].on ? 'On' : 'Off', style: const TextStyle(color: Colors.black)),
                  )
                ]
              )
          );
        }),
      )
    );
  }
}
