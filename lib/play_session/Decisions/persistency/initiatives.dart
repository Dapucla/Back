class Initiative {
  final String id;
  final String name;
  final String text;
  final String decisionRating;
  final String feedback;

  Initiative({
    required this.id,
    required this.name,
    required this.text,
    required this.decisionRating,
    required this.feedback,
  });

  factory Initiative.fromJson(Map<String, dynamic> json) {
    return Initiative(
      id: json['id'].toString(),  // Safely converting to String, assuming ID might be an integer
      name: json['Name'] as String, // Explicitly casting as String
      text: json['Text'] as String, // Explicitly casting as String
      decisionRating: json['Decision Rating (1-3)'] as String, // Explicitly casting as String
      feedback: json['Feedback'] as String, // Explicitly casting as String
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'Name': name,
      'Text': text,
      'Decision Rating (1-3)': decisionRating,
      'Feedback': feedback,
    };
  }
}
