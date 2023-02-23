import 'package:flutter/material.dart';
import 'package:part_details/edit_partdetails.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:part_details/repository/part_details_repository.dart';
import 'package:part_details/repository/service.dart';

import 'model/part_details_model.dart';
void main() {
  runApp(const ProviderScope(child:  MyApp()));
}


class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.deepPurple,
      ),
      home:  HomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class HomePage extends ConsumerWidget {
   HomePage({Key? key,required this.title}) : super(key: key);
final String title;
  // final response = FutureProvider((ref) async {
  //   final ApiService = ref.watch(partDetailsRepositoryProvider);
  //   return ApiService.getPartDetails();
  // });

  @override
  Widget build(BuildContext context,WidgetRef ref) {
   // var Result1= ref.read(partDetailsRepositoryProvider).getPartDetails();
   //  final responseProvider = ref.watch(response);
   //  print(responseProvider);
   //  print("Hello");
     ref.read(partDetailsRepositoryProvider).getPartDetails().then((value){
       PartDetails  world=value;
       print("world===========>");
      print(world.data!.record!.blocks!.length);
      print(world.data!.record!.blocks!.length);
      print(world.data!.record!.blocks!.length);
    });
    print("Result1");

    // print(Result1);

    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text('Failed part details')
      ),
      body:Container(
        width: double.infinity,
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
                flex: 1,
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(children: [
                      Text('Equipment SL No'),
                      SizedBox(width: 20,),
                      Text(': BH60M-60621'),
                    ],),
                    Row(children: [
                      Text('Ticket Id'),
                      SizedBox(width: 20,),
                      Text(': TT1497'),
                    ],),
                    Row(children: [
                      Text('Customer'),
                      SizedBox(width: 20,),
                      Text(': BRUNDABAN SAHOO'),
                    ],),
                    Row(children: [
                      Text('Project'),
                      SizedBox(width: 20,),
                      Text(': CCL RAJRAPPA,\n  RAJRAPPA DIST\n  KHARKAHAND'),
                    ],),
                    Row(children: [
                      Text('Notification No'),
                      SizedBox(width: 20,),
                      Text(': BH60M-60621'),
                    ]
                    )
                  ],
                )),
            Expanded(
              flex: 4,
              child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 5,left: 10),
                            child: Row(children: [Text("Part Number",style: TextStyle(fontWeight: FontWeight.bold),),
                              Text(": 130932154654",style: TextStyle(fontWeight: FontWeight.bold))],),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Row(children: [Text("Description",),
                              Text(": PR01")],),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Row(children: [Text("Quantity",),
                              Text(": 10")],),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Row(children: [Text("Replaced Date",),
                              Text(": 2022-12-22")],),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Row(children: [Text("Pending Days",),
                              Text(": 47")],),
                          ),
                          Divider(thickness: 2.0),
                          Padding(
                            padding: const EdgeInsets.only(top: 5,left: 10),
                            child: Row(children: [Text("Total Submited Quantity",style: TextStyle(fontWeight: FontWeight.bold),),
                              Text(": 1",style: TextStyle(fontWeight: FontWeight.bold))],),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Row(children: [Text("Latest Date of Submission",),
                              Text(": 2023-02-08")],),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Row(children: [Text("Remarks By Service Engineer",),
                              Text(": Part is Not Working")],),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Row(children: [Text("Pending Qty to Be Submitted",style: TextStyle(fontWeight: FontWeight.bold),),
                              Text(": 1",style: TextStyle(fontWeight: FontWeight.bold))],),
                          ),
                          Divider(thickness: 2.0),
                          Padding(
                            padding: const EdgeInsets.only(top:5,left: 10),
                            child: Row(children: [Text("Received Qty Validated By Sm",),
                              Text(": 0")],),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Row(children: [Text("Pending Qty For Validation",),
                              Text(": 1")],),
                          ), Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Row(children: [Text("Qty Excluded By SM",),
                              Text(": 0")],),
                          ), Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Row(children: [Text("Status",),
                              Text(": Validation Pending")],),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10,bottom: 20),
                            child: Row(children: [Text("Marked As Important To Collect Immediately?",style: TextStyle(fontWeight: FontWeight.bold),),
                            ],),
                          ),
                        ],
                      ),
                    );

                  }),),


          ],
        ),
      ),
      // Center(
      //   child: Padding(
      //     padding: const EdgeInsets.all(15.0),
      //     child: Column(
      //       // mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //       Row(children: [
      //         Text('Equipment SL No'),
      //         SizedBox(width: 20,),
      //         Text(': BH60M-60621'),
      //       ],),
      //         Row(children: [
      //           Text('Ticket Id'),
      //           SizedBox(width: 20,),
      //           Text(': TT1497'),
      //         ],),
      //         Row(children: [
      //           Text('Customer'),
      //           SizedBox(width: 20,),
      //           Text(': BRUNDABAN SAHOO'),
      //         ],),
      //         Row(children: [
      //           Text('Project'),
      //           SizedBox(width: 20,),
      //           Text(': CCL RAJRAPPA,\n  RAJRAPPA DIST\n  KHARKAHAND'),
      //         ],),
      //         Row(children: [
      //           Text('Notification No'),
      //           SizedBox(width: 20,),
      //           Text(': BH60M-60621'),
      //         ],),
      //         Container(
      //           color: Colors.green,
      //         ),
      //         Container(
      //           color: Colors.grey,
      //         )
      //
      //
      //       ],
      //     ),
      //   ),
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>EditPartDetails()));
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
List<PartDetails>? partDetails;
var isLoaded=false;

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }
getData()async{
  partDetails =(await RemoteService().getPartDetails()) as List<PartDetails>?;
if(partDetails!=null){
  setState(() {
    isLoaded=true;
  });
}
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text('Failed part details')
      ),
      body:Container(
        width: double.infinity,
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              flex: 1,
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Row(children: [
                          Text('Equipment SL No'),
                          SizedBox(width: 20,),
                          Text(': BH60M-60621'),
                        ],),
                          Row(children: [
                            Text('Ticket Id'),
                            SizedBox(width: 20,),
                            Text(': TT1497'),
                          ],),
                          Row(children: [
                            Text('Customer'),
                            SizedBox(width: 20,),
                            Text(': BRUNDABAN SAHOO'),
                          ],),
                          Row(children: [
                            Text('Project'),
                            SizedBox(width: 20,),
                            Text(': CCL RAJRAPPA,\n  RAJRAPPA DIST\n  KHARKAHAND'),
                          ],),
                          Row(children: [
                            Text('Notification No'),
                            SizedBox(width: 20,),
                            Text(': BH60M-60621'),
                  ]
                  )
                  ],
                )),
            Expanded(
                flex: 4,
                child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 5,left: 10),
                              child: Row(children: [Text("Part Number",style: TextStyle(fontWeight: FontWeight.bold),),
                                Text(": 130932154654",style: TextStyle(fontWeight: FontWeight.bold))],),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Row(children: [Text("Description",),
                                Text(": PR01")],),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Row(children: [Text("Quantity",),
                                Text(": 10")],),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Row(children: [Text("Replaced Date",),
                                Text(": 2022-12-22")],),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Row(children: [Text("Pending Days",),
                                Text(": 47")],),
                            ),
                            Divider(thickness: 2.0),
                            Padding(
                              padding: const EdgeInsets.only(top: 5,left: 10),
                              child: Row(children: [Text("Total Submited Quantity",style: TextStyle(fontWeight: FontWeight.bold),),
                                Text(": 1",style: TextStyle(fontWeight: FontWeight.bold))],),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Row(children: [Text("Latest Date of Submission",),
                                Text(": 2023-02-08")],),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Row(children: [Text("Remarks By Service Engineer",),
                                Text(": Part is Not Working")],),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Row(children: [Text("Pending Qty to Be Submitted",style: TextStyle(fontWeight: FontWeight.bold),),
                                Text(": 1",style: TextStyle(fontWeight: FontWeight.bold))],),
                            ),
                            Divider(thickness: 2.0),
                            Padding(
                              padding: const EdgeInsets.only(top:5,left: 10),
                              child: Row(children: [Text("Received Qty Validated By Sm",),
                                Text(": 0")],),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Row(children: [Text("Pending Qty For Validation",),
                                Text(": 1")],),
                            ), Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Row(children: [Text("Qty Excluded By SM",),
                                Text(": 0")],),
                            ), Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Row(children: [Text("Status",),
                                Text(": Validation Pending")],),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10,bottom: 20),
                              child: Row(children: [Text("Marked As Important To Collect Immediately?",style: TextStyle(fontWeight: FontWeight.bold),),
                               ],),
                            ),
                          ],
                        ),
                      );

                    }),),


          ],
        ),
      ),
      // Center(
      //   child: Padding(
      //     padding: const EdgeInsets.all(15.0),
      //     child: Column(
      //       // mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //       Row(children: [
      //         Text('Equipment SL No'),
      //         SizedBox(width: 20,),
      //         Text(': BH60M-60621'),
      //       ],),
      //         Row(children: [
      //           Text('Ticket Id'),
      //           SizedBox(width: 20,),
      //           Text(': TT1497'),
      //         ],),
      //         Row(children: [
      //           Text('Customer'),
      //           SizedBox(width: 20,),
      //           Text(': BRUNDABAN SAHOO'),
      //         ],),
      //         Row(children: [
      //           Text('Project'),
      //           SizedBox(width: 20,),
      //           Text(': CCL RAJRAPPA,\n  RAJRAPPA DIST\n  KHARKAHAND'),
      //         ],),
      //         Row(children: [
      //           Text('Notification No'),
      //           SizedBox(width: 20,),
      //           Text(': BH60M-60621'),
      //         ],),
      //         Container(
      //           color: Colors.green,
      //         ),
      //         Container(
      //           color: Colors.grey,
      //         )
      //
      //
      //       ],
      //     ),
      //   ),
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>EditPartDetails()));
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
