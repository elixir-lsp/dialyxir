defmodule DialyxirVendored.Warnings.GuardFail do
  @moduledoc """
  The function guard either presents an impossible guard or the only
  calls will never succeed against the guards.

  ## Example

      defmodule Example do
        def ok() do
          ok(0)
        end

        defp ok(n) when n > 1 do
          :ok
        end
      end

    or

      defmodule Example do
        def ok() when 0 > 1 do
          :ok
        end
      end
  """

  @behaviour DialyxirVendored.Warning

  @impl DialyxirVendored.Warning
  @spec warning() :: :guard_fail
  def warning(), do: :guard_fail

  @impl DialyxirVendored.Warning
  @spec format_short([String.t()]) :: String.t()
  def format_short(_) do
    "The guard clause can never succeed."
  end

  @impl DialyxirVendored.Warning
  @spec format_long([String.t()]) :: String.t()
  def format_long([]) do
    "The guard clause can never succeed."
  end

  def format_long([guard, args]) do
    pretty_args = ErlexVendored.pretty_print_args(args)

    """
    The guard test:

    #{guard}#{pretty_args}

    can never succeed.
    """
  end

  def format_long([arg, infix, guard]) do
    pretty_arg = ErlexVendored.pretty_print_args(arg)
    pretty_infix = ErlexVendored.pretty_print_infix(infix)
    pretty_guard = ErlexVendored.pretty_print(guard)

    """
    The guard clause:

    when #{pretty_arg} #{pretty_infix} #{pretty_guard}

    can never succeed.
    """
  end

  @impl DialyxirVendored.Warning
  @spec explain() :: String.t()
  def explain() do
    @moduledoc
  end
end
