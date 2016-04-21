namespace rb workshop

exception IncrementException {
}

service CountingService {
  i32 getValue();

  // Throws increment exception when count <= 0
  void increment(1: i32 count) throws (
    1: IncrementException incrementException
  )
}
