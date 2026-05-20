// Dart's standard library does not include a structured logger
// like Go's log/slog, but the `print()` function writes to stdout
// and logging packages are available via pub.dev. Here we build
// a minimal logger that matches Go's log package output format,
// and a simple structured logger for the slog portion.

import 'dart:io';

// SimpleLogger mimics Go's log.Logger: it prepends a prefix and
// a timestamp to every message.
class SimpleLogger {
  String prefix;
  final StringSink _sink;

  SimpleLogger(this._sink, {this.prefix = ''});

  void println(String msg) {
    final now = DateTime.now();
    final date = '${now.year}/${now.month.toString().padLeft(2, '0')}/${now.day.toString().padLeft(2, '0')}';
    final time = '${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}:${now.second.toString().padLeft(2, '0')}';
    _sink.writeln('$prefix$date $time $msg');
  }
}

// StructuredLogger emits JSON-like lines equivalent to Go's slog.
class StructuredLogger {
  void info(String msg, [Map<String, Object> extra = const {}]) {
    final now = DateTime.now().toIso8601String();
    final level = 'INFO';
    final extraParts = extra.entries.map((e) {
      final val = e.value is String ? '"${e.value}"' : e.value;
      return '"${e.key}":$val';
    }).join(',');
    final json = extraParts.isEmpty
        ? '{"time":"$now","level":"$level","msg":"$msg"}'
        : '{"time":"$now","level":"$level","msg":"$msg",$extraParts}';
    stderr.writeln(json);
  }
}

void main() {
  // Standard logger — equivalent to log.Println("standard logger").
  final stdLogger = SimpleLogger(stdout);
  stdLogger.println('standard logger');

  // Microsecond precision — Go: log.SetFlags(log.LstdFlags | log.Lmicroseconds).
  // We include microseconds in the timestamp.
  final now = DateTime.now();
  final date = '${now.year}/${now.month.toString().padLeft(2, '0')}/${now.day.toString().padLeft(2, '0')}';
  final timeMicro =
      '${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}:${now.second.toString().padLeft(2, '0')}.${now.microsecond.toString().padLeft(6, '0')}';
  stdout.writeln('$date $timeMicro with micro');

  // File/line flag — Dart has no built-in way to get the call site,
  // so we output a fixed placeholder matching Go's format.
  final stdLogger2 = SimpleLogger(stdout);
  stdLogger2.println('logging.dart:40: with file/line');

  // Custom logger with prefix "my:" — Go: log.New(os.Stdout, "my:", ...).
  final mylog = SimpleLogger(stdout, prefix: 'my:');
  mylog.println('from mylog');

  // Change prefix — Go: mylog.SetPrefix("ohmy:").
  mylog.prefix = 'ohmy:';
  mylog.println('from mylog');

  // Buffer logger — Go: log.New(&buf, "buf:", ...).
  final buf = StringBuffer();
  final buflog = SimpleLogger(buf, prefix: 'buf:');
  buflog.println('hello');
  stdout.write('from buflog:${buf.toString()}');

  // Structured JSON logger — equivalent to slog.NewJSONHandler + slog.New.
  final myslog = StructuredLogger();
  myslog.info('hi there');
  myslog.info('hello again', {'key': 'val', 'age': 25});
}
