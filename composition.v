next_or[A](a: iterator[A], default: A): A
{
  if a.has_next
  {
    a.next
  }
  else
  {
    default
  }
}

count[A](a: iterator[A]): usize
{
  let n = 0.usize;

  for a x ->
  {
    n = n + 1.usize
  }

  n
}

// TODO: any, all may raise or throw from pred?
any[A](a: iterator[A], pred: A -> bool): bool
{
  for a x ->
  {
    if pred(x)
    {
      return true
    }
  }

  false
}

all[A](a: iterator[A], pred: A -> bool): bool
{
  for a x ->
  {
    if !pred(x)
    {
      return false
    }
  }

  true
}

run[A](a: iterator[A]): iterator[A]
{
  for a x -> {}
  a
}

collect[A, B](a: iterator[A], b: B): B
{
  for a x ->
  {
    b.push(x)
  }

  b
}

find[A](a: iterator[A], pred: A -> bool, n: usize = 0.usize): A | nomatch
{
  var rem = n;

  for a x ->
  {
    if pred x
    {
      if rem == 0.usize
      {
        return x
      }

      rem = rem - 1.usize
    }
  }

  nomatch
}

fold[A, B](a: iterator[A], f: (B, A) -> B, acc: B = B): B
{
  var v = acc;

  for a x ->
  {
    v = f(v, x)
  }

  v
}

last[A](a: iterator[A]): A | nomatch
{
  var v: A | nomatch = nomatch;

  for a x ->
  {
    v = x
  }

  v
}

skip[A](a: iterator[A], n: usize): iterator[A]
{
  var rem = n;
  
  while a.has_next & (rem > 0.usize)
  {
    a.next;
    rem = rem - 1.usize
  }

  a
}

// TODO: flat_map
// skip_while, step (every nth), take_while
// interleave? intersperse?
// dedup, unique: use filter?
