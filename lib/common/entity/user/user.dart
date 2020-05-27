import 'dart:convert';

import '../base/idata.dart';

/// 用户登录请求
class UserReq implements IData {
  String account;
  String password;

  UserReq({
    this.account,
    this.password,
  });

  factory UserReq.fromJson(Map<String, dynamic> json) => UserReq(
        account: json["account"],
        password: json["password"],
      );

  @override
  Map<String, dynamic> toJson() => {
        "account": account,
        "password": password,
      };

  @override
  UserReq fromJson(Map<String, dynamic> json) => UserReq.fromJson(json);
}

class UserResp implements IData {
  String accessToken;
  User user;

  UserResp({this.accessToken, this.user});

  UserResp.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['access_token'] = this.accessToken;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    return data;
  }

  @override
  fromJson(Map<String, dynamic> json) => UserResp.fromJson(json);
}

class User {
  int id;
  String name;
  String account;
  String password;
  int sex;
  int createUserId;
  String createTime;
  String phoneNumber;
  String wechatNumber;
  String photo1;
  String attendanceNo;
  String isEnabled;
  int systemJobId;
  int systemOrgId;
  SystemOrg systemOrg;
  List<SystemRoles> systemRoles;
  List<int> allRoleId;

  User(
      {this.id,
      this.name,
      this.account,
      this.password,
      this.sex,
      this.createUserId,
      this.createTime,
      this.phoneNumber,
      this.wechatNumber,
      this.photo1,
      this.attendanceNo,
      this.isEnabled,
      this.systemJobId,
      this.systemOrgId,
      this.systemOrg,
      this.systemRoles,
      this.allRoleId});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    account = json['account'];
    password = json['password'];
    sex = json['sex'];
    createUserId = json['create_user_id'];
    createTime = json['create_time'];
    phoneNumber = json['phone_number'];
    wechatNumber = json['wechat_number'];
    photo1 = json['photo1'];
    attendanceNo = json['attendance_no'];
    isEnabled = json['is_enabled'];
    systemJobId = json['system_job_id'];
    systemOrgId = json['system_org_id'];
    systemOrg = json['system_org'] != null ? new SystemOrg.fromJson(json['system_org']) : null;
    if (json['system_roles'] != null) {
      systemRoles = new List<SystemRoles>();
      json['system_roles'].forEach((v) {
        systemRoles.add(new SystemRoles.fromJson(v));
      });
    }
    allRoleId = json['all_role_id'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['account'] = this.account;
    data['password'] = this.password;
    data['sex'] = this.sex;
    data['create_user_id'] = this.createUserId;
    data['create_time'] = this.createTime;
    data['phone_number'] = this.phoneNumber;
    data['wechat_number'] = this.wechatNumber;
    data['photo1'] = this.photo1;
    data['attendance_no'] = this.attendanceNo;
    data['is_enabled'] = this.isEnabled;
    data['system_job_id'] = this.systemJobId;
    data['system_org_id'] = this.systemOrgId;
    if (this.systemOrg != null) {
      data['system_org'] = this.systemOrg.toJson();
    }
    if (this.systemRoles != null) {
      data['system_roles'] = this.systemRoles.map((v) => v.toJson()).toList();
    }
    data['all_role_id'] = this.allRoleId;
    return data;
  }

  @override
  fromJson(Map<String, dynamic> json) {
    return UserResp.fromJson(json);
  }
}

class SystemOrg {
  int id;
  int sort;
  String name;
  String anotherName;
  int fatherId;
  String completeId;
  String completeName;

  SystemOrg({this.id, this.sort, this.name, this.anotherName, this.fatherId, this.completeId, this.completeName});

  SystemOrg.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sort = json['sort'];
    name = json['name'];
    anotherName = json['another_name'];
    fatherId = json['father_id'];
    completeId = json['complete_id'];
    completeName = json['complete_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['sort'] = this.sort;
    data['name'] = this.name;
    data['another_name'] = this.anotherName;
    data['father_id'] = this.fatherId;
    data['complete_id'] = this.completeId;
    data['complete_name'] = this.completeName;
    return data;
  }
}

class SystemRoles {
  int id;
  String name;
  String code;
  String remark;
  bool undeletable;

  SystemRoles({this.id, this.name, this.code, this.remark, this.undeletable});

  SystemRoles.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    code = json['code'];
    remark = json['remark'];
    undeletable = json['undeletable'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['code'] = this.code;
    data['remark'] = this.remark;
    data['undeletable'] = this.undeletable;
    return data;
  }
}
