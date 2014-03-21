# Hangman_WasteOfTime

Clear-Host
$word = Read-Host "This is a word" | ForEach-Object{$_[0..($_.length - 1)]}
Clear-Host

$output = @()
$i = 0
While($i -lt ($word.length)) {
    $output += "_"
    $i += 1
}

$guesses_left = 3
$win = 0

While(($guesses_left -gt 0) -and ($win -eq 0)) {
    $guess = Read-Host "Enter a letter"
    $j = 0
    $flag = 0
    While($j -lt ($word.length)) {
        If($word[$j] -like $guess) {
            $output[$j] = $word[$j]
            $flag += 1
        }
        $j += 1
    }

    If($flag -eq 0) {
        $guesses_left -= 1
    }
    Elseif(($output -contains "_") -eq $false) {
        $win = 1
    }

    Clear-Host

    Write-Host $output -NoNewline
    Write-Output "`n$guesses_left guesses remaining."
}

If($win -eq 1) {
    Write-Host "`nYOU WIN!`n" -ForegroundColor Green
}
Elseif($guesses_left -le 0) {
    Write-Host "`nYOU LOSE!`n" -ForegroundColor Red
}
Else {
    Write-Host "`nWHAT HAPPENED?!`n" -ForegroundColor Yellow
}