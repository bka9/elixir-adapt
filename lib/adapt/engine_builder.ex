defmodule Adapt.EngineBuilder do
  defstruct entities: [], intents: []

  defmodule Entity do
    defstruct name: "", values: []
  end
  defmodule RegexEntity do
    defstruct pattern: ""
  end
  defmodule Intent do
    defstruct name: "", requirements: [], optionals: []
  end

  alias Adapt.EngineBuilder.Entity, as: Entity
  alias Adapt.EngineBuilder.RegexEntity, as: RegexEntity
  alias Adapt.EngineBuilder.Intent, as: Intent

  def build(%Adapt.EngineBuilder{entities: entities, intents: intents}) do
    Adapt.Engine.start(%{entities: Enum.map(entities, fn(entity) -> encode(entity) end), intents: intents})
  end

  def intent(name), do: %Intent{name: name}

  def entity(name, values), do: %Entity{name: name, values: values}

  def regex(pattern), do: %RegexEntity{pattern: pattern}

  def require(%Intent{name: name, requirements: requirements, optionals: optionals}, e, attribute \\ ""), do: %Intent{name: name, requirements: requirements ++ %{entity: e, attribute: if attribute == "" do e else attribute end}, optionals: optionals}

  def optional(%Intent{name: name, requirements: requirements, optionals: optionals}, e, attribute \\ ""), do: %Intent{name: name,requirements: requirements, optionals: optionals ++ %{entity: e, attribute: if attribute == "" do e else attribute end}}

  def encode(%Entity{name: name, values: values}), do: %{type: "string", name: name, values: values}
  def encode(%RegexEntity{pattern: pattern}), do: %{type: "regex", pattern: pattern}

end
