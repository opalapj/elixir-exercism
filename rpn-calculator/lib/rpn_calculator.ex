defmodule RPNCalculator do
  def calculate!(stack, operation) do
    # Please implement the calculate!/2 function
    operation.(stack)
  end

  def calculate(stack, operation) do
    # Please implement the calculate/2 function
    try do
      {:ok, operation.(stack)}
    rescue
      _ ->
        :error
        #      e -> {:error, e.message}
    end
  end

  def calculate_verbose(stack, operation) do
    # Please implement the calculate_verbose/2 function
    try do
      {:ok, operation.(stack)}
    rescue
      e in ArgumentError -> {:error, e.message}
    end
  end
end
