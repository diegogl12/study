defmodule ProcFile do

  alias FileManager
  def start_link do
    spawn_link fn ->  loop end
  end
  
  defp loop do
    receive do
      {:read,file,caller} ->
      readed= FileManager.read(file)
        send caller, readed
        loop
      {:write,file,content,caller} ->
        {file, bool} = FileManager.write(file,content)
        send caller, "Write in #{file}: #{bool}"
        loop
      {type, message} ->
        IO.inspect type
        IO.inspect message
    end
  end
end
