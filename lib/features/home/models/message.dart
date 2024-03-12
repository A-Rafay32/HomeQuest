enum MessageType { read, unread }

class Message {
  String message;
  DateTime time;
  bool isSentByMe;
  bool? isImportant;
  MessageType? messageType;

  Message({
    required this.isSentByMe,
    required this.time,
    required this.message,
    this.messageType,
    this.isImportant,
  });
}

List<Message> messageList = [
  Message(
      isSentByMe: true,
      time: DateTime.now().subtract(const Duration(minutes: 1)),
      message:
          "Sir! Is HP Victus 6 Gaming Laptop still have a stock? I wanna buy it. And Please tell me, is your product geniune?"),
  Message(
      isSentByMe: false,
      time: DateTime.now().subtract(const Duration(minutes: 2)),
      message:
          "Yes, Sir this Product is geniune. Yes, Sir this Product is geniune. Yes, Sir this Product is geniune.Yes, Sir this Product is geniune."),
  Message(
      isSentByMe: true,
      time: DateTime.now().subtract(const Duration(minutes: 3)),
      message: "I want more info about that."),
  Message(
      isSentByMe: false,
      time: DateTime.now().subtract(const Duration(minutes: 4)),
      message: "Sir! How may i help you?"),
  Message(
      isSentByMe: true,
      time: DateTime.now().subtract(const Duration(minutes: 5)),
      message: "What are the specs of HP Victus 6 you are selling?."),
  Message(
      isSentByMe: false,
      time: DateTime.now().subtract(const Duration(minutes: 5)),
      message: "What are the specs of HP Victus 6 you are selling?."),
];
