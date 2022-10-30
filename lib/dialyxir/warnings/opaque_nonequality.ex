defmodule DialyxirVendored.Warnings.OpaqueNonequality do
  @behaviour DialyxirVendored.Warning

  @impl DialyxirVendored.Warning
  @spec warning() :: :opaque_neq
  def warning(), do: :opaque_neq

  @impl DialyxirVendored.Warning
  @spec format_short([String.t()]) :: String.t()
  def format_short([type, _op, opaque_type]) do
    "Attempted to test for inequality between #{type} and opaque type #{opaque_type}."
  end

  @impl DialyxirVendored.Warning
  @spec format_long([String.t()]) :: String.t()
  def format_long([type, _op, opaque_type]) do
    "Attempt to test for inequality between a term of type #{type} " <>
      "and a term of opaque type #{opaque_type}."
  end

  @impl DialyxirVendored.Warning
  @spec explain() :: String.t()
  def explain() do
    DialyxirVendored.Warning.default_explain()
  end
end
