class SessionController {
  static final SessionController _session = SessionController._internal();

  String? _userId;

  factory SessionController() {
    return _session;
  }

  String? get userId => _userId; // Getter method

  set userId(String? value) {
    _userId = value; // Setter method
  }

  SessionController._internal() {}
}