take[A]
{
  base: iterator[A];
  count: usize;
  limit: usize;

  create(base: iterator[A], count: usize): take[A]
  {
    new {base = base, count = 0.usize, limit = count}
  }

  has_next(self: take[A]): bool
  {
    (self.count < self.limit) & self.base.has_next
  }

  next(self: take[A]): A | nomatch
  {
    if self.has_next
    {
      self.count = self.count + 1.usize;
      self.base.next
    }
    else
    {
      nomatch
    }
  }

  rewind(self: take[A])
  {
    self.count = 0.usize;
    self.base.rewind
  }
}
