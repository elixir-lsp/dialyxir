defmodule DialyxirVendored.Warnings.CallbackInfoMissing do
  @moduledoc """
  The module is using a behaviour that does not exist or is not a
  behaviour. This is also a compiler warning.

  ## Example

      defmodule Example do
        @behaviour BehaviourThatDoesNotExist

        def ok() do
          :ok
        end
      end
  """

  @behaviour DialyxirVendored.Warning

  @impl DialyxirVendored.Warning
  @spec warning() :: :callback_info_missing
  def warning(), do: :callback_info_missing

  @impl DialyxirVendored.Warning
  @spec format_short([String.t()]) :: String.t()
  def format_short(args), do: format_long(args)

  @impl DialyxirVendored.Warning
  @spec format_long([String.t()]) :: String.t()
  def format_long([behaviour]) do
    pretty_behaviour = ErlexVendored.pretty_print(behaviour)

    "Callback info about the #{pretty_behaviour} behaviour is not available."
  end

  @impl DialyxirVendored.Warning
  @spec explain() :: String.t()
  def explain() do
    @moduledoc
  end
end
