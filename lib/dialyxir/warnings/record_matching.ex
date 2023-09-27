defmodule DialyxirVendored.Warnings.RecordMatching do
  @behaviour DialyxirVendored.Warning

  @impl DialyxirVendored.Warning
  @spec warning() :: :record_matching
  def warning(), do: :record_matching

  @impl DialyxirVendored.Warning
  @spec format_short([String.t()]) :: String.t()
  def format_short(args), do: format_long(args)

  @impl DialyxirVendored.Warning
  @spec format_long([String.t()]) :: String.t()
  def format_long([string, name]) do
    "The #{string} violates the declared type for ##{name}{}."
  end

  @impl DialyxirVendored.Warning
  @spec explain() :: String.t()
  def explain() do
    DialyxirVendored.Warning.default_explain()
  end
end
