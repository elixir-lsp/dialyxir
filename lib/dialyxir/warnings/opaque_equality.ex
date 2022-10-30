defmodule DialyxirVendored.Warnings.OpaqueEquality do
  @behaviour DialyxirVendored.Warning

  @impl DialyxirVendored.Warning
  @spec warning() :: :opaque_eq
  def warning(), do: :opaque_eq

  @impl DialyxirVendored.Warning
  @spec format_short([String.t()]) :: String.t()
  def format_short([_type, _op, opaque_type]) do
    pretty_opaque_type = opaque_type |> Erlex.pretty_print() |> unqualify_module()
    "Attempt to test for equality with an opaque type #{pretty_opaque_type}."
  end

  defp unqualify_module(name) when is_binary(name) do
    case String.split(name, ".") do
      [only] ->
        only

      multiple ->
        multiple
        |> Enum.take(-2)
        |> Enum.join(".")
    end
  end

  @impl DialyxirVendored.Warning
  @spec format_long([String.t()]) :: String.t()
  def format_long([type, _op, opaque_type]) do
    pretty_opaque_type = Erlex.pretty_print_type(opaque_type)

    "Attempt to test for equality between a term of type #{type} " <>
      "and a term of opaque type #{pretty_opaque_type}."
  end

  @impl DialyxirVendored.Warning
  @spec explain() :: String.t()
  def explain() do
    DialyxirVendored.Warning.default_explain()
  end
end
