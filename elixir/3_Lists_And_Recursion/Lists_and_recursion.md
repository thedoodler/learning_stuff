Conventionally our minds are programmed to <i><b>Iterate</b></i> over lists. But here we will see that <i><b>recursion</b></i> is the absolute best solution.


<h3>Recursive definition</h3>

We already saw that a list can either be empty or have two elements head or tail. the head can be a value and the tail in itself is another list.


empty list is represented as []. for arguments sake lets say we can split the head and tail with a pipe |.
now the simple list [3] can be written as [ 3 | [] ].


Now if we extend the list with a value 2,
the list becomes [ 2 | [ 3 | [] ] ]

The full list can be written as  [ 1 | [ 2 | [ 3 | [] ] ] ]


Now we have absolutely defined the full list recursively.


This is valid elixir syntax and lists can be defined this way.

<h4>Pattern matching</h4>

This pipe syntax can be used with pattern matching for matching the tail value as an entire list. the normal list syntax can be used for usual value matching

<code>[ a, b, c] = [ 1, 2, 3]</code>  # a=1, b=2, c=3

<code>[ head | tail ] = [ 1, 2, 3]</code> # head = 1, tail = [ b, c ]


note:
Remember when debugging your code always inspect the list and convert it to a string for getting the actual list



Now that we know about the head tail syntax, we can now construct a new list if we have a value and a list.

Now lets write a function for finding the length of a list. Here we define a function which matches head | tail, and it does a recursive call to itself with its tail. or it matches an empty list where length is 0.





<b><i>NOTE:</b></i> elixir has some crazy string representations. the double quote and single quote representations. In double quote notation, the string is stored in contiguous memory locations . but single quote strings are stored as lists with values. So <code>[ 99, 97, 116]</code> actually is a representation of 'cat'



Square a list, and add one to a list are in the [recursive_lists.exs](./recursive_lists.exs) file

<h3>Creating a map</h3>

If we look at all the recursive functions, we can see that it follows a pattern, where if an empty list is present do nothing. All other logic is written in the second part of the function. where something is done to the head and the tail is called. We are going to generalise the definition and write a map function which takes another function and a list and returns a new list with the function performed.

Now if we call Mylist.map([1,2,3,4], &(&1*&1))
Now if we call Mylist.map([1,2,3,4], fn n -> n*n end)  this is just a different method of defining nameless functions.


its the same as the square function we wrote earlier.






<h3>Creating a reduce function</h3>

If we want to keep track of a variable during a recursive function, we cannot keep it in the global namespace or the function namespace( purity. ) so we pass in the variable as another function parameter.

so we return the value of sum if list is empty or we return the sum plus the current value.


IN order to match any number in the second place we can rewrite the function so that it takes a parameter and the parameter also matches the second value.


in order to generalise this funciton we can create a reduce function which takes a list, a function and an initial value, as its parameters and applies the function to every element in the list and returns the final value.

( try to create a filter function )



<h3>Complex list patterns</h3>

Lists can match complex patterns other than just a single head and tail element. the | operator supports multiple elements to its left . ( like [ 1, 2, 3 | [ 5, 6, 7 ] ]). same works in pattern matching too.


List matching is recursive and lists of lists can be matched



<h3>Some list operations</h3>

- List.flatten()  # flattens the list (removes recursion)

<code>List.flatten([[[1], 2], [[3]]]) -> [1, 2, 3]</code>

- List.foldl() -> like reduce but can be given a direction foldl or foldr.  takes in three arguments, the iterable, accumulator, and a function.

- List.zip -> matches number of elements and merges Lists

<code>List.zip([1,2,3],[:a,:b,:c],["cat","dog"])</code><br>
<code>[{1, :a, "cat"}, {2, :b, "dog"}]</code>

- List.unzip(listname) -> unzips the zipped values.

- List.keyfind() -> used to find key value pairs in tuple lists. It takes in four parameters the iterable, the key, its position in the tuple, default statement to be returned.



<!--  -->
