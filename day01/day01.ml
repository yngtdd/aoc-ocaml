open Core

let input = 
    In_channel.read_lines "input.txt"
    |> List.map ~f:Int.of_string

