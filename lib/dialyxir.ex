defmodule DialyxirVendored do
  @moduledoc false
  use Application

  def start(_, _) do
    Supervisor.start_link([], strategy: :one_for_one)
  end
end
