# Use the Plot struct as it is provided
defmodule Plot do
  @enforce_keys [:plot_id, :registered_to]
  defstruct [:plot_id, :registered_to]
end

defmodule CommunityGarden do
  def start() do
    # Please implement the start/1 function
    Agent.start(fn -> %{last_id: 0, registry: []} end)
  end

  def list_registrations(pid) do
    # Please implement the list_registrations/1 function
    Agent.get(pid, fn state -> state.registry end)
  end

  def register(pid, register_to) do
    # Please implement the register/2 function
    Agent.get_and_update(
      pid,
      fn state ->
        %{last_id: last_id, registry: registry} = state
        last_id_ = last_id + 1
        new_plot = %Plot{plot_id: last_id_, registered_to: register_to}
        registry_ = [new_plot | registry]
        {new_plot, %{state | last_id: last_id_, registry: registry_}}
      end
    )
  end

  def release(pid, plot_id) do
    # Please implement the release/2 function
    Agent.update(
      pid,
      fn state ->
        %{registry: registry} = state
        registry_ = Enum.filter(registry, fn plot -> plot.plot_id != plot_id end)
        %{state | registry: registry_}
      end
    )
  end

  def get_registration(pid, plot_id) do
    # Please implement the get_registration/2 function
    registry = Agent.get(pid, fn state -> state.registry end)

    Enum.find(
      registry,
      {:not_found, "plot is unregistered"},
      fn plot -> plot.plot_id == plot_id end
    )
  end
end
