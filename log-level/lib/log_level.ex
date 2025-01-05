defmodule LogLevel do
  def to_label(level, legacy?) do
    # Please implement the to_label/2 function
    cond do
      (level == 0) and (not legacy?) -> :trace
      level == 1 -> :debug
      level == 2 -> :info
      level == 3 -> :warning
      level == 4 -> :error
      (level == 5) and (not legacy?) -> :fatal
      true -> :unknown
    end
  end

  def alert_recipient(level, legacy?) do
    # Please implement the alert_recipient/2 function
    label = to_label(level, legacy?)
    is_log_label? = fn guess -> label == guess end
    cond do
      is_log_label?.(:error) or is_log_label?.(:fatal) -> :ops
      is_log_label?.(:unknown) and legacy? -> :dev1
      is_log_label?.(:unknown) and (not legacy?) -> :dev2
      true -> false
    end
  end
end
