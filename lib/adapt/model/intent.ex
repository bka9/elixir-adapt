defmodule Adapt.Model.Intent do
  @type t :: %Adapt.Model.Intent{name: String.t, requirements: list(map), optionals: list(map)}
  defstruct name: "", requirements: [], optionals: []
end
