defmodule DialyxirVendored.Warnings.ContractSupertype do
  @moduledoc """
  The @spec, while not incorrect, is more general than the type
  returned by the function.

  ## Example

      defmodule Example do
        @spec ok() :: any
        def ok() do
          :ok
        end
      end
  """

  @behaviour DialyxirVendored.Warning

  @impl DialyxirVendored.Warning
  @spec warning() :: :contract_supertype
  def warning(), do: :contract_supertype

  @impl DialyxirVendored.Warning
  @spec format_short([String.t()]) :: String.t()
  def format_short([_module, function | _]) do
    "Type specification for #{function} is a supertype of the success typing."
  end

  @impl DialyxirVendored.Warning
  @spec format_long([String.t()]) :: String.t()
  def format_long([module, function, arity, contract, signature]) do
    pretty_module = ErlexVendored.pretty_print(module)
    pretty_contract = ErlexVendored.pretty_print_contract(contract)
    pretty_signature = ErlexVendored.pretty_print_contract(signature)

    """
    Type specification is a supertype of the success typing.

    Function:
    #{pretty_module}.#{function}/#{arity}

    Type specification:
    @spec #{function}#{pretty_contract}

    Success typing:
    @spec #{function}#{pretty_signature}
    """
  end

  @impl DialyxirVendored.Warning
  @spec explain() :: String.t()
  def explain() do
    @moduledoc
  end
end
