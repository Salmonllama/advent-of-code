$FILE_DATA      = "$PWD\2022\day01\inputs\input.txt"
$TEST_FILE_DATA = "$PWD\2022\day01\inputs\test.txt"
$ENV            = $args[0]

$FILE_USED = $TEST_FILE_DATA
If ($ENV) { $FILE_USED = $FILE_DATA }

function Add-Values
{
    [CmdletBinding()]
    Param
    (
        [Parameter(ValueFromPipeline)]
        [int] $values
    )

    BEGIN
    {
        $total = 0
    }

    PROCESS
    {
        ForEach ($v in $values)
        {
            $total += $v
        }
    }

    END
    {
        $total
    }
}

function Get-Sums
{
    [CmdletBinding()]
    Param 
    (
        [Parameter(ValueFromPipeline)]
        [int] $values
    )

    BEGIN
    {
        [int] $sum = 0
    }

    PROCESS
    {
        ForEach ($v in $values)
        {
            If ($v -EQ '')
            {
                # Empty line, write-output
                $sum
                $sum = 0
            }
            else {
                $sum += $v
            }
        }
    }

    END
    {
        $sum
    }
}

$val = Get-Content $FILE_USED | Get-Sums | Sort-Object -Descending | Select-Object -First 1
Write-Output "Largest Calorie Count: $val"

$val = Get-Content $FILE_USED | Get-Sums | Sort-Object -Descending | Select-Object -First 3 | Add-Values
Write-Output "Sum of Largest 3: $val"