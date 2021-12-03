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

let rec three_increasing acc data = 
  match data with 
  | [] -> acc
  | [_] -> acc
  | a :: b :: c :: d :: rest -> three_increasing (acc + (result (a+b+c) (b+c+d))) 
                                (b :: c :: d :: rest)
  | _ -> acc;;

printf "%d %d\n" (increasing 0 input) (three_increasing 0 input)
