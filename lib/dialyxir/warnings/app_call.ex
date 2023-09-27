defmodule DialyxirVendored.Warnings.AppCall do
  @behaviour DialyxirVendored.Warning

  @impl DialyxirVendored.Warning
  @spec warning() :: :app_call
  def warning(), do: :app_call

  @impl DialyxirVendored.Warning
  @spec format_short([String.t()]) :: String.t()
  def format_short([_module, function | _]) do
    "Module or function to apply is not an atom in #{function}."
  end

  @impl DialyxirVendored.Warning
  @spec format_long([String.t()]) :: String.t()
  def format_long([module, function, arity, culprit, expected_type, actual_type]) do
    pretty_module = ErlexVendored.pretty_print(module)
    pretty_expected_type = ErlexVendored.pretty_print_type(expected_type)
    pretty_actual_type = ErlexVendored.pretty_print_type(actual_type)

    "The call #{pretty_module}.#{function}/#{arity} requires that " <>
      "#{culprit} is of type #{pretty_expected_type}, not #{pretty_actual_type}."
  end

  @impl DialyxirVendored.Warning
  @spec explain() :: String.t()
  def explain() do
    DialyxirVendored.Warning.default_explain()
  end
end
