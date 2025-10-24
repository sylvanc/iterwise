shape iterator[A]
{
  has_next(self: Self): bool;
  next(self: Self): A | nomatch;
  rewind(self: Self);
}
