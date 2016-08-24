defmodule Adapt.Engine do
  alias Porcelain.Process, as: Proc
  alias Porcelain.Result

  def start(options) do
    command = "python " <> Path.join(:code.priv_dir(:adapt), "worker.py") <> " '" <> Poison.encode!(options) <> "'\r\n"
    port = Porcelain.spawn_shell(command, in: :receive, out: {:send, self()})
    {:ok, port}
  end
  def query(text, {:ok, %Proc{pid: pid} = port}) do
    search = "#{Poison.encode! %{input: text}}\r\n"
    Proc.send_input(port, search)
    receive do
      {^pid, :data, :out, data} -> Poison.decode! data
    end
  end
end
