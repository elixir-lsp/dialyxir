defmodule DialyxirVendored.Warnings.UnusedFunction do
  @moduledoc """
  Due to issues higher in the function or call stack, while the
  function is recognized as used by the compiler, it will never be
  recognized as having been called until the other error is resolved.

  ## Example

      defmodule Example do
        def ok() do
          raise "error"

          unused()
        end

        defp unused(), do: :ok
      end
  """

  @behaviour DialyxirVendored.Warning

  @impl DialyxirVendored.Warning
  @spec warning() :: :unused_fun
  def warning(), do: :unused_fun

  @impl DialyxirVendored.Warning
  @spec format_short([String.t()]) :: String.t()
  def format_short(args), do: format_long(args)

  @impl DialyxirVendored.Warning
  @spec format_long([String.t()]) :: String.t()
  def format_long([function, arity]) do
    "Function #{function}/#{arity} will never be called."
  end

  @impl DialyxirVendored.Warning
  @spec explain() :: String.t()
  def explain() do
    @moduledoc
  end
end
