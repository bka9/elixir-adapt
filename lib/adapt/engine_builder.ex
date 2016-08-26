defmodule Adapt.EngineBuilder do
  @moduledoc """
    Adapt.EngineBuilder is a module that provides methods to create the rules by which intents will be drawn from the text passed to the engine.
  """
  alias Adapt.Model.Builder, as: Builder
  alias Adapt.Model.Entity, as: Entity
  alias Adapt.Model.RegexEntity, as: RegexEntity
  alias Adapt.Model.Intent, as: Intent


  @doc """
    Adds an intent to the engine declaration.

    Returns `Adapt.Model.Builder`
  """
  @spec intent(Intent.t, Builder.t) :: Builder.t
  def intent(it, %Builder{entities: entities, intents: intents}), do: %Builder{entities: entities, intents: intents ++ [it]}

  @doc """
    Creates a string entity and adds it to the engine declaration.

    Returns `Adapt.Model.Builder`
  """
  @spec entity(String.t, list(String.t), Builder.t) :: Builder.t
  def entity(name, values, %Builder{entities: entities, intents: intents}), do: %Builder{entities: entities ++ [%Entity{name: name, values: values}], intents: intents}

  @doc """
    Creates a regex entity and adds it to the engine declaration.
  """
  @spec regex(String.t, Builder.t) :: Builder.t
  def regex(pattern, %Builder{entities: entities, intents: intents}), do: %Builder{entities: entities ++ [%RegexEntity{pattern: pattern}], intents: intents}

  @doc """
    Creates a required intent and adds it to the engine declaration.
  """
  @spec required(Intent.t, String.t, String.t) :: Intent.t
  def required(%Intent{name: name, requirements: requirements, optionals: optionals}, e, attribute \\ ""), do: %Intent{name: name, requirements: requirements ++ [%{entity: e, attribute: if attribute == "" do e else attribute end}], optionals: optionals}

  @doc """
    Creats an optional intent and adds it to the engine declaration.
  """
  @spec optional(Intent.t, String.t, String.t) :: Intent.t
  def optional(%Intent{name: name, requirements: requirements, optionals: optionals}, e, attribute \\ ""), do: %Intent{name: name,requirements: requirements, optionals: optionals ++ [%{entity: e, attribute: if attribute == "" do e else attribute end}]}

end
