import 'dart:convert';

List<PendingRequestModel> pendingRequestModelFromJson(String str) =>
    List<PendingRequestModel>.from(
        json.decode(str).map((x) => PendingRequestModel.fromJson(x)));

String? pendingRequestModelToJson(List<PendingRequestModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PendingRequestModel {
  PendingRequestModel({
    this.rbId,
    this.biodataNo,
    this.senderId,
    this.maritialStatus,
    this.firstName,
    this.lastName,
    this.profsnType,
    this.receiverId,
    this.status,
    this.remarksOfRejection,
    this.sendTime,
    this.actionTime,
  });

  int? rbId;
  String? biodataNo;
  String? senderId;
  String? maritialStatus;
  String? firstName;
  String? lastName;
  String? profsnType;
  String? receiverId;
  String? status;
  String? remarksOfRejection;
  String? sendTime;
  String? actionTime;

  factory PendingRequestModel.fromJson(Map<String?, dynamic> json) =>
      PendingRequestModel(
        rbId: json["rb_id"],
        biodataNo: json["biodata_no"],
        senderId: json["sender_id"],
        maritialStatus: json["maritial_status"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        profsnType: json["profsn_type"],
        receiverId: json["receiver_id"],
        status: json["status"],
        remarksOfRejection: json["remarks_of_rejection"],
        sendTime: json["send_time"],
        actionTime: json["action_time"],
      );

  Map<String?, dynamic> toJson() => {
        "rb_id": rbId,
        "biodata_no": biodataNo,
        "sender_id": senderId,
        "maritial_status": maritialStatus,
        "first_name": firstName,
        "last_name": lastName,
        "profsn_type": profsnType,
        "receiver_id": receiverId,
        "status": status,
        "remarks_of_rejection": remarksOfRejection,
        "send_time": sendTime,
        "action_time": actionTime,
      };
}
