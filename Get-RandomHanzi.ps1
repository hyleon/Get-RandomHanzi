Function Get-RandomHanzi
{
    
    Param (
        [int]$Length = 1
    )
    if ($Length -le 0) {
        return
    }
    $count = 1
    do {
        $Hanzihex = '{0:x}' -f $(Get-Random -Minimum 0x4e00 -Maximum 0x9fa5)
        $Hanzibyte = ($Hanzihex -split '(\w{2})'|?{$_}|%{[int16]"0x$_"})[1,0]
        $Hanzi += [System.Text.Encoding]::GetEncoding('Unicode').GetString($Hanzibyte)
        $count += 1
    }
    while ($count -le $Length)
    return $Hanzi
}