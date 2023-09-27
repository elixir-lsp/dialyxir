defmodule DialyxirVendored.Examples.PatternMatch do
  def ok() do
    unmatched(:ok)
  end

  defp unmatched(:ok), do: :ok

  defp unmatched(:error), do: :error
end
