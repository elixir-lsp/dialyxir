defmodule DialyxirVendored.Warnings.ImproperListConstruction do
  @behaviour DialyxirVendored.Warning

  @impl DialyxirVendored.Warning
  @spec warning() :: :improper_list_constr
  def warning(), do: :improper_list_constr

  @impl DialyxirVendored.Warning
  @spec format_short([String.t()]) :: String.t()
  def format_short(args), do: format_long(args)

  @impl DialyxirVendored.Warning
  @spec format_long([String.t()]) :: String.t()
  def format_long([tl_type]) do
    pretty_type = Erlex.pretty_print_type(tl_type)

    "List construction (cons) will produce an improper list, " <>
      "because its second argument is #{pretty_type}."
  end

  @impl DialyxirVendored.Warning
  @spec explain() :: String.t()
  def explain() do
    DialyxirVendored.Warning.default_explain()
  end
end
