defmodule DialyxirVendored.Warnings do
  @warnings Enum.into(
              [
                DialyxirVendored.Warnings.AppCall,
                DialyxirVendored.Warnings.Apply,
                DialyxirVendored.Warnings.BinaryConstruction,
                DialyxirVendored.Warnings.Call,
                DialyxirVendored.Warnings.CallToMissingFunction,
                DialyxirVendored.Warnings.CallWithOpaque,
                DialyxirVendored.Warnings.CallWithoutOpaque,
                DialyxirVendored.Warnings.CallbackArgumentTypeMismatch,
                DialyxirVendored.Warnings.CallbackInfoMissing,
                DialyxirVendored.Warnings.CallbackMissing,
                DialyxirVendored.Warnings.CallbackNotExported,
                DialyxirVendored.Warnings.CallbackSpecArgumentTypeMismatch,
                DialyxirVendored.Warnings.CallbackSpecTypeMismatch,
                DialyxirVendored.Warnings.CallbackTypeMismatch,
                DialyxirVendored.Warnings.ContractDiff,
                DialyxirVendored.Warnings.ContractRange,
                DialyxirVendored.Warnings.ContractSubtype,
                DialyxirVendored.Warnings.ContractSupertype,
                DialyxirVendored.Warnings.ContractWithOpaque,
                DialyxirVendored.Warnings.ExactEquality,
                DialyxirVendored.Warnings.ExtraRange,
                DialyxirVendored.Warnings.FunctionApplicationArguments,
                DialyxirVendored.Warnings.FunctionApplicationNoFunction,
                DialyxirVendored.Warnings.GuardFail,
                DialyxirVendored.Warnings.GuardFailPattern,
                DialyxirVendored.Warnings.ImproperListConstruction,
                DialyxirVendored.Warnings.InvalidContract,
                DialyxirVendored.Warnings.MapUpdate,
                DialyxirVendored.Warnings.MissingRange,
                DialyxirVendored.Warnings.NegativeGuardFail,
                DialyxirVendored.Warnings.NoReturn,
                DialyxirVendored.Warnings.OpaqueGuard,
                DialyxirVendored.Warnings.OpaqueEquality,
                DialyxirVendored.Warnings.OpaqueMatch,
                DialyxirVendored.Warnings.OpaqueNonequality,
                DialyxirVendored.Warnings.OpaqueTypeTest,
                DialyxirVendored.Warnings.OverlappingContract,
                DialyxirVendored.Warnings.PatternMatch,
                DialyxirVendored.Warnings.PatternMatchCovered,
                DialyxirVendored.Warnings.RecordConstruction,
                DialyxirVendored.Warnings.RecordMatching,
                DialyxirVendored.Warnings.UnknownBehaviour,
                DialyxirVendored.Warnings.UnknownFunction,
                DialyxirVendored.Warnings.UnknownType,
                DialyxirVendored.Warnings.UnmatchedReturn,
                DialyxirVendored.Warnings.UnusedFunction
              ],
              %{},
              fn warning -> {warning.warning(), warning} end
            )

  @doc """
  Returns a mapping of the warning to the warning module.
  """
  def warnings(), do: @warnings
end
