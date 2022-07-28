# Windows Server 2019のlanguagePackを「C:\lang.iso」としてダウンロードします。
Invoke-WebRequest -Uri http://download.windowsupdate.com/d/msdownload/update/software/updt/2018/04/lp_bac048dbf02b9166cfc0fd1a926c241e64955d6f.cab -OutFile C:\Users\cloudaiuser\Downloads\ja_jp.cab

#「Lpksetup.exe」コマンドを使って日本語languagePackをインストールします。
C:\windows\system32\Lpksetup.exe /i ja-JP /f /s /p $lppath

#ユーザーが使用する言語を日本語にします。
Set-WinUserLanguageList -LanguageList ja-JP,en-US -Force

#入力する言語を日本語で上書きします。
Set-WinDefaultInputMethodOverride -InputTip "0411:00000411"

#MS-IMEの入力方式を設定します。
Set-WinLanguageBarOption -UseLegacySwitchMode -UseLegacyLanguageBar

#UIの言語を日本語で上書きします。
Set-WinUILanguageOverride -Language ja-JP

#時刻/日付の形式をWindowsの言語と同じにします。
Set-WinCultureFromLanguageListOptOut -OptOut $False

#ロケーションを日本にします。
Set-WinHomeLocation -GeoId 0x7A

#システムロケールを日本にします。
Set-WinSystemLocale -SystemLocale ja-JP

#タイムゾーンを東京にします。
Set-TimeZone -Id "Tokyo Standard Time"

#サーバーを再起動します。
Restart-Computer

Exit 0