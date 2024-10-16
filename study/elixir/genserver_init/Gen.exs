defmodule Gen do
  use GenServer

  def start_link() do
    GenServer.start_link(__MODULE__,[])
  end

  def init(_) do
    {:ok,[]}
  end

  def handle_call(:get_data, _, state) do
    {:reply, state, state}
  end

  def handle_cast(:increment, state) do
    {:noreply,add_list()}
  end

  defp add_list(list,value) do
    [value | list]
  end
end
