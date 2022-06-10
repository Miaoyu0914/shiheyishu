class Log {
  static Level _level = Level.ALL;

  static void setLevel(Level level) {
    _level = level;
  }

  static bool isLoggable(Level value) => (value >= _level);

  static void log(Level level, String message) {
    if (!isLoggable(level)) {
      return;
    }

    DateTime date = DateTime.now();

    print(
        '[${level.name}] [${date.hour}:${date.minute}:${date.second}] $message');
  }

  static void info(dynamic message) {
    log(Level.INFO, message.toString());
  }

  static void warning(dynamic message) {
    log(Level.WARNING, message.toString());
  }

  static void error(dynamic message) {
    log(Level.ERROR, message.toString());
  }
}

class Level implements Comparable<Level> {
  final String name;

  final int value;

  const Level(this.name, this.value);

  /// Special key to turn on logging for all levels ([value] = 0).
  static const Level ALL = Level('ALL', 0);

  /// Special key to turn off all logging ([value] = 2000).
  static const Level OFF = Level('OFF', 2000);

  /// Key for informational messages ([value] = 800).
  static const Level INFO = Level('INFO', 800);

  /// Key for potential problems ([value] = 900).
  static const Level WARNING = Level('WARNING', 900);

  /// Key for serious failures ([value] = 1000).
  static const Level ERROR = Level('ERROR', 1000);

  static const List<Level> LEVELS = [ALL, INFO, WARNING, ERROR, OFF];

  @override
  bool operator ==(Object other) => other is Level && value == other.value;

  bool operator <(Level other) => value < other.value;

  bool operator <=(Level other) => value <= other.value;

  bool operator >(Level other) => value > other.value;

  bool operator >=(Level other) => value >= other.value;

  @override
  int compareTo(Level other) => value - other.value;

  @override
  int get hashCode => value;

  @override
  String toString() => name;
}
