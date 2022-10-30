defmodule DialyxirVendored.Warnings.OpaqueGuard do
  @behaviour DialyxirVendored.Warning

  @impl DialyxirVendored.Warning
  @spec warning() :: :opaque_guard
  def warning(), do: :opaque_guard

  @impl DialyxirVendored.Warning
  @spec format_short([String.t()]) :: String.t()
  def format_short([guard | _]) do
    "The guard test #{guard} breaks the opaqueness of its argument."
  end

  @impl DialyxirVendored.Warning
  @spec format_long([String.t()]) :: String.t()
  def format_long([guard, args]) do
    "The guard test #{guard}#{args} breaks the opaqueness of its argument."
  end

  @impl DialyxirVendored.Warning
  @spec explain() :: String.t()
  def explain() do
    DialyxirVendored.Warning.default_explain()
  end
end
