import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Anasayfa(),
  ));
}

class Anasayfa extends StatefulWidget {
  @override
  _AnasayfaState createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  int sayi;
  String girilensayi;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Girilen Sayı Asal mı ?"),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        setState(() {
        sayi=int.parse( girilensayi); 
        });
      }),
      body: Column(
        children: <Widget>[
         Container(
           margin: EdgeInsets.all(10),
           color:Colors.orange,
           child: TextField(
             
            autocorrect: true,
            decoration: InputDecoration(
              
              helperText: "Asal olduğunu kontrol etmek istediğiniz sayı",
              icon: Icon(Icons.input),
            labelText: "Sayı",
            hintText: "Tam sayi",
            
            ),
            maxLines: 1,
            keyboardType: TextInputType.number,
            onChanged: (data) => girilensayi = data,
          ),
         ),
          Container(
            width: MediaQuery.of(context).size.width,
            
            decoration: BoxDecoration(

             gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.topRight,
              colors: [Colors.blueGrey, Colors.red]
            ),),
            child:Column(
            children: <Widget>[
              Text("Girilen Sayi : $sayi"),
              asal_kontrol_text(sayi),
            ],
          ),),
        ],
      ),
    );
  }
}
//Geriye text widget döndüren bir fonksiyon oluşturuyorum 
Text asal_kontrol_text(int sayi){
  int a = 0;
  for(int i = 2;i<sayi;i++){
    if(sayi % i ==0){
      a++;
      return Text("Asal değil");
    }
  }
  if(a == 0){
    return Text("Sayı Asal");
  }
}
