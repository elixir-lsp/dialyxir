defmodule DialyxirVendored.Test.WarningTest do
  use ExUnit.Case

  # Don't test output in here, just that it can succeed.

  test "pattern match warning succeeds on valid input" do
    arguments = ['pattern {\'ok\', Vuser@1}', '{\'error\',<<_:64,_:_*8>>}']
    assert(DialyxirVendored.Warnings.PatternMatch.format_long(arguments))
  end
end
