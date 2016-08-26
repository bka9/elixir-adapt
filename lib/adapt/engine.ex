defmodule Adapt.Engine do
  @moduledoc """
    Adapt.Engine is the power of intent parsing.

    It should be noted that thanks goes to [AdaptJS] for the inspiration of how the engine definition is used with conjuction with the [Adapt] library.

    [AdaptJS]: https://github.com/hinzundcode/adaptjs
    [Adapt]: https://adapt.mycroft.ai/
  """

  @doc """
    Query with the give text and engine definition to retrieve the intents found.

    The method returns `{:ok, %{"intents": [...]}}` if successful, and `{:error, error_message}` if it encounters any problems.
  """
  @spec query(String.t, Adapt.Model.Builder.t) :: {atom, any}
  def query(text, options) do
    case Porcelain.exec("python",[Path.join(:code.priv_dir(:adapt), "worker.py"), Poison.encode!(options), Poison.encode!(%{input: text})]) do
      %Porcelain.Result{err: nil, out: result} -> {:ok, Poison.decode! result}
      %Porcelain.Result{err: error, out: _out} -> {:error, error}
    end
  end
end
