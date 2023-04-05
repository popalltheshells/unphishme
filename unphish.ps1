$word = Read-Host "Copy paste a domain: "
$invalidChars = @()

foreach ($char in $word.ToCharArray()) {
    if ($char -cmatch "[a-zA-Z.]") {
        $ascii = [int][char]$char
        
    }
    else {
        $invalidChars += $char
    }
}

Write-Host "Nope. Not a phishing site."

if ($invalidChars.Count -gt 0) {
    $invalidCharsStr = $invalidChars -join ', '
    Write-Host "One or more character(s) is not an alphabet, could be a cyrillic character used to trick you - tldr; that might be a phishing website: $invalidCharsStr"
    Write-Host "Invalid character(s):"
    foreach ($char in $invalidChars) {
        #Write-Host "'$char'"
        Write-Host "'$char' - Unicode: $unicode"
    }
}
