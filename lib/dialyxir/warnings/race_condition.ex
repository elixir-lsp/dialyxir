defmodule Dialyxir.Warnings.RaceCondition do
  @behaviour Dialyxir.Warning

  @impl Dialyxir.Warning
  @spec warning() :: :race_condition
  def warning(), do: :race_condition

  @impl Dialyxir.Warning
  @spec format_short([String.t()]) :: String.t()
  def format_short(args), do: format_long(args)

  @impl Dialyxir.Warning
  @spec format_long([String.t()]) :: String.t()
  def format_long([module, function, args, reason]) do
    pretty_args = Dialyxir.PrettyPrint.pretty_print_args(args)
    pretty_module = Dialyxir.PrettyPrint.pretty_print(module)

    "The call #{pretty_module},#{function}#{pretty_args} #{reason}."
  end

  @impl Dialyxir.Warning
  @spec explain() :: String.t()
  def explain() do
    Dialyxir.Warning.default_explain()
  end
end
