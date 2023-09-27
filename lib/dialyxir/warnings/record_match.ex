defmodule DialyxirVendored.Warnings.RecordMatch do
  @behaviour DialyxirVendored.Warning

  @impl DialyxirVendored.Warning
  @spec warning() :: :record_match
  def warning(), do: :record_match

  @impl DialyxirVendored.Warning
  @spec format_short([String.t()]) :: String.t()
  defdelegate format_short(args), to: DialyxirVendored.Warnings.RecordMatching

  @impl DialyxirVendored.Warning
  defdelegate format_long(args), to: DialyxirVendored.Warnings.RecordMatching

  @impl DialyxirVendored.Warning
  defdelegate explain(), to: DialyxirVendored.Warnings.RecordMatching
end
