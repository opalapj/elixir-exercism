defmodule RPNCalculatorInspection do
  def start_reliability_check(calculator, input) do
    # Please implement the start_reliability_check/2 function
    pid = spawn_link(fn -> calculator.(input) end)
    %{input: input, pid: pid}
  end

  def await_reliability_check_result(%{pid: pid, input: input}, results) do
    # Please implement the await_reliability_check_result/2 function
    flag =
      receive do
        {:EXIT, ^pid, :normal} -> :ok
        {:EXIT, ^pid, _reason} -> :error
      after
        100 -> :timeout
      end

    Map.put(results, input, flag)
  end

  def reliability_check(calculator, inputs) do
    # Please implement the reliability_check/2 function
    init_flag = Process.flag(:trap_exit, true)

    results =
      inputs
      |> Enum.map(&start_reliability_check(calculator, &1))
      |> Enum.reduce(%{}, &await_reliability_check_result/2)

    Process.flag(:trap_exit, init_flag)
    results
  end

  def correctness_check(calculator, inputs) do
    # Please implement the correctness_check/2 function
    inputs
    |> Enum.map(&Task.async(fn -> calculator.(&1) end))
    |> Enum.map(&Task.await(&1, 100))
  end
end
