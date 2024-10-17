defmodule FileManager do

  def read(file) do
    case File.read(file) do
      {:ok, body} -> body
      {:error, reason} -> "ERROR: File doesn't exists"

    end
  end

  def write(file, content) do
    File.write(file, content)
    {file, File.exists?(file)}
  end

end
