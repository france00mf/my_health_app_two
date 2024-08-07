import 'package:flutter/material.dart';
import 'package:my_health_app_two/model/lab_model.dart';
import 'package:my_health_app_two/model/test_model.dart';
import 'package:my_health_app_two/presenters/components/lab_card.dart';
import 'package:my_health_app_two/presenters/view/lab/all_bals/all_labs_view.dart';
import 'package:my_health_app_two/presenters/view/main_nav/all_book/all_bookin_view.dart';
import 'package:my_health_app_two/presenters/view/search/search_view.dart';
import 'package:my_health_app_two/presenters/view/tests/tests_view.dart';
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
    List<String> packages = [
    "influenza Respiratória",
    "Deficiência do ferro",
    "fever",
    "Gravidez",
    "Infertilidade Masculina",
    "Infertilidade Feminina",
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
               ),
              //  FutureBuilder<List<TestModel>>(
              //   future: authProvider.fetchTests(),
              //   builder: ((context, snapshot) {
              //     if(snapshot.connectionState == ConnectionState.waiting){
              //       return Center(child: CircularProgressIndicator());
              //     }else if(snapshot.hasError){
              //       return Center(child: Text("Erro : ${snapshot.error}"));
              //     }else if(!snapshot.hasData || snapshot.data!.isEmpty){
              //       return Center(child: Text("Sem testes disponíveis"),);
              //     }else {
              //       List<TestModel> testsModel = snapshot.data!;
              //       return GridView.builder(
              //         shrinkWrap: true,
              //             controller: ScrollController(
              //               keepScrollOffset: false,
              //             ),
              //             padding: EdgeInsets.only(top: 10.0),
              //             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //               crossAxisCount: 3,
              //               mainAxisSpacing: 10.0, 
              //               crossAxisSpacing: 10.0, 
              //             ),
              //             itemCount: tests.length,
              //             itemBuilder: (context,index)=> GestureDetector(
              //               onTap: (){
              //                 print("${testsModel[index].name} -> Teste selecionado");
              //                 Navigator.push(
              //                     context,
              //                     MaterialPageRoute(builder: (context) => TestsViewDetails(test: testsModel[index])
              //                   )); 
              //               },
              //               child: Container(
              //                   decoration: BoxDecoration(
              //                     color: Color(0xFF3E69FE),
              //                     borderRadius: BorderRadius.circular(10),
              //                   ),
              //                   child: Column(
              //                     mainAxisAlignment: MainAxisAlignment.center,
              //                     crossAxisAlignment: CrossAxisAlignment.center,
              //                     children: [
              //                       Icon(
              //                         Icons.health_and_safety_rounded,
              //                         size: 50,
              //                         color: Colors.white,
              //                       ),
              //                       // Add your image here
              //                       Container(
              //                         padding: EdgeInsets.all(2.0),
              //                         child: Text(
              //                           testsModel[index].name,
              //                           style: TextStyle(
              //                             fontSize: 16,
              //                             fontWeight: FontWeight.w500,
              //                             color: Colors.white,
              //                           ),
              //                           textAlign: TextAlign.center,
              //                         ),
              //                       ),
              //                     ],
              //                   ),
              //                 ),
              //             ),


              //       );
              //     }
              //   })
              //  ),
               



                          SizedBox(height: 10),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Top Laboratórios",
                                     style: TextStyle(
                              fontSize: 25,
                            fontWeight: FontWeight.w500,
                          ),
                                    )
                                  ]
                                )
                              ],
                            )
                          ),
                          TextButton(
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => AllLabView()),);
                            },
                            style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    20), // Set a circular border radius
                              ),
                            ),
                            backgroundColor:
                                MaterialStateProperty.all(Color(0xFF3E69FE)),
                            foregroundColor:
                                MaterialStateProperty.all(Colors.white),
                            elevation: MaterialStateProperty.all(5)),
                            child: Row(children: [
                              Text("Ver todos,",
                              style: TextStyle(fontSize: 12),
                              ),
                              Icon(Icons.arrow_forward_ios,
                              size: 12)
                            ],),
                          ),

                          FutureBuilder<List<LabModel>>(future: authProvider.fetchLabs(), builder: (context,snapshot){
                            if(snapshot.connectionState == ConnectionState.waiting){
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }else if(snapshot.hasError){
                              return Center(child: Text("Error: ${snapshot.error}"),);
                            }else if(!snapshot.hasData || snapshot.data!.isEmpty){
                                return Center(child: Text("Sem Laboratórios Top Disponível"),);
                            } else{
                              List<LabModel> topLabs = snapshot.data!;

                              return Column(children: [
                                LabCard(lab: topLabs[0]),
                                SizedBox(height: 5,),
                                LabCard(lab: topLabs[0]),
                              ],);
                            }
                          })
            ],),
            ),
            SizedBox(height: 10),
            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 15),
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Row(
            //        mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: [
            //           Text("Pacotes de estilo de vida",
            //           style: TextStyle(
            //             fontSize: 25,
            //             fontWeight: FontWeight.w500
            //           )
            //           ),
            //           TextButton(
            //               style: ButtonStyle(
            //                 shape: MaterialStateProperty.all<
            //                     RoundedRectangleBorder>(
            //                   RoundedRectangleBorder(
            //                     borderRadius: BorderRadius.circular(
            //                         20),
            //                   ),
            //                 ),
            //                 foregroundColor:
            //                     MaterialStateProperty.all(Colors.black)),
            //             onPressed: (){}, child: const Row(children: [
            //               Text("Ver todos"),
            //               Icon(Icons.arrow_forward_ios)
            //             ],)),

            //             GridView.builder(
            //               itemCount: services.length,
            //               gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
            //               crossAxisCount: 3,
            //               mainAxisSpacing: 10,
            //               crossAxisSpacing: 10,
            //             ) , itemBuilder: (context,index){
            //               return Container(
            //                 decoration: BoxDecoration(
            //                   borderRadius: BorderRadius.circular(10),
            //                 ),
            //                 child: Column(
            //                   mainAxisAlignment: MainAxisAlignment.center,
            //                   children: [
            //                     Image.asset(packages_imagePaths[index],
            //                     width: 80,
            //                     height: 60,
            //                     ),
            //                     SizedBox(height: 2,),
            //                   Expanded(
            //                   child: Text(
            //                     packages[index],
            //                     style: TextStyle(
            //                       fontSize: 16,
            //                       fontWeight: FontWeight.w500,
            //                       color: Colors
            //                           .black,
            //                     ),
            //                     textAlign: TextAlign.center,
            //                     softWrap: true,
            //                     maxLines: 2,
            //                     overflow: TextOverflow.ellipsis,
            //                   ),),
            //                 ],),
            //               );
            //             }),
            //             Padding(
            //               padding: EdgeInsets.symmetric(horizontal: 15),
            //               child: Column(
            //                 children: [
            //                   Row(
            //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                     children: [
            //                       Text("Testes Mais Popular",
            //                       style: TextStyle(
            //                       fontSize: 25,
            //                       fontWeight: FontWeight.w500,
            //                     ),
            //                       ),
            //                     TextButton(onPressed: (){}, child: Row(
            //                       children: [
            //                         Text("Ver todos"),
            //                         Icon(Icons.arrow_forward_ios)
            //                       ],
            //                     ))
            //                     ],
            //                   )
            //                 ],
            //               )
            //             ),
            //             SizedBox(height: 120,
            //             child: ListView.builder(
            //               itemBuilder: (context,index){
            //                 return Container(
            //                   margin: const EdgeInsets.symmetric(vertical: 10),
            //                   padding: const EdgeInsets.symmetric(horizontal: 10),
            //                   decoration: BoxDecoration(
            //                     shape: BoxShape.rectangle,
            //                     borderRadius: BorderRadius.circular(10)
            //                   ),
            //                   child: Column(
            //                     mainAxisAlignment: MainAxisAlignment.center,
            //                     children: [
            //                       Image.asset(tests_imagePaths[index],
            //                       width: 60,
            //                       height: 60,
            //                       ),
            //                       SizedBox(height: 6,)
            //                     ],
            //                   ),
            //                 );
            //               },
            //               itemCount: services.length,
            //               ),
            //             )
            //         ],)
            //     ]
            //   )
            // )

            Padding(padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Testes Populares",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500
                    ),
                    ),
                    TextButton(
                      style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    20), // Set a circular border radius
                              ),
                            ),
                            foregroundColor:
                                MaterialStateProperty.all(Colors.black)),
                                onPressed: (){},
                                child:const Row(children: [
                                        Text("Ver todos"),
                            Icon(Icons.arrow_forward_ios),
                                ],),
                    )
                  ],),
              ],
            ),
            )
          
          
          
          // Bottom of amount of widgets
          ],
        ),
      ),
    );
  }
}