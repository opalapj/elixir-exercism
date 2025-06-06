defmodule RPNCalculator.Exception do
  # Please implement DivisionByZeroError here.
  defmodule DivisionByZeroError do
    defexception [message: "division by zero occurred"]
  end

  # Please implement StackUnderflowError here.
  defmodule StackUnderflowError do
    @message "stack underflow occurred"

    defexception [message: @message]

    @impl true
    def exception(value) do
      case value do
        [] -> %StackUnderflowError{}
        _ -> %StackUnderflowError{message: "#{@message}, context: #{value}"}
      end
    end
  end

  def divide(stack)
  def divide([]), do: raise(StackUnderflowError, "when dividing")
  def divide([_]), do: raise(StackUnderflowError, "when dividing")
  def divide([0, _]), do: raise(DivisionByZeroError)
  def divide([divisor, dividend]), do: dividend / divisor
end
