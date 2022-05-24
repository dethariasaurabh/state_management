import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  int? id;
  String? uid;
  String? accountNumber;
  String? iban;
  String? bankName;
  String? routingNumber;
  String? swiftBic;

  UserModel({this.id, this.uid, this.accountNumber, this.iban, this.bankName, this.routingNumber, this.swiftBic});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uid = json['uid'];
    accountNumber = json['account_number'];
    iban = json['iban'];
    bankName = json['bank_name'];
    routingNumber = json['routing_number'];
    swiftBic = json['swift_bic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['uid'] = this.uid;
    data['account_number'] = this.accountNumber;
    data['iban'] = this.iban;
    data['bank_name'] = this.bankName;
    data['routing_number'] = this.routingNumber;
    data['swift_bic'] = this.swiftBic;
    return data;
  }
}
