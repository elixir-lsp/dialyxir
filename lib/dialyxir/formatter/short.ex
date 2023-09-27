defmodule DialyxirVendored.Formatter.Short do
  @moduledoc false

  alias DialyxirVendored.Formatter.Utils

  @behaviour DialyxirVendored.Formatter

  @impl DialyxirVendored.Formatter
  def format({_tag, {file, line}, {warning_name, arguments}}) do
    base_name = Path.relative_to_cwd(file)

    warning = Utils.warning(warning_name)
    string = warning.format_short(arguments)

    "#{base_name}:#{line}:#{warning_name} #{string}"
  end
end
