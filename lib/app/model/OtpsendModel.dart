class OtpsendModel {
  String? status;
  String? msg;
  Data? data;

  OtpsendModel({this.status, this.msg, this.data});

  OtpsendModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  Null? businessFrom;
  Null? firstName;
  Null? lastName;
  Null? username;
  Null? password;
  Null? email;
  Null? emailOtp;
  String? emailVerify;
  String? phone;
  int? phoneOtp;
  String? phoneVerify;
  String? verificationLevel1;
  String? verificationLevel2;
  String? verificationLevel3;
  Null? companyName;
  Null? companyPanNo;
  Null? companyPanImage;
  Null? brandName;
  Null? brandLogo;
  Null? currentBussinessDetails;
  Null? bussinessAddress1;
  Null? bussinessAddress2;
  Null? pincode;
  Null? panNo;
  Null? panImage;
  Null? panImagePath;
  Null? gstNumber;
  Null? gstImage;
  Null? gstImagePath;
  Null? fssaiNumber;
  Null? fssaiImage;
  Null? fssaiImagePath;
  Null? fssaiDate;
  Null? fssaiCertificate;
  Null? indiPanNo;
  Null? indiPanImage;
  Null? indiPanImagePath;
  Null? aadharNo;
  Null? aadharFrontImage;
  Null? aadharFrontImagePath;
  Null? aadharBackImage;
  Null? aadharBackImagePath;
  Null? gender;
  Null? dob;
  Null? whatsapp;
  Null? level1Approve;
  Null? level1Reason;
  Null? level2Approve;
  Null? level2Reason;
  Null? companyLogo;
  Null? companyLogoPath;
  Null? storeStatus;
  Null? status;
  Null? bankName;
  Null? state;
  Null? city;
  Null? district;
  Null? pinCode;
  Null? beneficiaryName;
  Null? beneficiaryAccountNumber;
  Null? accountType;
  Null? ifscCode;
  String? isDelete;
  String? isOnline;
  String? lastSeen;
  String? createdAt;
  String? updatedAt;
  String? createdBy;
  String? updatedBy;

  Data(
      {this.id,
      this.businessFrom,
      this.firstName,
      this.lastName,
      this.username,
      this.password,
      this.email,
      this.emailOtp,
      this.emailVerify,
      this.phone,
      this.phoneOtp,
      this.phoneVerify,
      this.verificationLevel1,
      this.verificationLevel2,
      this.verificationLevel3,
      this.companyName,
      this.companyPanNo,
      this.companyPanImage,
      this.brandName,
      this.brandLogo,
      this.currentBussinessDetails,
      this.bussinessAddress1,
      this.bussinessAddress2,
      this.pincode,
      this.panNo,
      this.panImage,
      this.panImagePath,
      this.gstNumber,
      this.gstImage,
      this.gstImagePath,
      this.fssaiNumber,
      this.fssaiImage,
      this.fssaiImagePath,
      this.fssaiDate,
      this.fssaiCertificate,
      this.indiPanNo,
      this.indiPanImage,
      this.indiPanImagePath,
      this.aadharNo,
      this.aadharFrontImage,
      this.aadharFrontImagePath,
      this.aadharBackImage,
      this.aadharBackImagePath,
      this.gender,
      this.dob,
      this.whatsapp,
      this.level1Approve,
      this.level1Reason,
      this.level2Approve,
      this.level2Reason,
      this.companyLogo,
      this.companyLogoPath,
      this.storeStatus,
      this.status,
      this.bankName,
      this.state,
      this.city,
      this.district,
      this.pinCode,
      this.beneficiaryName,
      this.beneficiaryAccountNumber,
      this.accountType,
      this.ifscCode,
      this.isDelete,
      this.isOnline,
      this.lastSeen,
      this.createdAt,
      this.updatedAt,
      this.createdBy,
      this.updatedBy});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    businessFrom = json['business_from'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    username = json['username'];
    password = json['password'];
    email = json['email'];
    emailOtp = json['email_otp'];
    emailVerify = json['email_verify'];
    phone = json['phone'];
    phoneOtp = json['phone_otp'];
    phoneVerify = json['phone_verify'];
    verificationLevel1 = json['verification_level_1'];
    verificationLevel2 = json['verification_level_2'];
    verificationLevel3 = json['verification_level_3'];
    companyName = json['company_name'];
    companyPanNo = json['company_pan_no'];
    companyPanImage = json['company_pan_image'];
    brandName = json['brand_name'];
    brandLogo = json['brand_logo'];
    currentBussinessDetails = json['current_bussiness_details'];
    bussinessAddress1 = json['bussiness_address_1'];
    bussinessAddress2 = json['bussiness_address_2'];
    pincode = json['pincode'];
    panNo = json['pan_no'];
    panImage = json['pan_image'];
    panImagePath = json['pan_image_path'];
    gstNumber = json['gst_number'];
    gstImage = json['gst_image'];
    gstImagePath = json['gst_image_path'];
    fssaiNumber = json['fssai_number'];
    fssaiImage = json['fssai_image'];
    fssaiImagePath = json['fssai_image_path'];
    fssaiDate = json['fssai_date'];
    fssaiCertificate = json['fssai_certificate'];
    indiPanNo = json['indi_pan_no'];
    indiPanImage = json['indi_pan_image'];
    indiPanImagePath = json['indi_pan_image_path'];
    aadharNo = json['aadhar_no'];
    aadharFrontImage = json['aadhar_front_image'];
    aadharFrontImagePath = json['aadhar_front_image_path'];
    aadharBackImage = json['aadhar_back_image'];
    aadharBackImagePath = json['aadhar_back_image_path'];
    gender = json['gender'];
    dob = json['dob'];
    whatsapp = json['whatsapp'];
    level1Approve = json['level_1_approve'];
    level1Reason = json['level_1_reason'];
    level2Approve = json['level_2_approve'];
    level2Reason = json['level_2_reason'];
    companyLogo = json['company_logo'];
    companyLogoPath = json['company_logo_path'];
    storeStatus = json['store_status'];
    status = json['status'];
    bankName = json['bank_name'];
    state = json['state'];
    city = json['city'];
    district = json['district'];
    pinCode = json['pin_code'];
    beneficiaryName = json['beneficiary_name'];
    beneficiaryAccountNumber = json['beneficiary_account_number'];
    accountType = json['account_type'];
    ifscCode = json['ifsc_code'];
    isDelete = json['is_delete'];
    isOnline = json['is_online'];
    lastSeen = json['last_seen'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['business_from'] = this.businessFrom;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['username'] = this.username;
    data['password'] = this.password;
    data['email'] = this.email;
    data['email_otp'] = this.emailOtp;
    data['email_verify'] = this.emailVerify;
    data['phone'] = this.phone;
    data['phone_otp'] = this.phoneOtp;
    data['phone_verify'] = this.phoneVerify;
    data['verification_level_1'] = this.verificationLevel1;
    data['verification_level_2'] = this.verificationLevel2;
    data['verification_level_3'] = this.verificationLevel3;
    data['company_name'] = this.companyName;
    data['company_pan_no'] = this.companyPanNo;
    data['company_pan_image'] = this.companyPanImage;
    data['brand_name'] = this.brandName;
    data['brand_logo'] = this.brandLogo;
    data['current_bussiness_details'] = this.currentBussinessDetails;
    data['bussiness_address_1'] = this.bussinessAddress1;
    data['bussiness_address_2'] = this.bussinessAddress2;
    data['pincode'] = this.pincode;
    data['pan_no'] = this.panNo;
    data['pan_image'] = this.panImage;
    data['pan_image_path'] = this.panImagePath;
    data['gst_number'] = this.gstNumber;
    data['gst_image'] = this.gstImage;
    data['gst_image_path'] = this.gstImagePath;
    data['fssai_number'] = this.fssaiNumber;
    data['fssai_image'] = this.fssaiImage;
    data['fssai_image_path'] = this.fssaiImagePath;
    data['fssai_date'] = this.fssaiDate;
    data['fssai_certificate'] = this.fssaiCertificate;
    data['indi_pan_no'] = this.indiPanNo;
    data['indi_pan_image'] = this.indiPanImage;
    data['indi_pan_image_path'] = this.indiPanImagePath;
    data['aadhar_no'] = this.aadharNo;
    data['aadhar_front_image'] = this.aadharFrontImage;
    data['aadhar_front_image_path'] = this.aadharFrontImagePath;
    data['aadhar_back_image'] = this.aadharBackImage;
    data['aadhar_back_image_path'] = this.aadharBackImagePath;
    data['gender'] = this.gender;
    data['dob'] = this.dob;
    data['whatsapp'] = this.whatsapp;
    data['level_1_approve'] = this.level1Approve;
    data['level_1_reason'] = this.level1Reason;
    data['level_2_approve'] = this.level2Approve;
    data['level_2_reason'] = this.level2Reason;
    data['company_logo'] = this.companyLogo;
    data['company_logo_path'] = this.companyLogoPath;
    data['store_status'] = this.storeStatus;
    data['status'] = this.status;
    data['bank_name'] = this.bankName;
    data['state'] = this.state;
    data['city'] = this.city;
    data['district'] = this.district;
    data['pin_code'] = this.pinCode;
    data['beneficiary_name'] = this.beneficiaryName;
    data['beneficiary_account_number'] = this.beneficiaryAccountNumber;
    data['account_type'] = this.accountType;
    data['ifsc_code'] = this.ifscCode;
    data['is_delete'] = this.isDelete;
    data['is_online'] = this.isOnline;
    data['last_seen'] = this.lastSeen;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['created_by'] = this.createdBy;
    data['updated_by'] = this.updatedBy;
    return data;
  }
}