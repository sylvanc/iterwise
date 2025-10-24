maybe[A]
{
  item: A | none;
  taken: bool;

  create(item: A | none = none): maybe[A]
  {
    new {item = item, taken = false}
  }

  has_next(self: maybe[A]): bool
  {
    !self.taken & (self.item isnt none)
  }

  next(self: maybe[A]): A | nomatch
  {
    if self.has_next
    {
      self.taken = true;
      self.item
    }
    else
    {
      nomatch
    }
  }

  rewind(self: maybe[A])
  {
    self.taken = false
  }
}
