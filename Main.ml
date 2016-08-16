let _ = Random.self_init ()

type shape = 
	|Bloc
	|Slab of bool * bool
	|Stair of int
	
type texture =
	{front : int ;
	back : int ;
	left : int ;
	right : int ;
	up : int ;
	down : int}

type bloc =
	{id : int;
	texture : texture;
	shape : shape}
     
type grid =
	|Line of grid array
	|Dot of bloc
	
let texutre_uniform id = 
	{front = id ;
	back = id ;
	left = id ;
	right = id ;
	up = id ;
	down = id}

let make_grid times length item =
	let rec aux = function
		|i when i = times -> Dot item
		|i -> Line (Array.make length (aux (i + 1)))
	in aux 0
	
let tex  = texutre_uniform 1
let blo = {id = 1; texture = tex; shape = Bloc}
let test = make_grid 2 2 blo