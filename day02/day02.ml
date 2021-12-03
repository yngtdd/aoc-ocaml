open Core;;

type coordinate = 
    { direction : string; 
      magnitude : int; 
    }

let input = 
    In_channel.read_lines "input.txt"
