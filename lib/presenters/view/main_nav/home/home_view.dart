import 'package:flutter/material.dart';
import 'package:my_health_app_two/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<String> services = [
    "Teste de Sange",
    "Teste de urina",
    "HFT",
    "LFT",
    "Neurologia",
    "Cardiologia",
  ];

    List<String> tests = [
    "Dengue",
    "HIV",
    "Typhoid",
    "Gravidez",
    "Xray",
    "Sangue",
  ];

    List<String> labs = [
    "lab1",
    "Lab2",
  ];

   List<String> packages_imagePaths = [
    'assets/images/influenza.jpg',
    'assets/images/irontest.jpg',
    'assets/images/fever.jpg',
    'assets/images/influenza.jpg',
    'assets/images/irontest.jpg',
    'assets/images/fever.jpg',
  ];

    List<String> tests_imagePaths = [
    'assets/images/doctor4.jpg',
    'assets/images/doctor2.jpg',
    'assets/images/doctor3.jpg',
    'assets/images/doctor4.jpg',
    'assets/images/doctor2.jpg',
    'assets/images/doctor3.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    final AuthProvider authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        shadowColor: Colors.grey,
        title: Text('Diagonistico',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w500,
            letterSpacing: 1,
        ),
        ),
      ),
      drawer: Drawer(
        child: Consumer<AuthProvider>(builder:(context, authProvider, child){
         return ListView(
           children: [
             DrawerHeader(child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(authProvider.userModel.profilePic),
                ),
                SizedBox(width: 16,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(authProvider.isSignedIn ? authProvider.userModel.name ?? "" : "Convidado"),
                    const SizedBox(height: 3,),
                    Text(authProvider.isSignedIn ? authProvider.userModel.phoneNumber ?? "" :"", 
                    style: TextStyle(
                      color: Colors.white,
                       fontSize: 11
                    ),
                    ),
                  ],
                )
                     ],), decoration: BoxDecoration(
              color: Colors.amber[600],
              shape: BoxShape.rectangle
             ),
             
             ),
             ListTile(
              onTap: (){
                Navigator.pop(context);
              },
              title: const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.home_outlined),
                  SizedBox(width: 8,),
                  Text("Home",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  )  
                ],
              ),
             ),
            const Divider(
              thickness: 1.4,
              indent: 35,
             ),
             ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.search_outlined),
                SizedBox(width: 8,),
                Text("Pesquisar",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                ),
                ),
              ],
              ),
              
             ),
           ],
         );
         
        },),
      ),
      body: Scaffold(),
    );
  }
}