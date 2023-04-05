# Oblig 1
## folds
### foldl
* folds do some action that involves a single element and the rest of the list and reduce the list to a single value.
  * similar to map
  * elem using left fold
```haskell
sum' :: (Num a) => [a] -> a  
sum' xs = foldl f 0 xs
  where f acc x = acc + x
```
```haskell
sum' [3,5,1,2]
-- = f (f (f (f 0 3) 5) 1) 2
-- = 11
```
```haskell
map' :: (a -> b) -> [a] -> [b]  
map' f xs = foldr g [] xs 
    where g x acc = f x : acc
```
```haskell
map' f [1,2,3]
-- = g 1 (g 2 (g 3 []))
```
Folds can be used to implement any function where you traverse a list once, element by element, and then return something based on that. Whenever you want to traverse a list to return something, chances are you want a fold.

## `$`
`$` means that function application can be treated just like another function
```haskell
ghci> map ($ 3) [(4+), (10*), (^2), sqrt]  
[7.0,30.0,9.0,1.7320508075688772]
```

This example needs `$` because every function in Haskell only takes one parameter, and the part after `$` will be a function.
```haskell
zip3' = map (*3) . zipWith max [1,2,3,4,5] $ [4,5,6,7,8]
```

### point free style
```haskell
sum' :: (Num a) => [a] -> a     
sum' xs = foldl (+) 0 xs
```
can be written like that:
```haskell
sum' = foldl (+) 0
```

## return
`return` doesn't cause the I/O do block to end in execution or anything like that. return doesn't do anything. 

## getContents
lazyness of Haskell
`getContents`, `hGetContents` won't attempt to read the file at once and store it in memory, but it will read it as needed.

## referential trasparency
Haskell has referential transparency. A function, if given the same parameters twice, 
must produce the same result twice. That's really cool because it allows us to reason 
differently about programs and it enables us to defer evaluation until we really need it.

## bytestrings
Whenever you need better performance in a program that reads a lot of data into strings, 
bytestrings can be a way to improve the performance.