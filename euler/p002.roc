##
## Each new term in the Fibonacci sequence is generated by adding the previous
## two terms. By starting with 1 and 2, the first 10 terms will be:
##
## 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...
##
## By considering the terms in the Fibonacci sequence whose values do not exceed
## four million, find the sum of the even-valued terms.
##
## Roc solution for [Project Euler Problem 2](https://projecteuler.net/problem=1)
##
app "euler"
    packages { pf: "https://github.com/roc-lang/basic-cli/releases/download/0.3.1/97mY3sUwo433-pcnEQUlMhn-sWiIf_J9bPhcAFZoqY4.tar.br" }
    imports [
        pf.Stdout,
    ]
    provides [main] to pf

main =
    answer = 
        {
            limit: 4000000, 
            previous: 0, 
            current: 1, 
            sum: 0
        }
        |> fibs
        |> Num.toStr

    Stdout.line "The sum of even Fibonacci valus less then four million is \(answer)."

## A recursive function that generates the sum of even-valued terms in the 
## Fibonacci sequence up to the specified `limit`.
fibs = \{limit, previous, current, sum} ->
    if current >= limit then
        sum
    else if Num.isEven current then
        fibs 
            {
                limit, 
                previous: current, 
                current: (current + previous), 
                sum: (sum + current)
            }
    else
        fibs 
            {
                limit, 
                previous: current, 
                current: (current + previous), 
                sum
            }

expect fibs 5 0 1 0 == 2
expect fibs 10 0 1 0 == 10
expect fibs 20 0 1 0 == 10
expect fibs 50 0 1 0 == 44
expect fibs 188 0 1 0 == 188
