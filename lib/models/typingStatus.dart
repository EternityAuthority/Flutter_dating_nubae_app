class TypingStatus {
  String memberID;
  bool isTyping;

  TypingStatus(
    {
      this.memberID,
      this.isTyping,
    }
  );

  TypingStatus.fromJson(Map<dynamic, dynamic> json) {
    memberID = json["memberID"];
    isTyping = json['isTyping'];
  }

  Map<dynamic, dynamic> toJson() => {
    "memberID": memberID,
    "isTyping" : isTyping,
  };
}