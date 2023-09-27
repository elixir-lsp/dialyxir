defmodule DialyxirVendored.Warnings.Apply do
  @moduledoc """
  The function being invoked exists, and has the correct arity, but
  will not succeed.

  ## Example

      defmodule Example do
        def ok() do
          fun = fn :ok -> :ok end
          fun.(:error)
        end
      end
  """

  @behaviour DialyxirVendored.Warning

  @impl DialyxirVendored.Warning
  @spec warning() :: :apply
  def warning(), do: :apply

  @impl DialyxirVendored.Warning
  @spec format_short([String.t()]) :: String.t()
  def format_short([args | _]) do
    pretty_args = ErlexVendored.pretty_print_args(args)
    "Function application with args #{pretty_args} will not succeed."
  end

  @impl DialyxirVendored.Warning
  @spec format_long([String.t()]) :: String.t()
  def format_long([args, arg_positions, fail_reason, signature_args, signature_return, contract]) do
    pretty_args = ErlexVendored.pretty_print_args(args)

    call_string =
      DialyxirVendored.WarningHelpers.call_or_apply_to_string(
        arg_positions,
        fail_reason,
        signature_args,
        signature_return,
        contract
      )

    "Function application with arguments #{pretty_args} #{call_string}"
  end

  @impl DialyxirVendored.Warning
  @spec explain() :: String.t()
  def explain() do
    @moduledoc
  end
end
