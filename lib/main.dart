import 'package:flutter/material.dart';
import 'package:part_details/edit_partdetails.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:part_details/repository/part_details_repository.dart';

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


class HomePage extends StatefulWidget {
   HomePage({Key? key,required this.title}) : super(key: key);
    final String? title;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PartDetails? partData;
  List<LineItem> lineItems = [];

  @override
  void initState() {
    MyApiRepo().getData().then((value) {
      setState(() {
        partData = value;
        if(value!.data!.record!.blocks!= null){
          lineItems = [...?value.data!.record!.lineItems];
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Failed part details"),centerTitle: true,),
      body: Container(
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
                      SizedBox(width: 75,),
                      Text(': TT1497'),
                    ],),
                    Row(children: [
                      Text('Customer'),
                      SizedBox(width: 70,),
                      Text(': BRUNDABAN SAHOO'),
                    ],),
                    Row(children: [
                      Text('Project'),
                      SizedBox(width: 80,),
                      Text(': CCL RAJRAPPA,\n  RAJRAPPA DIST\n  KHARKAHAND'),
                    ],),
                    Row(children: [
                      Text('Notification No'),
                      SizedBox(width: 30,),
                      Text(': BH60M-60621'),
                    ]
                    )
                  ],
                )),
            Expanded(
              flex: 4,
              child: ListView.builder(
                  itemCount: lineItems.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 5,left: 10),
                            child: Row(children: [Text("Part Number",style: TextStyle(fontWeight: FontWeight.bold),),
                              Text( ": "+lineItems[index].lineitemId.toString(),style: TextStyle(fontWeight: FontWeight.bold))],),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Row(children: [Text("Description",),
                              Text(" : "+ lineItems[index].vendorNameLabel.toString())],),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Row(children: [Text("Quantity",),
                              Text(" : "+ lineItems[index].quantity.toString())],),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Row(children: [Text("Replaced Date",),
                              Text(" : "+ lineItems[index].replacedDate.toString())],),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Row(children: [Text("Pending Days",),
                              Text(" : " +lineItems[index].pendingDays.toString())],),
                          ),
                          Divider(thickness: 2.0),
                          Padding(
                            padding: const EdgeInsets.only(top: 5,left: 10),
                            child: Row(children: [Text("Total Submited Quantity",style: TextStyle(fontWeight: FontWeight.bold),),
                              Text(" : " +lineItems[index].totalExcludedQty.toString(),style: TextStyle(fontWeight: FontWeight.bold))],),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Row(children: [Text("Latest Date of Submission",),
                              Text(" : "+lineItems[index].dateOfSubmiss.toString())],),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Row(children: [Text("Remarks By Service Engineer",),
                              Text(" : "+lineItems[index].salesorderCrQty.toString())],),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Row(children: [Text("Pending Qty to Be Submitted",style: TextStyle(fontWeight: FontWeight.bold),),
                              Text(" : " +lineItems[index].pendingQtyToSub.toString(),style: TextStyle(fontWeight: FontWeight.bold))],),
                          ),
                          Divider(thickness: 2.0),
                          Padding(
                            padding: const EdgeInsets.only(top:5,left: 10),
                            child: Row(children: [Text("Received Qty Validated By Sm",),
                              Text(" : "+lineItems[index].rcvdQtyValidated.toString())],),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Row(children: [Text("Pending Qty For Validation",),
                              Text(" : "+lineItems[index].pendingQtyForValidation.toString())],),
                          ), Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Row(children: [Text("Qty Excluded By SM",),
                              Text(" : "+ lineItems[index].excludedQtyRem.toString())],),
                          ), Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Row(children: [Text("Status",),
                              Text(" : "+ lineItems[index].failPaPaStatus.toString())],),
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

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder:
              (context)=>EditPartDetails(id: lineItems[0].lineitemId.toString(),prodId: lineItems[0].productid.toString(),prodName: lineItems[0].productName.toString())));
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
