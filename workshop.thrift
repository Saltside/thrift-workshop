namespace rb workshop

exception IncrementException {
  1: required i32 value
}

service CountingService {
  i32 getValue();

  // Throws increment exception when count <= 0
  void increment(1: i32 count) throws (
    1: IncrementException incrementException
  )
}
