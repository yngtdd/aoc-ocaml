open Core

(** [coordinate] of submarine's movement

    At each step in the submarine's path, 
    we move in a direction [up, down, left, right]
    with a given magnitude. *)
type coordinate = 
  { direction : string; 
    magnitude : int; 
  }

  (** Construct a [coordinate] from a parsed string line *)
let coordinate_of_string line = 
  let matches =
    let pat = "([a-zA-Z]+)[ \t]+([0-9])" in 
    Re.exec (Re.Posix.compile_pat pat) line 
  in 
  { direction = Re.Group.get matches 1;
    magnitude = Int.of_string (Re.Group.get matches 2);
  };;

let input = 
  In_channel.read_lines "input.txt"
  |> List.map ~f:coordinate_of_string
