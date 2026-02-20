shape iterator[A]
{
  has_next(self: self): bool;
  next(self: self): A | nomatch;
  rewind(self: self);
}
