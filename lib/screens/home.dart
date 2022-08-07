
import 'package:flutter/material.dart';
import 'package:stacked/services/services.dart';

import '../models/user_model.dart';


class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text("Api Crud Operations"),),
      backgroundColor: Colors.black,
      body: FutureBuilder(
        future: getuser(),
        builder: (context ,AsyncSnapshot snapshot){
          if (snapshot.data == null) {
            return Center(child: CircularProgressIndicator(strokeWidth: 12,color: Colors.purple,),);
          }
          else{
            return ListView.builder(
              itemCount: snapshot.data.data.length,
              itemBuilder: (context ,index){
                return Container(
                  margin:EdgeInsets.only(top: 10),
                  child: ListTile(
                    tileColor: Color.fromARGB(255, 53, 8, 5),
                    textColor: Colors.yellow,
                    title: Text(snapshot.data.data[index].name),
                    subtitle: Text(snapshot.data.data[index].id.toString()),
                    // trailing: Text(snapshot.data.data[index].email),
                    trailing: Container(
                      width: 50,
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: (){
                              setState(() {
                                updateData(model: Data(name: "Moiz",email:"moiz@gmail.com",username :"peter"), id: snapshot.data.data[index].id);
                              });
                            },
                            child: Icon(Icons.update,color: Colors.amberAccent,),
                          ),
                          GestureDetector(
                            onTap: (){
                              setState(() {
                                deletData(id: snapshot.data.data[index].id);
                              });
                            },
                            child: Icon(Icons.delete,color: Colors.redAccent,),
                          ),

                          
                        ],
                      ),
                    )
                  ),
                );
              });
          }
        }),
        floatingActionButton: FloatingActionButton(onPressed: () {
          postData(Data(
              name :"prac krlo",
              email : "prac@gmail.com",
              username: "krlo bhai"
            ));
        } ,child: Text("Update"),),
    );
  }
}