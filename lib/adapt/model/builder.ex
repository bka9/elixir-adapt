defmodule Adapt.Model.Builder do
  @type t :: %Adapt.Model.Builder{entities: maybe_improper_list(Adapt.Model.Entity.t,Adapt.Model.RegexEntity.t), intents: list(Adapt.Model.Intent)}
  defstruct entities: [], intents: []
end
