defmodule DialyxirVendored.Warnings.UnknownType do
  @moduledoc """
  Spec references a missing @type.

  ## Example

      defmodule Missing do
      end

      defmodule Example do
        @spec ok(Missing.t()) :: :ok
        def ok(_) do
          :ok
        end
      end
  """

  @behaviour DialyxirVendored.Warning

  @impl DialyxirVendored.Warning
  @spec warning() :: :unknown_type
  def warning(), do: :unknown_type

  @impl DialyxirVendored.Warning
  @spec format_short({String.t(), String.t(), String.t()}) :: String.t()
  def format_short({module, function, arity}) do
    pretty_module = ErlexVendored.pretty_print(module)

    "Unknown type: #{pretty_module}.#{function}/#{arity}."
  end

  @impl DialyxirVendored.Warning
  @spec format_long({String.t(), String.t(), String.t()}) :: String.t()
  def format_long({module, function, arity}) do
    format_short({module, function, arity})
  end

  @impl DialyxirVendored.Warning
  @spec explain() :: String.t()
  def explain() do
    @moduledoc
  end
end
