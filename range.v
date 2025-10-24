range[A = i32]
{
  min: A;
  max: A;
  inc: A;
  idx: A;
  fwd: bool;
  rev: bool;

  create(min: A, max: A, inc: A = A(1)): range[A]
  {
    // If min < max and inc <= 0, the range is empty.
    // If min > max and inc >= 0, the range is empty.
    // If min, max, or inc are NaN, the range is empty.
    new
    {
      min = min,
      max = max,
      inc = inc,
      idx = min,
      fwd = (min < max) & (inc > A(0)),
      rev = (min > max) & (inc < A(0))
    }
  }

  has_next(self: range[A]): bool
  {
    if self.fwd
    {
      self.idx < self.max
    }
    else if self.rev
    {
      self.idx > self.max
    }
  }

  next(self: range[A]): A | nomatch
  {
    if self.has_next
    {
      self.idx = self.idx + self.inc
    }
    else
    {
      nomatch
    }
  }

  rewind(self: range[A]): A
  {
    self.idx = self.min
  }
}
