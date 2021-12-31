import 'package:flutter/material.dart';
import 'device1.dart' as device1;
import 'device2.dart' as device2;
import 'device3.dart' as device3;

void main() {
  runApp( const MaterialApp(
    home: Home()
  ));
}

class Devices {  
  Devices({required this.title, required this.icon, required this.on, required this.type });  
  final String title;  
  final IconData icon;  
  bool on ;
  // ignore: prefer_typing_uninitialized_variables
  var type;
} 

class Home extends StatefulWidget {
  static List<Devices> devices = <Devices>[   
  Devices(title: 'Lights', icon: Icons.light, on: true, type: 'toilet'),  
  Devices(title: 'Window', icon: Icons.window,  on: true, type: 'toilet'),  
  Devices(title: 'Camera', icon: Icons.camera,  on: true , type: 'Living room'),  
  Devices(title: 'TV', icon: Icons.tv,  on: true, type: 'Living room'),
];

  static List<Devices> gettoilet (){
    List<Devices> toilet= [];
    for (var element in devices) {
      if(element.type == "toilet")toilet.add(element);
    }
    return toilet;
  }

  static List<Devices> getLivingRoom (){
    List<Devices> livingRoom= [];
    for (var element in devices) {
      if(element.type == "Living room")livingRoom.add(element);
    }
    return livingRoom;
  }
    
    
  const Home({Key? key}) : super(key: key);  
  
  @override 
  _HomeState createState()=> _HomeState();
}
  
class _HomeState extends State<Home> with SingleTickerProviderStateMixin{
  static late TabController controller;

  @override 
  void initState(){
    controller = TabController(length: 3, vsync: this);
    super.initState();
  }
  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }




  @override 
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Home'),
        backgroundColor: Colors.grey,
        bottom: TabBar(
          controller: controller,
          indicatorWeight: 5.0,
          indicatorColor: Colors.black,
          tabs: const <Widget>[
            Tab(text: "All"),
            Tab(icon: Icon(Icons.wash), text: "toilet",),
            Tab(icon: Icon(Icons.chair),text: "Living room",),
          ],
        ),
      ),

      body: TabBarView(
        controller: controller,
        children: const <Widget> [
          device1.firsttab(),
          device2.secondtab(),
          device3.thirdtab(),

        ]
      )
    );
  }
}