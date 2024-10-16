defmodule KV.EventStore do
  use GenServer

  alias KV.Domains.Events
  alias KV.Domains.Events.Event

  # ==============================================================================
  # public api
  # ==============================================================================

  def start_link(options) do
    name = Keyword.get(options, :name, __MODULE__)
    timer = Keyword.get(options, :timer, 10000)

    GenServer.start_link(__MODULE__, timer, name: name)
  end

  def get(name \\ __MODULE__) do
    GenServer.call(name, :get)
  end

  def push(name \\ __MODULE__, %{} = event) do
    GenServer.cast(name, {:push, event})
  end

  # ==============================================================================
  # callbacks
  # ==============================================================================

  @impl true
  def init(timer) do
    new_state = %{timer: timer, events: []}

    Process.send_after(self(), :update, timer)
    {:ok, new_state}
  end

  @impl true
  def handle_info(:update, state) do
    Enum.each(state.events, &Events.create(&1))

    new_state = %{timer: state.timer, events: []}

    if Enum.count(state.events) > 0,
      do: IO.inspect("#{inspect(Time.utc_now() |> Time.to_string)} [EVENTS REGISTERED] #{Enum.count(state.events)} events registered!")

    Process.send_after(self(), :update, state.timer)
    {:noreply, new_state}
  end

  @impl true
  def handle_call(:get, _from, state), do: {:reply, {:ok, state.events}, state}

  @impl true
  def handle_cast({:push, event}, state) do
    new_state = %{timer: state.timer, events: state.events ++ [event]}

    IO.inspect("#{inspect(Time.utc_now() |> Time.to_string)} [NEW EVENT] New event pushed! \nEvent: #{inspect(event)}")

    {:noreply, new_state}
  end
end
