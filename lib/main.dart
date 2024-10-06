import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<Map<String, dynamic>>  listItems = [
    {'title' : 'FLUTTER' , 'image' : 'assets/flutter.png'},
    {'title' : 'FIREBASE' , 'image' : 'assets/firebase.png'},
    {'title' : 'JAVA' , 'image' : 'assets/java.png'},    
    {'title' : 'KOTLIN' , 'image' : 'assets/kotlin.png'},
    {'title' : 'REACT' , 'image' : 'assets/react.png'},
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Listview & Gridview"),
      ),
    body :
    Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Text("Listview ",style : TextStyle(fontSize : 20)),
          Expanded(
            child: ListView.builder(
              itemCount: listItems.length,
              itemBuilder: (context, index) {
              return  Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(backgroundImage: AssetImage(listItems[index]['image'] ),radius: 20,),
                      SizedBox(width : 20),
                      Text(listItems[index]['title'] ), 
                    ],
                  ),
                  SizedBox(height : 10),
                ],
              ) ;
            }, ),
          ),
      
          Text("Gridview",style : TextStyle(fontSize : 20)),
          SizedBox(height : 30),
            Expanded(
              child: GridView.builder(
                itemCount: listItems.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount : 3,mainAxisSpacing: 10,crossAxisSpacing: 10),
                 itemBuilder: (context, index) {
                   return Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.all(Radius.circular(10),),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment : CrossAxisAlignment.center,
                    children: [
                      SizedBox(height : 6),
                      CircleAvatar(backgroundImage: AssetImage(listItems[index]['image'] ),radius: 20,),
                      SizedBox(height : 6),
                      Text(listItems[index]['title'] ), 
                    ],
                ),);  }),
            ) 
               
        ],
      ),
    )
    

    );
  }
}
