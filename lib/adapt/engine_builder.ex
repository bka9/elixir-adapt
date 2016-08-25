defmodule Adapt.EngineBuilder do
  alias Adapt.Model.Builder, as: Builder
  alias Adapt.Model.Entity, as: Entity
  alias Adapt.Model.RegexEntity, as: RegexEntity
  alias Adapt.Model.Intent, as: Intent

  def intent(it, %Builder{entities: entities, intents: intents}), do: %Builder{entities: entities, intents: intents ++ [it]}

  def entity(name, values, %Builder{entities: entities, intents: intents}), do: %Builder{entities: entities ++ [%Entity{name: name, values: values}], intents: intents}

  def regex(pattern, %Builder{entities: entities, intents: intents}), do: %Builder{entities: entities ++ [%RegexEntity{pattern: pattern}], intents: intents}

  def required(%Intent{name: name, requirements: requirements, optionals: optionals}, e, attribute \\ ""), do: %Intent{name: name, requirements: requirements ++ [%{entity: e, attribute: if attribute == "" do e else attribute end}], optionals: optionals}

  def optional(%Intent{name: name, requirements: requirements, optionals: optionals}, e, attribute \\ ""), do: %Intent{name: name,requirements: requirements, optionals: optionals ++ [%{entity: e, attribute: if attribute == "" do e else attribute end}]}

  def encode(%Entity{name: name, values: values}), do: %{type: "string", name: name, values: values}
  def encode(%RegexEntity{pattern: pattern}), do: %{type: "regex", pattern: pattern}
  def encode(%Intent{name: name, requirements: requirements, optionals: optionals}), do: %{name: name, requirements: requirements, optionals: optionals}

end
