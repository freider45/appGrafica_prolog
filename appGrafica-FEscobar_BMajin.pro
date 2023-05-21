%&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
%  ESTRUCTURAS DEL LENGUAJE
%  Elaborado por: Brayan Majin Gaviria
%                 Freider Johan Escobar Cueltan
%&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Aqui definición de hechos y reglas, funciones básicas y recursivas
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%-------------------------------------------------------------------------------
%Funcion para borrar un elemento de la lista
% Básica
borrar(_,[],[]).
borrar(X,[X|Cola],Cola).
% Recursiva
borrar(E,[Cabeza|Cola],[Cabeza|Lista]):-borrar(E,Cola,Lista),E \= Cabeza.

%--------------------------------------------------------------------------------
%funcion concatenar dos listas de manera inversa
% Básica
concatenar(Lista,[],Lista).
% Recursiva
concatenar(Lista,[Cabeza|Cola],[Cabeza|Resultado]):-concatenar(Lista,Cola,Resultado).
%-----------------------------------------------------------------------------------
%funcion multiplos de 5 pero no de tres
%basica
conocer([],[], 0, 0).
%funcion recursiva
conocer([Cabeza|Cola], [Cabeza|Multiplos], M, N) :-Cabeza mod 5 =:= 0,Cabeza mod 3 =\= 0,conocer(Cola,Multiplos,M1,N),
  M is M1 + 1.
  N is N.
conocer([Cabeza|Cola], Multiplos, M, N) :- conocer(Cola, Multiplos, M, N1),N is N1 + 1.

% Hechos Hollywood
es_director(j.j abrams,star trek).
es_director(guillermo del toro,hellboy).
es_director(gabriele muccino,siete almas).
es_director(michael bay,transformers).
es_director(jon favreau,iron man).

es_actor(daniel radcliffe,harry potter).
es_actor(tom hanks,ángeles y demonios).
es_actor(megan fox,transformers).
es_actor(brad pitt,benjamin button).
es_actor(downey jr,iron man).
es_actor(will smith,siete almas).

genero(harry potter,aventura).
genero(star trek,ciencia ficcion).
genero(angeles y demonios,suspenso).
genero(transformers,accion).
genero(benjamin button,drama).
genero(siete almas,drama).
genero(iron man,ciencia ficcion).
genero(hellboy,ciencia ficcion).



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
menu(normal, _,_,borrar_elemento(_),"&Borrar Elemento"),
menu(normal, _,_,concatenar_inversa(_),"&Concatenar Inversa"),
menu(normal, _,_,conocer_multiplos(),"&Conocer_multiplos").

%Crea el Submenú Logico
logico(init):-	
menu(normal, _,_,criminal(_),"&Hollywood").


% ------------------------------Ventanas-----------------------------------------
% Para Archivo
% subfuncion para salir
cerrar_ven(press):- close_window(X).

% subfuncion para mostrar la informacion
informacion(press):- 
window(_, _, ventana_informacion(_), "Autores", 175,160,400,200),
		   text_out(50, 30, "Autores: " ),
		   text_out(50, 50, "Brayan Majin Gaviria"),
		   text_out(50, 70, "Freider Johan Escobar Cueltan").

%--------------------------------------------------------
% Para Listas
% subfuncion para borrar un elemento de la lista
borrar_elemento(press):-  
window( _, _, ventana_borrar(_), "Borrar elemento de la Lista", 150,50,450,450).

ventana_borrar(init):- window_brush(_, rgb(166, 129, 182)),
                    button(_,_,boton_borrar(_),"&Borrar",160,35,95,30).


% subfuncion para concatenar inversamente dos listas
concatenar_inversa(press):-  
window( _, _, ventana_concatenar(_), "Concatenar listas inversamente", 150,50,450,450).

ventana_concatenar(init):- window_brush(_, rgb(166, 129, 182)),
                    button(_,_,boton_concatenar(_),"&Concatenar",160,35,95,30).




%---------------------------------Botones--------------------------------------------

%---- al oprimir el botón borrar se procede a borrar el elemento
boton_borrar(press):- 
	
	read(Lista,"Digite la lista"),
	read(Elem,"Digite el elemento que se va a borrar:"),
	%estas son las estiquetas
     text_out(50,100,"La Lista es:"),	
	text_out(50,150,"El elemento a borrar es:"),
     %esta es una caja de texto para la lista y elemento
	edit(G_lista,_,edit_func(_),"",235,100,150,28),
	set_text(print(Lista),G_lista), 
	edit(G_lista,_,edit_func(_),"",235,150,150,28),
	set_text(print(Elem),G_lista),
	%Función
	borrar(Elem,Lista,New_lista),
	text_out(50,250,"La Lista queda:"),
	edit(G_lista,_,edit_func(_),"",235,250,150,28),
	set_text(print(New_lista),G_lista).


% al oprimir el botón concatenar se procede a concatenar las dos listas
boton_concatenar(press):- 
	
	read(Lista1,"Digite la primera lista: "),
	read(Lista2,"Digite La Segunda lista"),
	%esta es una etiqueta para la lista 1 y la 2
     text_out(50,100,"La Lista 1 es:"),	
	text_out(50,150,"La Lista 2 es:"),
     %esta es una caja de texto para la lista1 y la 2
     edit(G_lista,_,edit_func(_),"",235,100,150,28),
	set_text(print(Lista1), G_lista),
	edit(G_lista,_,edit_func(_),"",235,150,150,28),
	set_text(print(Lista2), G_lista),
	%Función
	concatenar(Lista1,Lista2,Resultado),
	text_out(50,250,"La Lista resultante es:"),
	edit(G_lista,_,edit_func(_),"",235,250,150,28),
	set_text(print(Resultado), G_lista).

	