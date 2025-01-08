defmodule LibraryFees do
  def datetime_from_string(string) do
    # Please implement the datetime_from_string/1 function
    {:ok, datetime} = NaiveDateTime.from_iso8601(string)
    datetime
  end

  def before_noon?(datetime) do
    # Please implement the before_noon?/1 function
    hour = datetime.hour
    hour < 12
  end

  def return_date(checkout_datetime) do
    # Please implement the return_date/1 function
    date = NaiveDateTime.to_date(checkout_datetime)

    if before_noon?(checkout_datetime) do
      Date.add(date, 28)
    else
      Date.add(date, 29)
    end
  end

  def days_late(planned_return_date, actual_return_datetime) do
    # Please implement the days_late/2 function
    actual_return_date = NaiveDateTime.to_date(actual_return_datetime)
    IO.inspect(planned_return_date, label: "planned")
    IO.inspect(actual_return_date, label: "actual")

    case Date.compare(actual_return_date, planned_return_date) do
      :gt -> Date.diff(actual_return_date, planned_return_date)
      _ -> 0
    end
  end

  def monday?(datetime) do
    # Please implement the monday?/1 function
    datetime
    |> NaiveDateTime.to_date()
    |> Date.day_of_week()
    |> Kernel.==(1)
  end

  def calculate_late_fee(checkout, return, rate) do
    # Please implement the calculate_late_fee/3 function

    planned_return = return_date(datetime_from_string(checkout))
    days_late = days_late(planned_return, datetime_from_string(return))

    if monday?(datetime_from_string(return)) do
      days_late
      |> Kernel.*(rate)
      |> Kernel.*(0.5)
      |> floor()
    else
      days_late
      |> Kernel.*(rate)
    end
  end
end
