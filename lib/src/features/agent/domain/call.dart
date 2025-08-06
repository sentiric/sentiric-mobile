enum CallStatus { ringing, active, ended }

enum HandledBy { ai, agent }

class Call {
  final String id;
  final String from;
  final CallStatus status;
  final HandledBy handledBy;
  // customerInfo gibi diğer alanlar buraya eklenebilir.

  Call(
      {required this.id,
      required this.from,
      required this.status,
      required this.handledBy});

  Call copyWith({HandledBy? handledBy}) {
    return Call(
      id: id,
      from: from,
      status: status,
      handledBy: handledBy ?? this.handledBy,
    );
  }
}

class TranscriptLine {
  // ...
}
