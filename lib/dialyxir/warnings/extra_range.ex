defmodule DialyxirVendored.Warnings.ExtraRange do
  @moduledoc """
  The @spec says the function returns more types than the function
  actually returns.

  ## Example

      defmodule Example do
        @spec ok() :: :ok | :error
        def ok() do
          :ok
        end
      end
  """

  @behaviour DialyxirVendored.Warning

  @impl DialyxirVendored.Warning
  @spec warning() :: :extra_range
  def warning(), do: :extra_range

  @impl DialyxirVendored.Warning
  @spec format_short([String.t()]) :: String.t()
  def format_short([_module, function | _]) do
    "@spec for #{function} has more types than are returned by the function."
  end

  @impl DialyxirVendored.Warning
  @spec format_long([String.t()]) :: String.t()
  def format_long([module, function, arity, extra_ranges, signature_range]) do
    pretty_module = ErlexVendored.pretty_print(module)
    pretty_extra = ErlexVendored.pretty_print_type(extra_ranges)
    pretty_signature = ErlexVendored.pretty_print_type(signature_range)

    """
    The type specification has too many types for the function.

    Function:
    #{pretty_module}.#{function}/#{arity}

    Extra type:
    #{pretty_extra}

    Success typing:
    #{pretty_signature}
    """
  end

  @impl DialyxirVendored.Warning
  @spec explain() :: String.t()
  def explain() do
    @moduledoc
  end
end
