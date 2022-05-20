import 'dart:convert';

class Account {
  String? id;
  String benutzername;
  String passwort;
  String? schulname;
  String status;

  Account({
    this.id,
    required this.benutzername,
    required this.passwort,
    this.schulname,
    required this.status,
  });

  String toJson() => json.encode(toMapLocal());

  factory Account.fromJson(String source) =>
      Account.fromMap(json.decode(source));

  String toStringLocal() =>
      'ShoppingItem(id: $id, benutzername: $benutzername, passwort: $passwort, schulname: $schulname status: $status)';

  factory Account.fromMap(Map<String, dynamic> map) {
    return Account(
      id: map['id'] as String,
      benutzername: map['benutzername'] as String,
      passwort: map['passwort'] as String,
      status: map['status'] as String,
    );
  }

  factory Account.fromMapLocal(Map<String, dynamic> map) {
    return Account(
      id: map['id'] as String,
      benutzername: map['benutzername'] as String,
      passwort: map['passwort'] as String,
      schulname: map['schulname'] as String,
      status: map['status'] as String,
    );
  }

  Map<String, dynamic> toMapLocal() {
    return {
      'id': id,
      'benutzername': benutzername,
      'passwort': passwort,
      'schulname': schulname,
      'status': status,
    };
  }
}
