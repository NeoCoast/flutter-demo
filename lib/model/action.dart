class Action {
  String type;
  dynamic payload;

  Action(this.type, this.payload);

  @override
  String toString() {
    return "$type";
  }
}
