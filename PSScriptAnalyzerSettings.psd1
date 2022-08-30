# See https://docs.microsoft.com/en-us/powershell/utility-modules/psscriptanalyzer/using-scriptanalyzer for more detail.
@{
    Severity=@('Error','Warning')
    ExcludeRules=@(
      'PSAvoidUsingConvertToSecureStringWithPlainText'
    )
  }
  