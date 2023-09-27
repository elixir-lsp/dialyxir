defmodule DialyxirVendored.Warnings.PatternMatch do
  @moduledoc """
  The pattern matching is never given a value that satisfies all of
  its clauses.

  ## Example

      defmodule Example do
        def ok() do
          unmatched(:ok)
        end

        defp unmatched(:ok), do: :ok

        defp unmatched(:error), do: :error
      end
  """

  @behaviour DialyxirVendored.Warning

  @impl DialyxirVendored.Warning
  @spec warning() :: :pattern_match
  def warning(), do: :pattern_match

  @impl DialyxirVendored.Warning
  @spec format_short([String.t()]) :: String.t()
  def format_short([_pattern, type]) do
    pretty_type = ErlexVendored.pretty_print_type(type)
    "The pattern can never match the type #{pretty_type}."
  end

  @impl DialyxirVendored.Warning
  @spec format_long([String.t()]) :: String.t()
  def format_long([pattern, type]) do
    pretty_pattern = ErlexVendored.pretty_print_pattern(pattern)
    pretty_type = ErlexVendored.pretty_print_type(type)

    """
    The pattern can never match the type.

    Pattern:
    #{pretty_pattern}

    Type:
    #{pretty_type}
    """
  end

  @impl DialyxirVendored.Warning
  @spec explain() :: String.t()
  def explain() do
    @moduledoc
  end
end
