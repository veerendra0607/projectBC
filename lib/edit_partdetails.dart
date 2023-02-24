import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:part_details/repository/part_details_repository.dart';
import 'package:part_details/repository/service.dart';

import 'model/part_details_model.dart';
import 'package:intl/intl.dart';


class EditPartDetails extends StatefulWidget {
   EditPartDetails({Key? key, required this.id,required this.prodId,required this.prodName}) : super(key: key);

  var id;
  var prodId;
  var prodName;
  @override
  State<EditPartDetails> createState() => _EditPartDetailsState();
}

class _EditPartDetailsState extends State<EditPartDetails> {
  TextEditingController submittedController=TextEditingController();
  TextEditingController remarkController=TextEditingController();
  TextEditingController dateController=TextEditingController();
  List<LineItem>? lineItems;
  static const dateFormatForDatePicker = 'MM-dd-yyyy';
  late String dateOfService;
  @override
  Widget build(BuildContext context) {

    @override

    final key = GlobalKey<FormState>();
    DatePickerController _controller = DatePickerController();
    final onPress = (() async {
      FocusScope.of(context).unfocus();
      if (key.currentState!.validate()) {
        final snackBar = SnackBar(
          content: const Text('Yay! A SnackBar!'),
          action: SnackBarAction(
            label: 'Undo',
            onPressed: () {

            },
          ),
        );
        LineItemEdit lineItemModel = LineItemEdit();
        lineItemModel.lineitemId= widget.id.toString();
        lineItemModel.productid= widget.prodId.toString();
        lineItemModel.productName= widget.prodName.toString();
        lineItemModel.quantity= submittedController.text;
        lineItemModel.remarksByEng=remarkController.text;
        lineItemModel.dateOfSubmiss=dateController.text;

        print("========>");
        print(lineItemModel.toJson().toString());
        await MyApiRepo().PostData(lineItemModel);


      }});
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text('Failed part details')
      ),
      body:Form(
        key: key,
        child: Container(
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
                        child:  Row(children: [Text("Qty Excluded By SM",),
                          Text(": 0")],),
                      ), Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Row(children: [Text("Status",),
                          Text(": Validation Pending")],),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          controller: submittedController,
                          maxLines: null,
                          validator: (value)=> isValidNumber(value!),
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

                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: TextFormField(
                    controller: dateController,
                    minLines: 2,
                    maxLines: 5,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: IconButton(
                          icon: Icon(
                            Icons.calendar_today_sharp,
                            color: Colors.deepPurple,
                          ),
                          onPressed: () async {
                            DateTime d = DateTime(1900);
                            // FocusScope.of(context).requestFocus(FocusNode());

                            d = (await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1900),
                                lastDate: DateTime(2100)))!;
                            final DateFormat formats = DateFormat(
                                dateFormatForDatePicker);
                            dateOfService = formats.format(d);
                            dateController.text =
                                dateOfService.toString();
                          },
                        ),
                      ),
                      // contentPadding: EdgeInsets.all(20),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                    ),
                  ),
                ),
                      ElevatedButton(onPressed: onPress, child: Text('Submit')),
                    ],
                  ),
                ),


              ],
            ),
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
