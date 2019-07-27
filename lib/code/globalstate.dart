
class GlobalState {

  final Map<dynamic, dynamic> _data = <dynamic, dynamic>{};

  // This static variable references the global state object (this class above).
  static GlobalState instance = GlobalState._(); // Only one instance of this object will exist in the application.
  GlobalState._(); // Calling the constructor of this instance.

  set(key, value) => _data[key] = value;
  get(dynamic key) => _data[key];

}