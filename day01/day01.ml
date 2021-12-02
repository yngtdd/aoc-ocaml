open Core

let file = "input.txt"

let convert (input: string list) : int list = 
    List.map input ~f:Int.of_string 

let () = 
    let input = In_channel.read_lines file |> List.map ~f:String.strip in
    input |> List.map convert |> Printf.printf "part 1: %i\n";
