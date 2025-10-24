filter[A]
{
  base: iterator[A];
  pred: A -> bool;
  next_item: A | nomatch;

  create(base: iterator[A], pred: A -> bool): filter[A]
  {
    new {base = base, pred = pred, next_item = nomatch}
  }

  has_next(self: filter[A]): bool
  {
    if self.next_item is: nomatch
    {
      while self.base.has_next
      {
        let item = self.base.next;

        if self.pred item
        {
          self.next_item = item;
          return true
        }
      }

      false
    }
    else
    {
      true
    }
  }

  next(self: filter[A]): A | nomatch
  {
    if self.has_next
    {
      self.next_item = nomatch
    }
  }

  rewind(self: filter[A])
  {
    self.base.rewind;
    self.next_item = nomatch;
  }
}
