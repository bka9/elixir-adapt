defmodule Adapt.Engine do
  def query(text, options) do
    case Porcelain.exec("python",[Path.join(:code.priv_dir(:adapt), "worker.py"), Poison.encode!(options), Poison.encode!(%{input: text})]) do
      %Porcelain.Result{err: nil, out: result} -> {:ok, Poison.decode! result}
      %Porcelain.Result{err: error, out: _out} -> {:error, error}
    end
  end
end
