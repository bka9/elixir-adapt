defmodule Adapt.Model.Entity do
  @type t :: %Adapt.Model.Entity{type: String.t, name: String.t, values: list(String.t)}
  defstruct type: "string", name: "", values: []
end
