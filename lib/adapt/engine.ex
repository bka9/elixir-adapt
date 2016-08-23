defmodule Adapt.Engine do
  alias Porcelain.Process, as: Proc
  alias Porcelain.Result

  def start(options) do
    port = Porcelain.spawn_shell("python", in: :receive, out: {:send, self()})
    {:ok, port}
  end
  def query(text, port) do
    Proc.send_input(port, text)
    %Proc{pid: pid} = port
    receive do
      {^pid, :data, :out, data} -> IO.inspect data
    end
  end
end
