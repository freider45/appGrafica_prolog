%&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
%  ESTRUCTURAS DEL LENGUAJE
%  Elaborado por: MSc. Jimena Adriana Timaná Peña 			  %
%&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Aqui definición de hechos y reglas, funciones básicas y recursivas
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Funcion para busqueda de un elemento dentro de una lista
%función básica:
buscar(X,[X|Cola]).

%función recursiva:
buscar(X,[Cabeza|Cola]):- buscar(X,Cola).

%Funcion para sacar el promedio de una lista

%función básica para la longitud:
longitud([],0).
%función recursiva para la longitud:
longitud([Cabeza|Cola],Long):- longitud(Cola, L),Long is L + 1.

%función basica para la suma:
suma([],0).
%función recursiva para la suma:
suma([Cabeza|Cola],Sum):- suma(Cola, S),Sum is Cabeza + S.

%Regla para el promedio
promedio(Lista,P):- suma(Lista,Sum), longitud(Lista, Long), P is Sum/Long.

%Hechos prestar libro
presta(andres, jimena).
presta(ana, jimena).
%Regla prestar libro
prestar_libro(X):- presta(X, jimena).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


?-window(_, _,crea_ventana(),"Aplicación",150, 50, 450, 450), 
  window_brush(_, "kame.bmp"),update_window(_).

%crea el menú

crea_ventana(init):- 
menu(pop_up, _,_,salir(_),"&ARCHIVO"), 
menu(pop_up, _,_,listas(_),"&LISTAS"),
menu(pop_up, _,_,logico(_),"&LOGICO").

%Crea el Submenú Salir
salir(init):-	
menu(normal, _,_,cerrar_ven(_),"&Salir").
cerrar_ven(press):- close_window(X).

%Crea el Submenú listas
listas(init):-	
menu(normal, _,_,buscar_elem(_),"&Buscar Elemento"),
menu(normal, _,_,promedio_lista(_),"&Promedio Lista").

%Crea el Submenú Logico
logico(init):-	
menu(normal, _,_,prestar_libro(_),"&Prestar Libro"),
menu(normal, _,_,criminal(_),"&Criminal").


% subfuncion para buscar elemento en la lista

buscar_elem(press):-  
window( _, _, ventana_buscar(_), "Buscar elemento en Lista", 150,50,450,450).



ventana_buscar(init):- window_brush(_, rgb(166, 129, 182)),
                    button(_,_,boton_iniciar(_),"&Iniciar",320,35,95,30).


%---- al oprimir el botón se procede a buscar el elemento

boton_iniciar(press):- 
	
	read(X,"Digite la lista en la que se va a buscar:"),
	read(Elem,"Digite el elemento que se va a buscar:"),
	%esta es una etiqueta
     text_out(50,100,"La Lista es:"),	
     %esta es una caja de texto con el nombre de G_lista
     edit(G_lista,_,edit_func(_),"",235,120,150,28),
	set_text(print(X),G_lista), 
	(buscar(Elem,X)-> 
		message("Información","El elemento se encuentra en la lista ",i)
	else
		message( "Información", "El elemento no se encuentra en la lista ",s)).


% subfuncion para sacar el promedio de la lista

promedio_lista(press):-
window(_, _, ventana_promedio(_), "Promedio de lista",150,50,450,450).

ventana_promedio(init):-window_brush(_, rgb(166, 129, 182)),
					button(_, _,boton_promedio(_),"&Iniciar",320,35,95,30).

%------- Al oprimir el boton se procede a calcular el promedio

boton_promedio(press):-

	read(Lista,"Digite la lista a sacar el promedio:"),
	%esta es una etiqueta
     text_out(50,100,"La Lista es:"),	
	%esta es una caja de texto con el nombre de G_lista
     edit(G_lista,_,edit_func(_),"",235,120,150,28),
	set_text(print(Lista),G_lista), 
	promedio(Lista,Promedio),
	text_out(50,300,"El promedio es:"),
	edit(G_lista,_,edit_func(_),"",235,300,150,28),
	set_text(print(Promedio),G_lista). 

% subfuncion para prestar libro

prestar_libro(press):-
window(_, _, ventana_prestar(_), "Promedio de lista",150,50,450,450).

ventana_prestar(init):-window_brush(_, rgb(166, 129, 182)),
					button(_, _,boton_prestar(_),"&Iniciar",320,35,95,30).

%------- Al oprimir el boton se procede a calcular el promedio

boton_prestar(press):-

     text_out(50,100,"Le prestan un libro a jimena:"),	
	%esta es una caja de texto con el nombre de G_lista
     edit(G_lista,_,edit_func(_),"",235,120,150,28),
	prestar_libro(X),
	set_text(print(X),G_lista).



