defmodule DialyxirVendored.Warnings.PatternMatchCovered do
  @moduledoc """
  The pattern match has a later clause that will never be executed,
  because a more general clause is higher in the matching order.

  ## Example

      defmodule Example do
        def ok() do
          unmatched(:error)
        end

        defp unmatched(_), do: :ok

        defp unmatched(:error), do: :error
      end
  """

  @behaviour DialyxirVendored.Warning

  @impl DialyxirVendored.Warning
  @spec warning() :: :pattern_match_cov
  def warning(), do: :pattern_match_cov

  @impl DialyxirVendored.Warning
  @spec format_short([String.t()]) :: String.t()
  def format_short([pattern, _]) do
    "The pattern #{pattern} can never match the type, " <>
      "because it is covered by previous clauses."
  end

  @impl DialyxirVendored.Warning
  @spec format_long([String.t()]) :: String.t()
  def format_long([pattern, type]) do
    pretty_pattern = ErlexVendored.pretty_print_pattern(pattern)
    pretty_type = ErlexVendored.pretty_print_type(type)

    """
    The pattern
    #{pretty_pattern}

    can never match, because previous clauses completely cover the type
    #{pretty_type}.
    """
  end

  @impl DialyxirVendored.Warning
  @spec explain() :: String.t()
  def explain() do
    @moduledoc
  end
end
