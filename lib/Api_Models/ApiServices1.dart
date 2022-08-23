import 'dart:convert';

UserModel1 userModel1FromJson(String str) => UserModel1.fromJson(json.decode(str));

String userModel1ToJson(UserModel1 data) => json.encode(data.toJson());

class UserModel1 {
  UserModel1({
    this.success,
    this.message,
    this.statusCode,
    this.data,
  });

  bool? success;
  String? message;
  int? statusCode;
  Data? data;

  factory UserModel1.fromJson(Map<String, dynamic> json) => UserModel1(
    success: json["success"] == null ? null : json["success"],
    message: json["message"] == null ? null : json["message"],
    statusCode: json["statusCode"] == null ? null : json["statusCode"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success == null ? null : success,
    "message": message == null ? null : message,
    "statusCode": statusCode == null ? null : statusCode,
    "data": data == null ? null : data?.toJson(),
  };
}

class Data {
  Data({
    this.iResellerId,
    this.vResellerNo,
    this.vFirstName,
    this.vLastName,
    this.vState,
    this.vCity,
    this.iPincode,
    this.vEmail,
    this.ltAddress,
    this.vCompanyName,
    this.vGstNo,
    this.iMobileNo,
    this.iAlternativeMobileNo,
    this.dtMemberFrom,
    this.dtMemberTo,
    this.iMembershipId,
    this.vTransactionDetail,
    this.dmembershipFee,
    this.dCurrentWalletAmt,
    this.dCreditAmount,
    this.vMembershipPaymentThrough,
    this.iAlternetCountryCode,
    this.vAccessToken,
    this.bIsDeleted,
    this.createdAt,
    this.updatedAt,
    this.iCountryCode,
    this.token,
  });

  int? iResellerId;
  String? vResellerNo;
  String? vFirstName;
  String? vLastName;
  String? vState;
  String? vCity;
  int? iPincode;
  dynamic vEmail;
  dynamic ltAddress;
  dynamic vCompanyName;
  dynamic vGstNo;
  int? iMobileNo;
  dynamic iAlternativeMobileNo;
  dynamic dtMemberFrom;
  dynamic dtMemberTo;
  int? iMembershipId;
  dynamic vTransactionDetail;
  dynamic dmembershipFee;
  dynamic dCurrentWalletAmt;
  dynamic dCreditAmount;
  dynamic vMembershipPaymentThrough;
  dynamic iAlternetCountryCode;
  dynamic vAccessToken;
  int? bIsDeleted;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? iCountryCode;
  String? token;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    iResellerId: json["iResellerId"] == null ? null : json["iResellerId"],
    vResellerNo: json["vResellerNo"] == null ? null : json["vResellerNo"],
    vFirstName: json["vFirstName"] == null ? null : json["vFirstName"],
    vLastName: json["vLastName"] == null ? null : json["vLastName"],
    vState: json["vState"] == null ? null : json["vState"],
    vCity: json["vCity"] == null ? null : json["vCity"],
    iPincode: json["iPincode"] == null ? null : json["iPincode"],
    vEmail: json["vEmail"],
    ltAddress: json["ltAddress"],
    vCompanyName: json["vCompanyName"],
    vGstNo: json["vGSTNo"],
    iMobileNo: json["iMobileNo"] == null ? null : json["iMobileNo"],
    iAlternativeMobileNo: json["iAlternativeMobileNo"],
    dtMemberFrom: json["dtMemberFrom"],
    dtMemberTo: json["dtMemberTo"],
    iMembershipId: json["iMembershipId"] == null ? null : json["iMembershipId"],
    vTransactionDetail: json["vTransactionDetail"],
    dmembershipFee: json["dmembershipFee"],
    dCurrentWalletAmt: json["dCurrentWalletAmt"],
    dCreditAmount: json["dCreditAmount"],
    vMembershipPaymentThrough: json["vMembershipPaymentThrough"],
    iAlternetCountryCode: json["iAlternetCountryCode"],
    vAccessToken: json["vAccessToken"],
    bIsDeleted: json["bIsDeleted"] == null ? null : json["bIsDeleted"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    iCountryCode: json["iCountryCode"] == null ? null : json["iCountryCode"],
    token: json["token"] == null ? null : json["token"],
  );

  Map<String, dynamic> toJson() => {
    "iResellerId": iResellerId == null ? null : iResellerId,
    "vResellerNo": vResellerNo == null ? null : vResellerNo,
    "vFirstName": vFirstName == null ? null : vFirstName,
    "vLastName": vLastName == null ? null : vLastName,
    "vState": vState == null ? null : vState,
    "vCity": vCity == null ? null : vCity,
    "iPincode": iPincode == null ? null : iPincode,
    "vEmail": vEmail,
    "ltAddress": ltAddress,
    "vCompanyName": vCompanyName,
    "vGSTNo": vGstNo,
    "iMobileNo": iMobileNo == null ? null : iMobileNo,
    "iAlternativeMobileNo": iAlternativeMobileNo,
    "dtMemberFrom": dtMemberFrom,
    "dtMemberTo": dtMemberTo,
    "iMembershipId": iMembershipId == null ? null : iMembershipId,
    "vTransactionDetail": vTransactionDetail,
    "dmembershipFee": dmembershipFee,
    "dCurrentWalletAmt": dCurrentWalletAmt,
    "dCreditAmount": dCreditAmount,
    "vMembershipPaymentThrough": vMembershipPaymentThrough,
    "iAlternetCountryCode": iAlternetCountryCode,
    "vAccessToken": vAccessToken,
    "bIsDeleted": bIsDeleted == null ? null : bIsDeleted,
    "created_at": createdAt == null ? null : createdAt?.toIso8601String(),
    "updated_at": updatedAt == null ? null : updatedAt?.toIso8601String(),
    "iCountryCode": iCountryCode == null ? null : iCountryCode,
    "token": token == null ? null : token,
  };
}
