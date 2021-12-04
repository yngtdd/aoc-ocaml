open Core

(** Direction that the submarine is headed *)
type direction = 
  | Forward 
  | Down
  | Up;;

(** Construct a [direction] from [string] input *)
let direction_of_string s =
  match s with
    | "forward" -> Forward
    | "down" -> Down
    | "up" -> Up
    | _ -> assert false

(** [coordinate] of submarine's movement

    At each step in the submarine's path, 
    we move in a [direction] with a given magnitude. *)
type coordinate = 
  { direction : direction; 
    magnitude : int 
  }

  (** Construct a [coordinate] from a parsed [string] *)
let coordinate_of_string line =
  let matches =
    let pat = "([a-zA-Z]+)[ \t]+([0-9])" in
    Re.exec (Re.Posix.compile_pat pat) line
  in
  {
    direction = direction_of_string (Re.Group.get matches 1);
    magnitude = Int.of_string (Re.Group.get matches 2);
  }

let input =
  In_channel.read_lines "input.txt" 
  |> List.map ~f:coordinate_of_string
