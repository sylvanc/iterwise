cycle[A]
{
  base: iterator[A];

  create(base: iterator[A]): cycle[A]
  {
    new {base = base}
  }

  has_next(self: cycle[A]): bool
  {
    true
  }

  next(self: cycle[A]): A | nomatch
  {
    if !self.base.has_next
    {
      self.base.rewind
    }

    self.base.next
  }

  rewind(self: cycle[A])
  {
    self.base.rewind
  }
}
