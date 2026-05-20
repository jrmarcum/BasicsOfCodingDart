// Worker pools in Go use goroutines reading from a shared jobs
// channel. In Dart we model the same pattern with a Stream of
// jobs and multiple async workers processing them concurrently.
// Future.wait collects all results just like reading from the
// results channel in Go.

import 'dart:async';

// worker processes a single job: prints start/finish and returns
// the result. Each job takes 1 second to simulate real work.
Future<int> worker(int id, int job) async {
  print('worker $id started  job $job');
  await Future.delayed(const Duration(seconds: 1));
  print('worker $id finished job $job');
  return job * 2;
}

Future<void> main() async {
  const numJobs = 5;
  const numWorkers = 3;

  // Distribute 5 jobs across 3 workers using a round-robin index.
  // Each worker gets a subset of jobs to run sequentially, while
  // different workers run concurrently — matching the channel-based
  // worker pool in Go.
  final jobs = List.generate(numJobs, (i) => i + 1); // [1, 2, 3, 4, 5]

  // Assign jobs to worker queues (round-robin).
  final workerQueues = List.generate(numWorkers, (_) => <int>[]);
  for (int i = 0; i < jobs.length; i++) {
    workerQueues[i % numWorkers].add(jobs[i]);
  }

  // Each worker future processes its assigned jobs sequentially.
  Future<List<int>> runWorker(int id, List<int> myJobs) async {
    final results = <int>[];
    for (final job in myJobs) {
      results.add(await worker(id, job));
    }
    return results;
  }

  // Launch all workers concurrently and wait for completion.
  final allResults = await Future.wait([
    for (int w = 0; w < numWorkers; w++) runWorker(w + 1, workerQueues[w]),
  ]);

  // Collect results (not printed, just to show they're available).
  final _ = allResults.expand((r) => r).toList();
}
