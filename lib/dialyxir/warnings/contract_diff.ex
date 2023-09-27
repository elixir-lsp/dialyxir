defmodule DialyxirVendored.Warnings.ContractDiff do
  @behaviour DialyxirVendored.Warning

  @impl DialyxirVendored.Warning
  @spec warning() :: :contract_diff
  def warning(), do: :contract_diff

  @impl DialyxirVendored.Warning
  @spec format_short([String.t()]) :: String.t()
  def format_short([_module, function | _]) do
    "Type specification is not equal to the success typing for #{function}."
  end

  @impl DialyxirVendored.Warning
  @spec format_long([String.t()]) :: String.t()
  def format_long([module, function, arity, contract, signature]) do
    pretty_module = ErlexVendored.pretty_print(module)
    pretty_contract = ErlexVendored.pretty_print_contract(contract)
    pretty_signature = ErlexVendored.pretty_print_contract(signature)

    """
    Type specification is not equal to the success typing.

    Function:
    #{pretty_module}.#{function}/#{arity}

    Type specification:
    #{pretty_contract}

    Success typing:
    #{pretty_signature}
    """
  end

  @impl DialyxirVendored.Warning
  @spec explain() :: String.t()
  def explain() do
    DialyxirVendored.Warning.default_explain()
  end
end
