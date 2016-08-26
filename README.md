# Adapt

An application that wraps the functionality of [Adapt](https://adapt.mycroft.ai/).

In a nutshell, this is a way to extract intent from natural language. These intents are represented in a machine readable format, allowing the application to act on the intentions of the user.

A big thanks goes to [AdaptJS](https://github.com/hinzundcode/adaptjs) for the inspiration on how to implement this wrapper.

## Installation

To use this application make sure you follow the [installation](https://adapt.mycroft.ai/start/installation) guide for Adapt.

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add `adapt` to your list of dependencies in `mix.exs`:

    ```elixir
    def deps do
      [{:adapt, "~> 0.1.0"}]
    end
    ```

  2. Ensure `adapt` is started before your application:

    ```elixir
    def application do
      [applications: [:adapt]]
    end
    ```

