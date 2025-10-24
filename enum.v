enum[A]
{
  base: iterator[A];
  idx: usize;

  create(base: iterator[A]): enum[A]
  {
    new {base = base, idx = 0.usize}
  }

  has_next(self: enum[A]): bool
  {
    self.base.has_next
  }

  next(self: enum[A]): (usize, A) | nomatch
  {
    let r = self.base.next;

    if r is: nomatch
    {
      r
    }
    else
    {
      (self.idx = self.idx + 1.usize, r)
    }
  }

  rewind(self: enum[A])
  {
    self.base.rewind;
    self.idx = 0.usize;
  }
}
