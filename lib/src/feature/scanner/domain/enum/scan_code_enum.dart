enum ScanCode implements Comparable<String> {
  leftSide(keyCode: "133", keyName: "F3"),
  trigger(keyCode: "134", keyName: "F4"),
  rightSide(keyCode: "135", keyName: "F5"),
  unknown(keyCode: "unknown", keyName: "unknown");

  const ScanCode({
    required this.keyCode,
    required this.keyName,
  });

  final String keyCode;
  final String keyName;

  @override
  int compareTo(String other) => keyCode.compareTo(other);

  static ScanCode? fromKeyCode(String keyCode) {
    return ScanCode.values.firstWhere((e) => e.keyCode == keyCode,
        orElse: () => ScanCode.unknown);
  }
}
