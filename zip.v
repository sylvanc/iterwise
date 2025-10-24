zip[A, B]
{
  // TODO: use tuple flattening to zip more than 2 iterators.
  a: iterator[A];
  b: iterator[B];

  create(a: iterator[A], b: iterator[B]): zip[A, B]
  {
    new {a = a, b = b}
  }

  has_next(self: zip[A, B]): bool
  {
    self.a.has_next & self.b.has_next
  }

  next(self: zip[A, B]): (A, B) | nomatch
  {
    if self.has_next
    {
      self.a.next, self.b.next
    }
    else
    {
      nomatch
    }
  }

  rewind(self: zip[A, B])
  {
    self.a.rewind;
    self.b.rewind;
  }
}
