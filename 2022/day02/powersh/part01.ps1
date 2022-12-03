# cwd should be \advent-of-code\2022\dayXX
$FILE_DATA      = "$PWD\inputs\input.txt"
$TEST_FILE_DATA = "$PWD\inputs\test.txt"
$ENV            = $args[0]

$FILE_USED = $TEST_FILE_DATA
If ($ENV) { $FILE_USED = $FILE_DATA }

function Get-Match-Value
{
    Param (
        [Parameter(ValueFromPipeline)]
        [string] $i
    )

    BEGIN {

    }

    PROCESS {
        Switch ($i)
        {
            {($_ -EQ 'B X') -or ($_ -EQ 'C Y') -or ($_ -EQ 'A Z')} {return 0}
            {($_ -EQ 'A X') -or ($_ -EQ 'B Y') -or ($_ -EQ 'C Z')} {return 3}
            {($_ -EQ 'A Y') -or ($_ -EQ 'B Z') -or ($_ -EQ 'C X')} {return 6}
            Default {
                Write-Error {1:"Hey I matched a value that shouldn't exist, you fucked up"}
            }
        }
    }

    END {

    }
} # function Get-Match-Value

function Get-Self-Value
{
    Param (
        [Parameter(ValueFromPipeline)]
        [string] $i
    )

    PROCESS {
        Switch ($i)
        {
            'X' {return 1}
            'Y' {return 2}
            'Z' {return 3}
            Default {
                Write-Error "Hey I matched a value that shouldn't exist, you fucked up"
            }
        }
    }
} # funtion Get-Self-Value

function Find-Score
{
    Param (
        [Parameter(ValueFromPipeline)]
        [string] $i
    )

    BEGIN {
        # Point Values
        $RoundScore
    }

    PROCESS {
        #Write-Output "I: $i"
        $round = $i -Split ' '
        $self = $round[1]

        $RoundScore += ($i | Get-Match-Value)
        $RoundScore += ($self | Get-Self-Value)
    }

    END {
        $RoundScore
    }
} # function Find-Score

[int] $SCORE = 0
Get-Content $FILE_USED | Find-Score | ForEach-Object { $SCORE += $_}
Write-Output "Final Score: $SCORE"