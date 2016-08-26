defmodule Adapt do
  use Application
  @moduledoc """
    Adapt is an application for natural language parser to deduce intent from a string. It uses the [Adapt] python project.

    Since it uses the adapt python module, it requires that python and adapt are both installed locally. Please follow the instructions on the [Adapt] site for instructions.

    [Adapt]: https://adapt.mycroft.ai/
  """

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
    ]

    opts = [strategy: :one_for_one, name: Adapt.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
