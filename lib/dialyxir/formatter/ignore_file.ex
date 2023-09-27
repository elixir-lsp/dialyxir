defmodule DialyxirVendored.Formatter.IgnoreFile do
  @moduledoc false

  @behaviour DialyxirVendored.Formatter

  @impl DialyxirVendored.Formatter
  def format({_tag, {file, _location}, {warning_name, _arguments}}) do
    ~s({"#{file}", :#{warning_name}},)
  end
end
