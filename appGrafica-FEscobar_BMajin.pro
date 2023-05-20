%&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
%  ESTRUCTURAS DEL LENGUAJE
%  Elaborado por: Brayan Majin Gaviria
%                 Freider Johan Escobar Cueltan
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

%--------------------------------------------------------------------------------
%funcion concatenar dos listas de manera inversa

concatenar(Lista,[],Lista).
concatenar(Lista,[Cabeza|Cola],[Cabeza|Resultado]):-concatenar(Lista,Cola,Resultado).

% Hechos Hollywood


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


?-window(_, _,crea_ventana(),"Aplicación",150, 50, 450, 450), 
  window_brush(_, "SKY.bmp"),update_window(_).

%crea el menú

crea_ventana(init):- 
menu(pop_up, _,_,archivo(_),"&ARCHIVO"), 
menu(pop_up, _,_,listas(_),"&LISTAS"),
menu(pop_up, _,_,logico(_),"&LÓGICO").

%Crea el Submenú Salir
archivo(init):-	
menu(normal, _,_,informacion(),"&Información"),
menu(normal, _,_,cerrar_ven(_),"&Salir").

%Crea el Submenú listas
listas(init):-	
menu(normal, _,_,buscar_elem(_),"&Borrar Elemento"),
menu(normal, _,_,concatenar_inversa(_),"&Concatenar Inversa"),
menu(normal, _,_,conocer_multiplos(),"&Conocer_multiplos").

%Crea el Submenú Logico
logico(init):-	
menu(normal, _,_,criminal(_),"&Hollywood").


% --------------- Sub funciones ---------------------------
% Para Archivo
% subfuncion para salir
cerrar_ven(press):- close_window(X).

% subfuncion para mostrar la informacion
informacion(press):- 
window(_, _, ventana_informacion(_), "Autores", 175,160,400,200),
		   text_out(50, 30, "Autores: " ),
		   text_out(50, 50, "Brayan Majin Gaviria"),
		   text_out(50, 70, "Freider Johan Escobar Cueltan").


% Para Listas
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

boton_prestar(press):-

     text_out(50,100,"Le prestan un libro a jimena:"),	
	%esta es una caja de texto con el nombre de G_lista
     edit(G_lista,_,edit_func(_),"",235,120,150,28),
	prestar_libro(X),
	set_text(print(X),G_lista).

%-------------------------------------------------------------
%seccion concatenar elementos inversamente en una lista.



% Para Listas
% subfuncion para buscar elemento en la lista
concatenar_inversa(press):-  
window( _, _, ventana_concatenar(_), "Concatenar listas inversamente", 150,50,450,450).

ventana_concatenar(init):- window_brush(_, rgb(166, 129, 182)),
                    button(_,_,boton_concatenar(_),"&Concatenar",320,35,95,30).



boton_concatenar(press):- 
	
	read(Lista1,"Digite la primera lista: "),
	read(Lista2,"Digite La Segunda lista"),
	%esta es una etiqueta
     text_out(50,100,"La Lista es:"),	
     %esta es una caja de texto con el nombre de 
	
     edit(Conctenar_inversa,_,edit_func(_),"",235,120,150,28),
	   concatenar(Lista1,Lista2,Resultado),
	set_text(print(Resultado), Conctenar_inversa).

	