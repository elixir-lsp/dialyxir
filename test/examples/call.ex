defmodule DialyxirVendored.Examples.Call do
  def ok() do
    ok(:error)
  end

  def ok(:ok) do
    :ok
  end
end
