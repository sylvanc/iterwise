chain[A]
{
  a: iterator[A];
  b: iterator[A];
  curr: iterator[A];

  create(a: iterator[A], b: iterator[A]): chain[A]
  {
    new
    {
      a = a,
      b = b,
      curr = if a.has_next {a} else {b}
    }
  }

  has_next(self: chain[A]): bool
  {
    self.curr.has_next
  }

  next(self: chain[A]): A | nomatch
  {
    let r = self.curr.next;

    if !self.curr.has_next & (self.curr is: self.a)
    {
      self.curr = self.b
    }

    r
  }

  rewind(self: chain[A])
  {
    self.a.rewind;
    self.b.rewind;
    self.curr = if self.a.has_next {self.a} else {self.b}
  }
}
