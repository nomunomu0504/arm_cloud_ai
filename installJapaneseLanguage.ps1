# Windows Server 2019��languagePack���uC:\lang.iso�v�Ƃ��ă_�E�����[�h���܂��B
Write-Output "���{��p�b�N���_�E�����[�h���Ă��܂�...`n"
Invoke-WebRequest -Uri http://download.windowsupdate.com/d/msdownload/update/software/updt/2018/04/lp_bac048dbf02b9166cfc0fd1a926c241e64955d6f.cab -OutFile C:\Users\cloudaiuser\Downloads\ja_jp.cab

#�uLpksetup.exe�v�R�}���h���g���ē��{��languagePack���C���X�g�[�����܂��B
Write-Output "���{��p�b�N��K�p���Ă��܂�...`n"
C:\windows\system32\Lpksetup.exe /i ja-JP /f /s /p $lppath

#���[�U�[���g�p���錾�����{��ɂ��܂��B
Write-Output "���[�U�[�̌������{��ɂ��Ă��܂�...`n"
Set-WinUserLanguageList -LanguageList ja-JP,en-US -Force

#���͂��錾�����{��ŏ㏑�����܂��B
Write-Output "���͂��錾�����{��ɂ��Ă��܂�...`n"
Set-WinDefaultInputMethodOverride -InputTip "0411:00000411"

#MS-IME�̓��͕�����ݒ肵�܂��B
Write-Output "MS-IME�̓��͕�����ݒ肵�Ă��܂�...`n"
Set-WinLanguageBarOption -UseLegacySwitchMode -UseLegacyLanguageBar

#UI�̌������{��ŏ㏑�����܂��B
Write-Output "UI�̌������{��ɂ��Ă��܂�...`n"
Set-WinUILanguageOverride -Language ja-JP

#����/���t�̌`����Windows�̌���Ɠ����ɂ��܂��B
Write-Output "����/���t�̌`����Windows�̌���Ɠ����ɂ��Ă��܂�...`n"
Set-WinCultureFromLanguageListOptOut -OptOut $False

#���P�[�V��������{�ɂ��܂��B
Write-Output "���P�[�V��������{�ɂ��Ă��܂�...`n"
Set-WinHomeLocation -GeoId 0x7A

#�V�X�e�����P�[������{�ɂ��܂��B
Write-Output "�V�X�e�����P�[������{�ɂ��Ă��܂�...`n"
Set-WinSystemLocale -SystemLocale ja-JP

#�^�C���]�[���𓌋��ɂ��܂��B
Write-Output "�^�C���]�[���𓌋��ɂ��Ă��܂�...`n"
Set-TimeZone -Id "Tokyo Standard Time"

#�T�[�o�[���ċN�����܂��B
Write-Output "�T�[�o�[���ċN�����Ă��܂�...`n"
Restart-Computer