$FILE_DATA      = "$PWD\2022\day01\inputs\input.txt"
$TEST_FILE_DATA = "$PWD\2022\day01\inputs\test.txt"
$ENV            = $args[0]

$GLOBAL_GREATEST = 0
$SUM = 0

$FILE_USED = $TEST_FILE_DATA
If ($ENV) { $FILE_USED = $FILE_DATA }

# Go line-by-line
# For each line read, if it is a populated line, add the number to the sum

# If it is a blank line, compare the sum to the global-greatest.
# If the sum is greater than the global greatest, it becomes the global greatest

# Return the global greatest

ForEach ($Line in Get-Content $FILE_USED)
{
    # Write-Output "LINE IS $LINE"
    # Write-Output "SUM IS $SUM"
    # Write-Output "GG IS $GLOBAL_GREATEST"

    If ($Line -EQ '')
    {
        If ($SUM -GT $GLOBAL_GREATEST)
        {
            # WRITE-OUTPUT "MATCH FOUND"
            $GLOBAL_GREATEST = $SUM
            $SUM = 0
            # Write-Output "SUM CLEARED. NEW SUM $SUM"
        }

        $SUM = 0
    } else {
        [int]$LineInt = 0
        [bool]$Result = [int]::TryParse($Line, [ref]$LineInt)
        If (!$Result)
        {
            Write-Output $Result
        }
        $SUM += $LineInt
    }
}

Write-Output "Largest number of calories: $GLOBAL_GREATEST"