abstract class UhfWrapper {
  Future<bool?> initUhf();
  Future<bool?> isConnected();
  Future<bool?> startReading(StartMode mode);
  Future<bool?> stopReading();
  Future<bool?> disposeUhf();
  Future<bool?> setPowerLevel(PowerLevel powerLevel);
  Future<bool?> setWorkArea(WorkArea workAreaLevel);
}

enum StartMode {
  single,
  loopContinuous,
}

enum PowerLevel {
  lowest, //5
  low, //10
  medium, //15
  high, //20
  veryhigh, //25
  max, //30
}

enum WorkArea {
  smallest, //1
  verysmall, //2
  small, //4
  lowermedium, //8
  medium, //22
  large, //50
  verylarge, //51
  superlarge, //52
  max, //128
}