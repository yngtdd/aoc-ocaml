open Core
open Printf

let input = 
    In_channel.read_lines "input.txt"
    |> List.map ~f:Int.of_string

let result a b = if a < b then 1 else 0

let rec increasing acc data =
  match data with
  | [] -> acc
  | [_] -> acc
  | first :: second :: rest -> increasing (acc + result first second)
                                 (second :: rest);;

printf "%d\n" (increasing 0 input)
