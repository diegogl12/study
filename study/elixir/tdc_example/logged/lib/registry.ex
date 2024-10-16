defmodule Logged.Registry do
  use GenServer

  # ==============================================================================
  # Public Api
  # ==============================================================================

  def start_link(opts \\ []) do
    name = Keyword.get(opts, :name, __MODULE__)

    GenServer.start_link(__MODULE__, :ok, name: name)
  end

  def login(server \\ __MODULE__, user_id) do
    GenServer.call(server, {:login, user_id})
  end

  def is_logged?(server \\ __MODULE__, user_id) do
    GenServer.call(server, {:is_logged, user_id})
  end

  def get_list(server \\ __MODULE__) do
    GenServer.call(server, {:get_list})
  end

  # ==============================================================================
  # Server
  # ==============================================================================

  @impl true
  def init(:ok) do
    {:ok, %{}}
  end

  @impl true
  def handle_call({:is_logged, user_id}, _from, state) do
    logged_status =
      state
      |> Map.get(user_id)
      |> logged_status()

    {:reply, {user_id, logged_status}, state}
  end

  @impl true
  def handle_call({:login, user_id}, _from, state) do
    new_state = Map.put(state, user_id, %{online: true})

    {:reply, {user_id, :online}, new_state}
  end

  @impl true
  def handle_call({:get_list}, _from, state) do
    {:reply, state, state}
  end

  @impl true
  def handle_call({:logout, user_id}, _from, state) do
    new_state = Map.put(state, user_id, %{online: false})

    {:reply, {user_id, :offline}, new_state}
  end

  def handle_info({:logout, user_id}, state) do
    new_state = Map.put(state, user_id, %{online: false})

    {:noreply, new_state}
  end

  def handle_info({:login, user_id}, state) do
    new_state = Map.put(state, user_id, %{online: true})

    {:noreply, new_state}
  end

  defp logged_status(%{online: true}), do: :online
  defp logged_status(_), do: :offline
end
