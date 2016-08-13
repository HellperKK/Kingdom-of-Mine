let _ = Random.self_init ()
type shape = 
	|Bloc
	|Slab of bool * bool
	|Stair of int
	
type bloc =
  { id : int ;
     shape : shape }
     
type grid =
	|Line of grid list
	|Dot of bloc
	
	
let list_make length item =
	let rec aux acc = function
		|i when i = length -> acc
		|i -> aux (item :: acc) (i + 1)
	in aux [] 0

let make_grid times length item =
	let rec aux = function
		|i when i = times -> Dot item
		|i -> Line (list_make length (aux (i + 1)))
	in aux 0
	
let base = {id = 0; shape = Bloc}
let test = make_grid 3 2 base