defmodule RemoteControlCar do
  # Please implement the struct with the specified fields
  @enforce_keys [:nickname]
  defstruct [
  :nickname,
  battery_percentage: 100,
  distance_driven_in_meters: 0,
  ]

  def new() do
    # Please implement the new/0 function
    %RemoteControlCar{nickname: "none"}
  end

  def new(nickname) do
    # Please implement the new/1 function
    %RemoteControlCar{nickname: nickname}
  end

  def display_distance(remote_car)
  def display_distance(%RemoteControlCar{
    nickname: _,
    battery_percentage: _,
    distance_driven_in_meters: d,
  }) do
    # Please implement the display_distance/1 function
    "#{d} meters"
  end

  def display_battery(remote_car)
  def display_battery(%RemoteControlCar{
    nickname: _,
    battery_percentage: 0,
    distance_driven_in_meters: _,
  }) do
    # Please implement the display_battery/1 function
    "Battery empty"
  end
  def display_battery(%RemoteControlCar{
    nickname: _,
    battery_percentage: b,
    distance_driven_in_meters: _,
  }) do
    # Please implement the display_battery/1 function
    "Battery at #{b}%"
  end

  def drive(remote_car)
  def drive(%RemoteControlCar{
    nickname: _,
    battery_percentage: b,
    distance_driven_in_meters: d,
  } = car) when b > 0 do
    # Please implement the drive/1 function
    %{
    car |
    battery_percentage: b - 1,
    distance_driven_in_meters: d + 20,
  }
  end
  def drive(%RemoteControlCar{
    nickname: _,
    battery_percentage: _,
    distance_driven_in_meters: _,
  } = car) do
    # Please implement the drive/1 function
    car
  end
end
