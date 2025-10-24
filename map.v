map[A, B]
{
  base: iterator[A];
  f: A -> B;

  create(base: iterator[A], f: A -> B): map[A, B]
  {
    new {base = base, f = f}
  }

  has_next(self: map[A, B]): bool
  {
    self.base.has_next
  }

  next(self: map[A, B]): B | nomatch
  {
    let r = self.base.next;

    if r is: nomatch
    {
      r
    }
    else
    {
      self.f r
    }
  }

  rewind(self: map[A, B])
  {
    self.base.rewind
  }
}
