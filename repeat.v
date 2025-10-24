repeat[A]
{
  item: A;
  count: usize | none;

  create(item: A, count: usize | none = none): repeat[A]
  {
    new {item = item, count = count}
  }

  has_next(self: repeat[A]): bool
  {
    (self.count is: none) | (self.count > 0.usize)
  }
  
  next(self: repeat[A]): A | nomatch
  {
    if self.count is: none
    {
      self.item
    }
    else if self.count > 0.usize
    {
      self.count = self.count - 1.usize;
      self.item
    }
    else
    {
      nomatch
    }
  }
}
