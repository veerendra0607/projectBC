// To parse this JSON data, do
//
//     final partDetails = partDetailsFromJson(jsonString);

import 'dart:convert';

PartDetails partDetailsFromJson(String str) => PartDetails.fromJson(json.decode(str));

String partDetailsToJson(PartDetails data) => json.encode(data.toJson());

class PartDetails {
  int? statuscode;
  Data? data;
  String? statusMessage;

  PartDetails({this.statuscode, this.data, this.statusMessage});

  PartDetails.fromJson(Map<String, dynamic> json) {
    try{
      statuscode = json['statuscode'];
      data = json['data'] != null ?  Data.fromJson(json['data']) : Data.fromJson(json['data']);
      statusMessage = json['statusMessage'];
    }catch(e){
      print(e);
    }

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statuscode'] = this.statuscode;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['statusMessage'] = this.statusMessage;
    return data;
  }
}

class Data {
  Data({
    this.record,
  });

  Record? record;
  Data.fromJson(Map<String, dynamic> json) {
    try{
      record = json["record"] == null ? null : Record.fromJson(json["record"]);
    }catch(e){
      print(e);
    }

  }
  Map<String, dynamic> toJson() => {
    "record": record?.toJson(),
  };
}

class Record {
  Record({
    this.blocks,
    this.id,
    this.lineItems,
    this.po,
    this.podate,
  });

  List<Block>? blocks;
  String? id;
  List<LineItem>? lineItems;
  String? po;
  DateTime? podate;

   Record.fromJson(Map<String, dynamic> json) {
    try{
      blocks= json["blocks"] == null ? [] : List<Block>.from(json["blocks"]!.map((x) => Block.fromJson(x)));
    id= json["id"];
    lineItems= json["LineItems"] == null ? [] : List<LineItem>.from(json["LineItems"]!.map((x) => LineItem.fromJson(x)));
    po= json["po"];
    podate=json["podate"] == null ? null : DateTime.parse(json["podate"]);
    }
    catch(e){
      print(e);
    }
  }


  Map<String, dynamic> toJson() => {
    "blocks": blocks == null ? [] : List<dynamic>.from(blocks!.map((x) => x.toJson())),
    "id": id,
    "LineItems": lineItems == null ? [] : List<dynamic>.from(lineItems!.map((x) => x.toJson())),
    "po": po,
    "podate": "${podate!.year.toString().padLeft(4, '0')}-${podate!.month.toString().padLeft(2, '0')}-${podate!.day.toString().padLeft(2, '0')}",
  };
}

class Block {
  Block({
    this.label,
    this.fields,
  });

  String? label;
  List<Field>? fields;

   Block.fromJson(Map<String, dynamic> json) {
     try {
       label = json["label"];
       fields = json["fields"] == null ? [] : List<Field>.from(
           json["fields"]!.map((x) => Field.fromJson(x)));
     }
     catch(e){
       print(e);
     }
   }
  Map<String, dynamic> toJson() => {
    "label": label,
    "fields": fields == null ? [] : List<dynamic>.from(fields!.map((x) => x.toJson())),
  };
}

class Field {
  Field({
    this.name,
    this.value,
    this.label,
    this.uitype,
    this.editable,
    this.type,
    this.id,
  });

  String? name;
  String? value;
  String? label;
  String? uitype;
  bool? editable;
  Type? type;
  String? id;

   Field.fromJson(Map<String, dynamic> json){
   try{
     name= json["name"];
     value= json["value"];
     label= json["label"];
     uitype= json["uitype"];
     editable= json["editable"];
     type= json["type"] == null ? null : Type.fromJson(json["type"]);
     id= json["id"];
   }
   catch(e){
     print(e);
   }
  }

  Map<String, dynamic> toJson() => {
    "name": name,
    "value": value,
    "label": label,
    "uitype": uitype,
    "editable": editable,
    "type": type?.toJson(),
    "id": id,
  };
}

class Type {
  Type({
    this.defaultValue,
  });

  DefaultValue? defaultValue;

   Type.fromJson(Map<String, dynamic> json) {
     try{
  defaultValue=json["defaultValue"] == null ? null : DefaultValue.fromJson(json["defaultValue"]);
  }catch(e){
       print(e);
  }
   }
  Map<String, dynamic> toJson() => {
    "defaultValue": defaultValue?.toJson(),
  };
}

class DefaultValue {
  DefaultValue({
    this.value,
    this.label,
  });

  String? value;
  String? label;

   DefaultValue.fromJson(Map<String, dynamic> json) {
    try{
      value=json["value"];
    label=json["label"];
    }
    catch(e){
      print(e);
    }
  }

  Map<String, dynamic> toJson() => {
    "value": value,
    "label": label,
  };
}

class LineItem {
  LineItem({
    this.productid,
    this.productname,
    this.quantity,
    this.comment,
    this.remarksByEng,
    this.replacedDate,
    this.dateOfSubmiss,
    this.collectImmidiately,
    this.failPaSbQty,
    this.failPaPaStatus,
    this.excludedQty,
    this.excludedQtyRem,
    this.pendingQtyToSub,
    this.rcvdQtyTrValidate,
    this.rcvdQtyValidated,
    this.vendorNameLabel,
    this.vendorName,
    this.pendingDays,
    this.salesorderCrQty,
    this.soCreatableQty,
    this.totalExcludedQty,
    this.totExcludedQtyRem,
    this.totalFailPaSbQty,
    this.pendingQtyForValidation,
    this.submittedQtyLog,
    this.lineitemId,
    this.productName,
  });

