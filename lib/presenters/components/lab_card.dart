
import 'package:flutter/material.dart';
import 'package:my_health_app_two/model/lab_model.dart';
import 'package:my_health_app_two/presenters/view/lab/lab_details/lab_details_view.dart';
import 'package:my_health_app_two/providers/auth_provider.dart';

class LabCard extends StatelessWidget{
  final LabModel lab;

  const LabCard({super.key, required this.lab});
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      elevation: 3,
      margin: EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ), child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircularAvatar(
              backgroundColor: Color(0xFF3E69FE),
              radius: 30,
              child: Text(
                lab.name.substring(0,1).toUpperCase(),
                style: TextStyle(
                    color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                )
              )
            ),
            SizedBox(width: 12,),
            Expanded(child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(lab.name),
                SizedBox(height: 8,),
                Text("Endereço: ${lab.address}"),
                Text("Tempo: ${lab.timings}"),
              ],)),
              SizedBox(width: 8,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.yellow,),
                      Text("4.5"),
                    ],
                  ),
                  SizedBox(height: 16,),
                  ElevatedButton(onPressed: (){
                   Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LabDetailsView(lab: lab,authProvider: AuthProvider(),)),
                    ); 
                  }, child: const Text("Encomendar Agora"))
              ],)
          ],),
      ),   );
  }

  
}