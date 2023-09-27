defmodule DialyxirVendored.Formatter.IgnoreFileStrict do
  @moduledoc false

  alias DialyxirVendored.Formatter.Utils

  @behaviour DialyxirVendored.Formatter

  @impl DialyxirVendored.Formatter
  def format({_tag, {file, _location}, {warning_name, arguments}}) do
    warning = Utils.warning(warning_name)
    string = warning.format_short(arguments)

    ~s({"#{file}", "#{string}"},)
  end
end
