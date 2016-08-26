defmodule Adapt.Model.RegexEntity do
  @type t :: %Adapt.Model.RegexEntity{type: String.t, pattern: String.t}
  defstruct type: "regex", pattern: ""
end
