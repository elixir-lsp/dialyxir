defmodule DialyxirVendored.Formatter.Github do
  @moduledoc false

  alias DialyxirVendored.Formatter.Utils

  @behaviour DialyxirVendored.Formatter

  @impl DialyxirVendored.Formatter
  def format({_tag, {file, location}, {warning_name, arguments}}) do
    base_name = Path.relative_to_cwd(file)

    warning = Utils.warning(warning_name)
    string = warning.format_short(arguments)

    case location do
      {line, col} ->
        "::warning file=#{base_name},line=#{line},col=#{col},title=#{warning_name}::#{string}"

      line ->
        "::warning file=#{base_name},line=#{line},title=#{warning_name}::#{string}"
    end
  end
end
