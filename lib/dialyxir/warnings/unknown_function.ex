defmodule DialyxirVendored.Warnings.UnknownFunction do
  @behaviour DialyxirVendored.Warning

  @impl DialyxirVendored.Warning
  @spec warning() :: :unknown_function
  def warning(), do: :unknown_function

  @impl DialyxirVendored.Warning
  @spec format_short({String.t(), String.t(), String.t()}) :: String.t()
  def format_short({module, function, arity}) do
    pretty_module = Erlex.pretty_print(module)
    "Function #{pretty_module}.#{function}/#{arity} does not exist."
  end

  @impl DialyxirVendored.Warning
  @spec format_long({String.t(), String.t(), String.t()}) :: String.t()
  def format_long({module, function, arity}) do
    pretty_module = Erlex.pretty_print(module)
    "Function #{pretty_module}.#{function}/#{arity} does not exist."
  end

  @impl DialyxirVendored.Warning
  @spec explain() :: String.t()
  def explain() do
    DialyxirVendored.Warning.default_explain()
  end
end
