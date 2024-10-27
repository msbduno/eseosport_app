// models/activity_model.dart

class Activity {
  final int idActivity;
  final DateTime date;
  final int duration; // en secondes
  final double distance; // en kilomètres
  final double elevation; // en mètres
  final double averageSpeed; // en km/h
  final int averageBPM; // battements par minute
  final int userId;
  late final String? comment;


  Activity({
    required this.idActivity,
    required this.date,
    required this.duration,
    required this.distance,
    required this.elevation,
    required this.averageSpeed,
    required this.averageBPM,
    required this.userId,
    this.comment,
  });

  // Add a method to update the comment
  void updateComment(String newComment) {
    comment = newComment;
  }

  // Méthode pour convertir l'objet Activity en JSON
  Map<String, dynamic> toJson() {
    return {
      'id_activity': idActivity,
      'date': date.toIso8601String(),
      'duration': duration,
      'distance': distance,
      'elevation': elevation,
      'averageSpeed': averageSpeed,
      'averageBPM': averageBPM,
      'userId': userId,
      'comment': comment,
    };
  }

  // Méthode pour créer un objet Activity à partir de JSON
  factory Activity.fromJson(Map<String, dynamic> json) {
    return Activity(
      idActivity: json['id_activity'],
      date: DateTime.parse(json['date']),
      duration: json['duration'],
      distance: json['distance'],
      elevation: json['elevation'],
      averageSpeed: json['averageSpeed'],
      averageBPM: json['averageBPM'],
      userId: json['userId'],
      comment: json['comment'],
    );
  }
}
