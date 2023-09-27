defmodule DialyxirVendored.Warnings.BinaryConstruction do
  @behaviour DialyxirVendored.Warning

  @impl DialyxirVendored.Warning
  @spec warning() :: :bin_construction
  def warning(), do: :bin_construction

  @impl DialyxirVendored.Warning
  @spec format_short([String.t()]) :: String.t()
  def format_short([culprit | _]) do
    "Binary construction with #{culprit} will fail."
  end

  @impl DialyxirVendored.Warning
  @spec format_long([String.t()]) :: String.t()
  def format_long([culprit, size, segment, type]) do
    pretty_type = ErlexVendored.pretty_print_type(type)

    "Binary construction will fail since the #{culprit} field #{size} in " <>
      "segment #{segment} has type #{pretty_type}."
  end

  @impl DialyxirVendored.Warning
  @spec explain() :: String.t()
  def explain() do
    DialyxirVendored.Warning.default_explain()
  end
end
