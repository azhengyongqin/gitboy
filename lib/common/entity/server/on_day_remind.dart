class OnDayRemindReq {
  String channelCode;
  String eventCode;

  OnDayRemindReq({this.channelCode, this.eventCode});

  OnDayRemindReq.fromJson(Map<String, dynamic> json) {
    channelCode = json['channel_code'];
    eventCode = json['event_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['channel_code'] = this.channelCode;
    data['event_code'] = this.eventCode;
    return data;
  }
}


class OnDayRemindResp {
  List<ProgramData> programData;
  int status;
  String message;
  String eventCode;
  String channelCode;
  String listDesc;

  OnDayRemindResp(
      {this.programData,
        this.status,
        this.message,
        this.eventCode,
        this.channelCode,
        this.listDesc});

  OnDayRemindResp.fromJson(Map<String, dynamic> json) {
    if (json['program_data'] != null) {
      programData = new List<ProgramData>();
      json['program_data'].forEach((v) {
        programData.add(new ProgramData.fromJson(v));
      });
    }
    status = json['status'];
    message = json['message'];
    eventCode = json['event_code'];
    channelCode = json['channel_code'];
    listDesc = json['list_desc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.programData != null) {
      data['program_data'] = this.programData.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    data['message'] = this.message;
    data['event_code'] = this.eventCode;
    data['channel_code'] = this.channelCode;
    data['list_desc'] = this.listDesc;
    return data;
  }
}

class ProgramData {
  String playTime;
  String clipId;
  String programName;
  String clipType;
  String desc;
  String clipFile;
  String belongChannelCode;
  String submitType;
  int clipStatus;

  ProgramData(
      {this.playTime,
        this.clipId,
        this.programName,
        this.clipType,
        this.desc,
        this.clipFile,
        this.belongChannelCode,
        this.submitType,
        this.clipStatus});

  ProgramData.fromJson(Map<String, dynamic> json) {
    playTime = json['play_time'];
    clipId = json['clip_id'];
    programName = json['program_name'];
    clipType = json['clip_type'];
    desc = json['desc'];
    clipFile = json['clip_file'];
    belongChannelCode = json['belong_channel_code'];
    submitType = json['submit_type'];
    clipStatus = json['clip_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['play_time'] = this.playTime;
    data['clip_id'] = this.clipId;
    data['program_name'] = this.programName;
    data['clip_type'] = this.clipType;
    data['desc'] = this.desc;
    data['clip_file'] = this.clipFile;
    data['belong_channel_code'] = this.belongChannelCode;
    data['submit_type'] = this.submitType;
    data['clip_status'] = this.clipStatus;
    return data;
  }
}
