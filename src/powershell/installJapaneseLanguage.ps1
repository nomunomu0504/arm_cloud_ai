try {
  # ユーザーが使用する言語を日本語にします。
  Set-WinUserLanguageList -LanguageList ja-JP,en-US -Force

  # 日本語用のAppxパックをダウンロード
  Invoke-WebRequest -Uri https://github.com/nomunomu0504/arm_cloud_ai/raw/main/JapaneseLanguagePack.appx -OutFile C:\JapaneseLanguagePack.appx

  # 日本語用cabファイルをダウンロード
  Invoke-WebRequest -Uri https://github.com/nomunomu0504/arm_cloud_ai/raw/main/JapaneseLanguagePack.cab -OutFile C:\JapaneseLanguagePack.cab
  Invoke-WebRequest -Uri https://github.com/nomunomu0504/arm_cloud_ai/raw/main/JapanesePreinstllation.cab -OutFile C:\JapanesePreinstllation.cab

  # Appxパッケージのインストール
  Add-AppxPackage -Path C:\JapaneseLanguagePack.appx

  # 「Lpksetup.exe」コマンドを使って日本語languagePackをインストールします。
  C:\windows\system32\Lpksetup.exe /i ja-JP /f /s /p C:\JapaneseLanguagePack.cab
  C:\windows\system32\Lpksetup.exe /i ja-JP /f /s /p C:\JapanesePreinstllation.cab

  # 入力する言語を日本語で上書きします。
  Set-WinDefaultInputMethodOverride -InputTip "0411:00000411"

  # MS-IMEの入力方式を設定します。
  Set-WinLanguageBarOption -UseLegacySwitchMode -UseLegacyLanguageBar

  # UIの言語を日本語で上書きします。
  Set-WinUILanguageOverride -Language ja-JP

  # 時刻/日付の形式をWindowsの言語と同じにします。
  Set-WinCultureFromLanguageListOptOut -OptOut $False

  # ロケーションを日本にします。
  Set-WinHomeLocation -GeoId 0x7A

  # システムロケールを日本にします。
  Set-WinSystemLocale -SystemLocale ja-JP

  # タイムゾーンを東京にします。
  Set-TimeZone -Id "Tokyo Standard Time"

  # サーバーを再起動します。
  Restart-Computer

  Exit 0
} catch {
  Write-Error $_
  Exit -1
}
