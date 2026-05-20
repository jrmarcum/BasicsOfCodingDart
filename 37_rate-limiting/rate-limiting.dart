// Rate limiting controls how often an action is performed.
// Go uses time.Tick (a channel receiving at fixed intervals).
// In Dart we use Stream.periodic to emit ticks and zip the
// request stream with the tick stream, enforcing the rate limit.

import 'dart:async';

Future<void> main() async {
  // --- Basic rate limiting ---
  // Process 5 requests, one every 200 ms.
  final requests = [1, 2, 3, 4, 5];

  for (final req in requests) {
    // Wait 200 ms before handling each request — equivalent to
    // blocking on the limiter channel in Go.
    await Future.delayed(const Duration(milliseconds: 200));
    print('request $req ${DateTime.now()}');
  }

  // --- Bursty rate limiting ---
  // Allow an initial burst of 3 requests, then rate-limit
  // subsequent ones to one per 200 ms.
  final burstyRequests = [1, 2, 3, 4, 5];

  // Pre-fill 3 "tokens" into a list to model the buffered channel.
  int tokens = 3;
  const replenishInterval = Duration(milliseconds: 200);

  // Start a timer that adds a token every 200 ms (up to 3).
  final tokenTimer = Timer.periodic(replenishInterval, (_) {
    if (tokens < 3) tokens++;
  });

  for (final req in burstyRequests) {
    // Consume a token immediately if available (burst), otherwise
    // wait for the next replenishment tick.
    if (tokens > 0) {
      tokens--;
    } else {
      // No token available — wait for the next replenishment.
      await Future.delayed(replenishInterval);
      if (tokens > 0) tokens--;
    }
    print('request $req ${DateTime.now()}');
  }

  tokenTimer.cancel();
}
