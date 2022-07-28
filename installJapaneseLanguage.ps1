# Windows Server 2019のlanguagePackを「C:\lang.iso」としてダウンロードします。
Write-Output "日本語パックをダウンロードしています...`n"
Invoke-WebRequest -Uri http://download.windowsupdate.com/d/msdownload/update/software/updt/2018/04/lp_bac048dbf02b9166cfc0fd1a926c241e64955d6f.cab -OutFile C:\Users\cloudaiuser\Downloads\ja_jp.cab

#「Lpksetup.exe」コマンドを使って日本語languagePackをインストールします。
Write-Output "日本語パックを適用しています...`n"
C:\windows\system32\Lpksetup.exe /i ja-JP /f /s /p $lppath

#ユーザーが使用する言語を日本語にします。
Write-Output "ユーザーの言語を日本語にしています...`n"
Set-WinUserLanguageList -LanguageList ja-JP,en-US -Force

#入力する言語を日本語で上書きします。
Write-Output "入力する言語を日本語にしています...`n"
Set-WinDefaultInputMethodOverride -InputTip "0411:00000411"

#MS-IMEの入力方式を設定します。
Write-Output "MS-IMEの入力方式を設定しています...`n"
Set-WinLanguageBarOption -UseLegacySwitchMode -UseLegacyLanguageBar

#UIの言語を日本語で上書きします。
Write-Output "UIの言語を日本語にしています...`n"
Set-WinUILanguageOverride -Language ja-JP

#時刻/日付の形式をWindowsの言語と同じにします。
Write-Output "時刻/日付の形式をWindowsの言語と同じにしています...`n"
Set-WinCultureFromLanguageListOptOut -OptOut $False

#ロケーションを日本にします。
Write-Output "ロケーションを日本にしています...`n"
Set-WinHomeLocation -GeoId 0x7A

#システムロケールを日本にします。
Write-Output "システムロケールを日本にしています...`n"
Set-WinSystemLocale -SystemLocale ja-JP

#タイムゾーンを東京にします。
Write-Output "タイムゾーンを東京にしています...`n"
Set-TimeZone -Id "Tokyo Standard Time"

#サーバーを再起動します。
Write-Output "サーバーを再起動しています...`n"
Restart-Computer

Exit 0