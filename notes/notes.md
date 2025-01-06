# Basics

https://exercism.org/tracks/elixir/concepts/basics

- Variables
- Modules
- Named functions
- One-line functions
- Function's arity
- Naming conventions
- Comments

# Anonymous Functions

https://exercism.org/tracks/elixir/concepts/anonymous-functions

# Bit Manipulation

https://exercism.org/tracks/elixir/concepts/bit-manipulation

# Booleans

https://exercism.org/tracks/elixir/concepts/booleans

# Numbers

https://exercism.org/tracks/elixir/concepts/integers  
https://exercism.org/tracks/elixir/concepts/floating-point-numbers

# Atoms

https://exercism.org/tracks/elixir/concepts/atoms

# Cond

https://exercism.org/tracks/elixir/concepts/cond

# Lists

https://exercism.org/tracks/elixir/concepts/lists

# Default arguments, Guards, Multiple Clause Functions

https://exercism.org/tracks/elixir/concepts/default-arguments  
https://exercism.org/tracks/elixir/concepts/guards  
https://exercism.org/tracks/elixir/concepts/multiple-clause-functions

# Tuples

https://exercism.org/tracks/elixir/concepts/tuples

# Pattern Matching

https://exercism.org/tracks/elixir/concepts/pattern-matching

# Pipe Operator

https://exercism.org/tracks/elixir/concepts/pipe-operator

# Strings

https://exercism.org/tracks/elixir/concepts/strings

# Maps

https://exercism.org/tracks/elixir/concepts/maps

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
