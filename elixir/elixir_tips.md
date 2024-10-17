# Elixir Tips

### Compiling a single file

The file must be an `.ex` extension.
To compile it, is just use `elixirc <file_name>.ex` command. It will create a `Elixir.<file_name>.beam` file that can be interpreted by `iex` command.

### Script mode

An script mode file has an `.exs` extension.

If the elixir code bellow is saved as a script. You can compile it in the memory.
```
defmodule Math do
  def sum(a, b) do
    a + b
  end
end

IO.puts Math.sum(1, 2)
```
To compile a elixir script mode file, just use `Eelixir <file_name>.exs` comand.
For the example, the output would be "3".

### Project

A elixir project generally is structured by three files:
- ebin - contains the compiled bytecode
- lib - contains elixir code (usually `.ex` files)
- test - contains tests (usually `.exs` files)

### Defining Functions

To define a Elixir function inside a module, just use `def`. It defines a public function.
Example:
```
def sum(a, b) do
    do_sum(a, b)
  end
```

and for a private function, just use `defp`. Private functions can only be called locally, in the module.

Function declaration supports multiple clauses and guards. Elixir will aways try to find the clause that matches.
Example:
```
def zero?(0) do
  true
end

def zero?(x) when is_integer(x) do
  false
end
```

- ###### Default Arguments

You can also define default arguments to your elixir function.
Example:
```
def join(a, b, sep \\ " ") do
  a <> sep <> b
end
```
In the case above, the `sep` argument receives the " " as a default value.

- ###### Function Head

It defines a head for your function. It's very useful to filter the arguments value before search for the apropriate function instance.
Example:
```
def join(a, b \\ nil, sep \\ " ")

  def join(a, b, _sep) when is_nil(b) do
    a
  end

  def join(a, b, sep) do
    a <> sep <> b
  end
```
