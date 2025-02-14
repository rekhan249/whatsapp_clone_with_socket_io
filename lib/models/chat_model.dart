class ChatModel {
  final String name;
  final String icon;
  final bool isGroup;
  final String time;
  final String currentMessage;
  final String status;
  bool isSelect;
  int id;

  ChatModel(
      {required this.name,
      required this.icon,
      required this.isGroup,
      required this.time,
      required this.currentMessage,
      required this.status,
      required this.isSelect,
      required this.id});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'icon': icon,
      'isGroup': isGroup,
      'time': time,
      'currentMessage': currentMessage,
      'status': status,
      'isSelect': isSelect,
      'id': id
    };
  }

  factory ChatModel.fromMap(Map<String, dynamic> map) {
    return ChatModel(
        name: map['name'],
        icon: map['icon'],
        isGroup: map['isGroup'],
        time: map['time'],
        currentMessage: map['currentMessage'],
        status: map['status'],
        isSelect: map['isSelect'],
        id: map['id']);
  }
}