  String? productid;
  String? productname;
  String? quantity;
  String? comment;
  String? remarksByEng;
  DateTime? replacedDate;
  String? dateOfSubmiss;
  String? collectImmidiately;
  String? failPaSbQty;
  String? failPaPaStatus;
  String? excludedQty;
  String? excludedQtyRem;
  String? pendingQtyToSub;
  String? rcvdQtyTrValidate;
  String? rcvdQtyValidated;
  String? vendorNameLabel;
  String? vendorName;
  String? pendingDays;
  String? salesorderCrQty;
  String? soCreatableQty;
  String? totalExcludedQty;
  List<dynamic>? totExcludedQtyRem;
  String? totalFailPaSbQty;
  String? pendingQtyForValidation;
  List<dynamic>? submittedQtyLog;
  String? lineitemId;
  String? productName;

   LineItem.fromJson(Map<String, dynamic> json) {
     try{
       productid=json["productid"];
     productname= json["productname"];
     quantity= json["quantity"];
     comment= json["comment"];
     remarksByEng= json["remarks_by_eng"];
     replacedDate= json["replaced_date"] == null ? null : DateTime.parse(json["replaced_date"]);
     dateOfSubmiss= json["date_of_submiss"];
     collectImmidiately= json["collect_immidiately"];
     failPaSbQty= json["fail_pa_sb_qty"];
     failPaPaStatus= json["fail_pa_pa_status"];
     excludedQty= json["excluded_qty"];
     excludedQtyRem= json["excluded_qty_rem"];
     pendingQtyToSub= json["pending_qty_to_sub"];
     rcvdQtyTrValidate= json["rcvd_qty_tr_validate"];
     rcvdQtyValidated=json["rcvd_qty_validated"];
     vendorNameLabel=json["vendor_name_Label"];
     vendorName= json["vendor_name"];
     pendingDays= json["pending_days"];
     salesorderCrQty= json["salesorder_cr_qty"];
     soCreatableQty= json["so_creatable_qty"];
     totalExcludedQty= json["total_excluded_qty"];
     totExcludedQtyRem= json["tot_excluded_qty_rem"] == null ? [] : List<dynamic>.from(json["tot_excluded_qty_rem"]!.map((x) => x));
     totalFailPaSbQty=json["total_fail_pa_sb_qty"];
     pendingQtyForValidation= json["pending_qty_for_validation"];
     submittedQtyLog=json["submitted_qty_log"] == null ? [] : List<dynamic>.from(json["submitted_qty_log"]!.map((x) => x));
     lineitemId=json["lineitem_id"];
     productName=json["product_name"];
     }
     catch(e){
       print(e);
     }
   }

  Map<String, dynamic> toJson() => {
    "productid": productid,
    "productname": productname,
    "quantity": quantity,
    "comment": comment,
    "remarks_by_eng": remarksByEng,
    // "replaced_date": "${replacedDate!.year.toString().padLeft(4, '0')}-${replacedDate!.month.toString().padLeft(2, '0')}-${replacedDate!.day.toString().padLeft(2, '0')}",
    "date_of_submiss": dateOfSubmiss,
    "collect_immidiately": collectImmidiately,
    "fail_pa_sb_qty": failPaSbQty,
    "fail_pa_pa_status": failPaPaStatus,
    "excluded_qty": excludedQty,
    "excluded_qty_rem": excludedQtyRem,
    "pending_qty_to_sub": pendingQtyToSub,
    "rcvd_qty_tr_validate": rcvdQtyTrValidate,
    "rcvd_qty_validated": rcvdQtyValidated,
    "vendor_name_Label": vendorNameLabel,
    "vendor_name": vendorName,
    "pending_days": pendingDays,
    "salesorder_cr_qty": salesorderCrQty,
    "so_creatable_qty": soCreatableQty,
    "total_excluded_qty": totalExcludedQty,
    "tot_excluded_qty_rem": totExcludedQtyRem == null ? [] : List<dynamic>.from(totExcludedQtyRem!.map((x) => x)),
    "total_fail_pa_sb_qty": totalFailPaSbQty,
    "pending_qty_for_validation": pendingQtyForValidation,
    "submitted_qty_log": submittedQtyLog == null ? [] : List<dynamic>.from(submittedQtyLog!.map((x) => x)),
    "lineitem_id": lineitemId,
    "product_name": productName,
  };
}

class LineItemEdit {
  LineItemEdit({
    this.productid,
    this.quantity,
    this.remarksByEng,
    this.dateOfSubmiss,
    this.lineitemId,
    this.productName,
  });

  String? productid;
  String? quantity;
  String? remarksByEng;
  String? dateOfSubmiss;
  String? lineitemId;
  String? productName;

  LineItemEdit.fromJson(Map<String, dynamic> json) {
    try{
      productid=json["productid"];
      quantity= json["quantity"];
      remarksByEng= json["remarks_by_eng"];
      dateOfSubmiss= json["date_of_submiss"];
      lineitemId=json["lineitem_id"];
      productName=json["product_name"];
    }
    catch(e){
      print(e);
    }
  }

  Map<String, dynamic> toJson() => {
    "productid": productid,
    "quantity": quantity,
    "remarks_by_eng": remarksByEng,
    "date_of_submiss": dateOfSubmiss,
    "lineitem_id": lineitemId,
    "product_name": productName,
  };
}
