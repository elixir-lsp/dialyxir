defmodule DialyxirVendored.Formatter.Raw do
  @moduledoc false

  @behaviour DialyxirVendored.Formatter

  @impl DialyxirVendored.Formatter
  def format(warning) do
    inspect(warning, limit: :infinity)
  end
end
