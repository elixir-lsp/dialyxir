defmodule DialyxirVendored.Warnings.UnknownBehaviour do
  @behaviour DialyxirVendored.Warning

  @impl DialyxirVendored.Warning
  @spec warning() :: :unknown_behaviour
  def warning(), do: :unknown_behaviour

  @impl DialyxirVendored.Warning
  @spec format_short(String.t()) :: String.t()
  def format_short(args), do: format_long(args)

  @impl DialyxirVendored.Warning
  @spec format_long(String.t()) :: String.t()
  def format_long(behaviour) do
    pretty_module = ErlexVendored.pretty_print(behaviour)

    "Unknown behaviour: #{pretty_module}."
  end

  @impl DialyxirVendored.Warning
  @spec explain() :: String.t()
  def explain() do
    DialyxirVendored.Warning.default_explain()
  end
end
