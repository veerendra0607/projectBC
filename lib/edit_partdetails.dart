import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class EditPartDetails extends StatefulWidget {
  const EditPartDetails({Key? key}) : super(key: key);

  @override
  State<EditPartDetails> createState() => _EditPartDetailsState();
}

class _EditPartDetailsState extends State<EditPartDetails> {
  TextEditingController submittedController=TextEditingController();
  TextEditingController remarkController=TextEditingController();
  TextEditingController dateController=TextEditingController();
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
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
              ),
              Card(
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
                      padding: const EdgeInsets.only(top: 15),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: submittedController,
                        maxLines: null,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(10.0),
                            ),
                          ),
                          filled: true,
                          hintStyle: TextStyle(color: Colors.grey[800]),
                          labelText: 'Submitted Quantity',
                          fillColor: Colors.white70,
                          alignLabelWithHint: true,
                          isDense: true,
                        ),
                      ),
                    ),
                    // Container(
                    //     decoration: BoxDecoration(
                    //       color: Colors.grey,
                    //       borderRadius: new BorderRadius.circular(10.0),
                    //     ),
                    //     child: Padding(
                    //         padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                    //         child: TextFormField(
                    //             decoration: InputDecoration(
                    //               border: InputBorder.none,
                    //               labelText: 'Submitted Quantity',
                    //             )))),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: remarkController,
                        maxLines: null,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(10.0),
                            ),
                          ),
                          filled: true,
                          hintStyle: TextStyle(color: Colors.grey[800]),
                          labelText: 'Remarks By Service Engineer',
                          fillColor: Colors.white70,
                          alignLabelWithHint: true,
                          isDense: true,
                        ),
                      ),
                    ),
                    // Container(
                    //     decoration: BoxDecoration(
                    //       color: Colors.grey,
                    //       borderRadius: new BorderRadius.circular(10.0),
                    //     ),
                    //     child: Padding(
                    //         padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                    //         child: TextFormField(
                    //             decoration: InputDecoration(
                    //               border: InputBorder.none,
                    //               labelText: 'Remarks By Service Engineer',
                    //             )))),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  maxLines: null,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(10.0),
                      ),
                    ),
                    filled: true,
                    hintStyle: TextStyle(color: Colors.grey[800]),
                    labelText: '2023-02-23',
                    fillColor: Colors.white70,
                    alignLabelWithHint: true,
                    isDense: true,
                  ),
                ),
              ),
                    ElevatedButton(onPressed: (){}, child: Text('Submit')),
                    // TextFormField(
                    //   decoration: InputDecoration(
                    //       fillColor: Colors.grey,
                    //       focusColor: Colors.grey
                    //   ),
                    //   validator: (value) {
                    //     if (value!.isEmpty) {
                    //       return 'Your email';
                    //     }
                    //     return null;
                    //   },
                    // ),
                  ],
                ),
              ),


            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
