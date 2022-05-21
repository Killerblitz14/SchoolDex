class AGs {
  String? id;
  String thema;
  String jahrgang;
  String? beschreibung;
  String termin;
  String schulname;

  AGs({
    this.id,
    required this.thema,
    required this.jahrgang,
    this.beschreibung,
    required this.termin,
    required this.schulname,
  });

  factory AGs.fromMap(Map<String, dynamic> map) {
    return AGs(
      id: map['id'] as String,
      thema: map['thema'] as String,
      jahrgang: map['jahrgang'] as String,
      beschreibung: map['beschreibung'] as String,
      termin: map['termin'] as String,
      schulname: map['schulname'] as String,
    );
  }
}
