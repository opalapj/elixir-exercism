# Basics

https://exercism.org/tracks/elixir/concepts/basics

- Variables
- Modules
- Named functions
- One-line functions
- Function's arity
- Naming conventions
- Comments

## Named functions and arguments matching

Best practice is to put only name and arguments of function at first and then
next definitions according to various patterns:

```elixir
def filter_by_year(wines, year)
def filter_by_year([], _year), do: ...
def filter_by_year([{_, year, _} = wine | tail], year), do: ...
def filter_by_year([{_, _, _} | tail], year), do: ...
```

Pattern matching in third definition:

```elixir
def filter_by_year([{_, year, _} = wine | tail], year) do
  [wine | filter_by_year(tail, year)]
end
```

not only match first argument but also uses it (`wine`) in local scope.

Another interesting thing is using second argument `year` in pattern matching
for first argument. Local scope is already being created from name and
arguments.

# Anonymous Functions

https://exercism.org/tracks/elixir/concepts/anonymous-functions

# Default arguments, Guards, Multiple Clause Functions

https://exercism.org/tracks/elixir/concepts/default-arguments  
https://exercism.org/tracks/elixir/concepts/guards  
https://exercism.org/tracks/elixir/concepts/multiple-clause-functions

# Pattern Matching

https://exercism.org/tracks/elixir/concepts/pattern-matching

# Recursion

https://exercism.org/tracks/elixir/concepts/recursion
https://exercism.org/tracks/elixir/concepts/tail-call-recursion

# Pipe Operator

https://exercism.org/tracks/elixir/concepts/pipe-operator

# Module Attributes As Constants

https://exercism.org/tracks/elixir/concepts/module-attributes-as-constants

# Docs, Typespecs

https://exercism.org/tracks/elixir/concepts/docs  
https://exercism.org/tracks/elixir/concepts/typespecs

## Short form

Most of the `built-in` types provided in `Erlang` (for example, `pid()`) are
expressed in the same way: `pid()` (or simply `pid`).

## Syntetical notation

Some types can also be declared using their syntactical notation, such as
`[type]` for lists, `{type1, type2, ...}` for tuples and `<<_ * _>>`
for binaries.

## Union type

The notation to represent the union of types is the pipe `|`. For example, the
`typespec type :: atom() | pid() | tuple()` creates a type type that can be
either an `atom`, a `pid`, or a `tuple`.

## Empty collections

Note that the syntactic representation of `map()` is `%{optional(any) => any}`,
not `%{}`. The notation `%{}` specifies the singleton type for the empty `map`.

## Naming arguments

You can also name your arguments in a typespec using `arg_name :: arg_type`
syntax. This is particularly useful in documentation as a way to differentiate
multiple arguments of the same type (or multiple elements of the same type in a
type definition):

```elixir
@spec days_since_epoch(year :: integer, month :: integer, day :: integer) :: integer
@type color :: {red :: integer, green :: integer, blue :: integer}
```

## Display type docs

Use `t/1` function:

```elixir
t(Module)
t(Module.type)
```
# Booleans

https://exercism.org/tracks/elixir/concepts/booleans

# Numbers

https://exercism.org/tracks/elixir/concepts/integers  
https://exercism.org/tracks/elixir/concepts/floating-point-numbers

# Atoms

https://exercism.org/tracks/elixir/concepts/atoms

# Strings

https://exercism.org/tracks/elixir/concepts/strings

# Charlists

https://exercism.org/tracks/elixir/concepts/charlists

# Nil

https://exercism.org/tracks/elixir/concepts/nil

# Tuples

https://exercism.org/tracks/elixir/concepts/tuples

# Lists

https://exercism.org/tracks/elixir/concepts/lists

# Keyword Lists

https://exercism.org/tracks/elixir/concepts/keyword-lists

# Maps

https://exercism.org/tracks/elixir/concepts/maps

# Keyword Lists vs Maps

## Keyword Lists

- keys must be atoms
- keys are ordered, as specified by the developer
- keys can be given more than once
- pattern matching does require the number of items and their order to match
- dynamic-only access:

```elixir
map = [name: "john", age: 42]
# dynamic
map[:name]
```

## Maps

- keys can be any value
- keys have their own internal ordering
- keys can not be given more than once
- pattern matching does not require the number of items and their order to match
- dynamic and static access:

```elixir
map = %{name: "john", age: 42}
# dynamic
map[:name]
# static
map.name
```

## Summary

- use keyword lists for passing optional values to functions
- use maps for general key-value data structures
- use maps when working with data that has a predefined set of keys
- use maps for pattern matching

# Access Behaviour

https://exercism.org/tracks/elixir/concepts/access-behaviour

# Cond

https://exercism.org/tracks/elixir/concepts/cond

# Case

https://exercism.org/tracks/elixir/concepts/case

# If

https://exercism.org/tracks/elixir/concepts/if

In `Elixir`, all datatypes evaluate to a `truthy` or `falsy` value when they are
encountered in a boolean context (like an `if` expression). All data is
considered `truthy` except for `false` and `nil`. In particular, empty strings,
the integer 0, and empty lists are all considered truthy in Elixir.

# IO

https://exercism.org/tracks/elixir/concepts/io

# PIDs, Processes

https://exercism.org/tracks/elixir/concepts/pids  
https://exercism.org/tracks/elixir/concepts/processes

# Bit Manipulation

https://exercism.org/tracks/elixir/concepts/bit-manipulation

# Bitstrings

https://exercism.org/tracks/elixir/concepts/bitstrings

# Regular Expressions

https://exercism.org/tracks/elixir/concepts/regular-expressions

# Dates and Time

https://exercism.org/tracks/elixir/concepts/dates-and-time

# Enum

https://exercism.org/tracks/elixir/concepts/enum

# Structs

https://exercism.org/tracks/elixir/concepts/structs
