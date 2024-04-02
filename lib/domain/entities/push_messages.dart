class PushMessage {
  final String messageId;
  final String title;
  final String body;
  final DateTime sentDate;
  final Map<String, dynamic>? data;
  final String? imageUrl;
  final DateTime? timestamp;

  PushMessage({
    required this.messageId,
    required this.title,
    required this.body,
    required this.sentDate,
    this.data,
    this.imageUrl,
    this.timestamp,
  });

  Map<String, dynamic> toJson() {
    return {
      'messageId': messageId,
      'title': title,
      'body': body,
      'sentDate': sentDate.toIso8601String(),
      'data': data,
      'imageUrl': imageUrl,
      'timestamp': timestamp?.toIso8601String(), // Incluir la marca de tiempo en la serialización
    };
  }

  factory PushMessage.fromJson(Map<String, dynamic> json) {
    return PushMessage(
      messageId: json['messageId'],
      title: json['title'],
      body: json['body'],
      sentDate: DateTime.parse(json['sentDate']),
      data: json['data'],
      imageUrl: json['imageUrl'],
      timestamp: json['timestamp'] != null ? DateTime.parse(json['timestamp']) : null, // Convertir la marca de tiempo de String a DateTime
    );
  }

  @override
  String toString() {
    return '''
    PushMessage - 
      id:    $messageId
      title: $title
      body:  $body
      data:  $data
      imageUrl: $imageUrl
      sentDate: $sentDate
      timestamp: $timestamp
    ''';
  }
}
