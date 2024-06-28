import 'package:flutter/material.dart';
import 'package:my_health_app_two/presenters/view/search/search_view.dart';
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
        title: const Text('Diagonistico',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w500,
            letterSpacing: 1,
            color: Colors.white
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
              onTap: (){
                 Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SearchView()),
                          );
              },
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
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage("assets/images/doctor1.jpg"),
                  ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    RichText(text: TextSpan(
                      style: DefaultTextStyle.of(context).style,
                      children: const [
                          TextSpan(
                                text: 'Ola',
                                style: TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                
                           TextSpan(
                                text: 'Bem-Vindo!',
                                style: TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black38,
                                ),
                              ),
                      ]
                    )),
                    IconButton(
                    icon: Icon(Icons.add_alert_outlined),
                    onPressed: () {
                    },
                  ),
                  ],
                ),
              ],
            ),
            
            ),

          const  SizedBox(height: 10,),

            Padding(padding: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 1.0),
                            blurRadius: 6.0,
                          ),
                        ],
                  ),
                  child: const Row(
                    children: [
                      Padding(padding: EdgeInsets.all(8),
                      child: Icon(
                        Icons.search_outlined,
                        color: Colors.black,
                      ),
                      ),
                      Expanded(child: TextField(
                        decoration: InputDecoration(
                          hintText: "Procure por Serviços",
                          border: InputBorder.none
                        ),
                      ))
                    ],
                  ),
                ),),

                SizedBox(
                  width: 10,
                ),
                IconButton(onPressed: (){}, icon: Icon(Icons.filter_list_outlined))
              ],
            ),
            ),
            
            SizedBox(height: 10,),

             Padding(padding: EdgeInsets.symmetric(horizontal: 15),
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   const Text("Serviços",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500
                    ),
                    ),
                    
                    TextButton(onPressed: (){}, child: 
                   const  Row(
                              children:  [
                                Text(
                                  "Ver todos",
                                  style: TextStyle(fontSize: 12),
                                ),
                                SizedBox(width: 4,),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 12,
                                ),
                              ],
                            ),
                                 
                    
                    style: ButtonStyle(
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              backgroundColor: MaterialStateProperty.all(const Color(0xFF3E69FE)),
                              foregroundColor: MaterialStateProperty.all(Colors.white),
                              elevation: MaterialStateProperty.all(5),
                            ),),
                 ],
               )
            ],),
            )
          ],
        ),
      ),
    );
  }
}