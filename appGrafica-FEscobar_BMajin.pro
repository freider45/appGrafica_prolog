%&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
%  ESTRUCTURAS DEL LENGUAJE
%  Elaborado por: Brayan Majin Gaviria
%                 Freider Johan Escobar Cueltan
%&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Aqui definici�n de hechos y reglas, funciones b�sicas y recursivas
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%-------------------------------------------------------------------------------
%Funcion para borrar un elemento de la lista
% B�sica
borrar(_,[],[]).
borrar(X,[X|Cola],Cola).
% Recursiva
borrar(E,[Cabeza|Cola],[Cabeza|Lista]):-borrar(E,Cola,Lista),E \= Cabeza.

%--------------------------------------------------------------------------------
%funcion concatenar dos listas de manera inversa
% B�sica
concatenar(Lista,[],Lista).
% Recursiva
concatenar(Lista,[Cabeza|Cola],[Cabeza|Resultado]):-concatenar(Lista,Cola,Resultado).
%-----------------------------------------------------------------------------------
%funcion multiplos de 5 pero no de tres
%basica
multiplos([],[], 0, 0).
%funcion recursiva
multiplos([Cabeza|Cola], [Cabeza|Multiplos], M, N) :-Cabeza mod 5 =:= 0,Cabeza mod 3 =\= 0,multiplos(Cola,Multiplos,M1,N),
  M is M1 + 1.
  N is N.
multiplos([Cabeza|Cola], Multiplos, M, N) :- multiplos(Cola, Multiplos, M, N1),N is N1 + 1.

% Hechos Hollywood
es_director(j.j_abrams,star_trek).
es_director(guillermo_del_toro,hellboy).
es_director(gabriele_muccino,siete_almas).
es_director(michael_bay,transformers).
es_director(jon_favreau,iron_man).

es_actor(daniel_radcliffe,harry_potter).
es_actor(tom_hanks,�ngeles_y_demonios).
es_actor(megan_fox,transformers).
es_actor(brad_pitt,benjamin_button).
es_actor(downey_jr,iron_man).
es_actor(will_smith,siete_almas).

genero(harry_potter,aventura).
genero(star_trek,ciencia_ficcion).
genero(angeles_y_demonios,suspenso).
genero(transformers,accion).
genero(benjamin_button,drama).
genero(siete_almas,drama).
genero(iron_man,ciencia_ficcion).
genero(hellboy,ciencia_ficcion).



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Ventana principal
?-window(_, _,crea_ventana(),"Aplicaci�n",150, 50, 450, 450), 
  window_brush(_, "SKY.bmp"),update_window(_).

%----------------------Submen�-----------------------------
%crea el
crea_ventana(init):- 
menu(pop_up, _,_,archivo(_),"&ARCHIVO"), 
menu(pop_up, _,_,listas(_),"&LISTAS"),
menu(pop_up, _,_,logico(_),"&L�GICO").

%Crea el Submen� Salir e informaci�n
archivo(init):-	
menu(normal, _,_,informacion(_),"&Informaci�n"),
menu(normal, _,_,cerrar_ven(_),"&Salir").

%Crea el Submen� listas
listas(init):-	
menu(normal, _,_,borrar_elemento(_),"&Borrar Elemento"),
menu(normal, _,_,concatenar_inversa(_),"&Concatenar Inversa"),
menu(normal, _,_,conocer_multiplos(_),"&Conocer multiplos").

%Crea el Submen� Logico
logico(init):-	
menu(normal, _,_,hollywood(_),"&Hollywood").
					

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

ventana_informacion(init):-window_brush(_,rgb(64,207,255)).

%--------------------------------------------------------
% Para Listas
% subfunci�n para borrar un elemento de la lista
borrar_elemento(press):-  
window( _, _, ventana_borrar(_), "Borrar elemento de la Lista", 150,50,450,450).

ventana_borrar(init):- window_brush(_, rgb(64,207,255)),
                    button(_,_,boton_borrar(_),"&Borrar",160,35,95,30).


% subfunci�n para concatenar inversamente dos listas
concatenar_inversa(press):-  
window( _, _, ventana_concatenar(_), "Concatenar listas inversamente", 150,50,450,450).

ventana_concatenar(init):- window_brush(_, rgb(64,207,255)),
                    button(_,_,boton_concatenar(_),"&Concatenar",160,35,95,30).

% subfunci�n para conocer multiplos de 5 pero no de 3
conocer_multiplos(press):-
window( _, _, ventana_multiplos(), "Multiplos de 5", 150, 50,450,450).

ventana_multiplos(init):-window_brush(_,rgb(64,207,255)),
				button(_,_,boton_multiplos(_),"&Multiplos",160,35,95,30).

%-----------------------------------------------------------
%Para L�gico
% subfunci�n para 
hollywood(press):-
window( _, _, ventana_hollywood(), "Hollywood", 150,50,450,450).

ventana_hollywood(init):-window_brush(_,rgb(64,207,255)),
				button(_,_,boton_iniciar(_),"&Iniciar",160,35,95,30).

%---------------------------------Botones--------------------------------------------

% al oprimir el bot�n borrar se procede a borrar el elemento
boton_borrar(press):- 
	
	read(Lista,"Digite la lista"),
	read(Elem,"Digite el elemento que se va a borrar:"),
	%estas son las estiquetas
     text_out(50,100,"La Lista es:"),	
	text_out(50,150,"El elemento a borrar es:"),
     %esta es una caja de texto para la lista y elemento
	edit(G_lista,_,edit_func(_),"",235,100,150,25),
	set_text(print(Lista),G_lista), 
	edit(G_lista,_,edit_func(_),"",235,150,50,24),
	set_text(print(Elem),G_lista),
	%Funci�n
	borrar(Elem,Lista,New_lista),
	text_out(50,250,"La Lista queda:"),
	edit(G_lista,_,edit_func(_),"",235,250,150,25),
	set_text(print(New_lista),G_lista).


% al oprimir el bot�n concatenar se procede a concatenar las dos listas
boton_concatenar(press):- 
	
	read(Lista1,"Digite la primera lista: "),
	read(Lista2,"Digite La Segunda lista"),
	%esta es una etiqueta para la lista 1 y la 2
     text_out(50,100,"La Lista 1 es:"),	
	text_out(50,150,"La Lista 2 es:"),
     %esta es una caja de texto para la lista1 y la 2
     edit(G_lista,_,edit_func(_),"",235,100,150,25),
	set_text(print(Lista1), G_lista),
	edit(G_lista,_,edit_func(_),"",235,150,150,25),
	set_text(print(Lista2), G_lista),
	%Funci�n
	concatenar(Lista1,Lista2,Resultado),
	text_out(50,250,"La Lista resultante es:"),
	edit(G_lista,_,edit_func(_),"",235,250,150,25),
	set_text(print(Resultado), G_lista).


% al oprimir el bot�n multiplos se procede a mostrar y contar de la lista los multiplos de 5
boton_multiplos(press):-

	read(Lista,"Digite la lista de n�meros: "),
	%Esta es una etiqueta para la lista
	text_out(50,100,"La lista es: "),
	%Esta es una caja de texto para la lista
	edit(G_lista,_,edit_func(_),"",235,100,150,25),
	set_text(print(Lista),G_lista),
	%Funci�n
	multiplos(Lista,Lista_mult,Cant_mult,Cant_no_mult),
	text_out(50,200,"Lista multiplos de 5:"),
	text_out(50,250,"La cantidad de multiplos de 5 es:"),
	text_out(50,300,"La cantidad de no multiplos de 5 es:"),
	edit(G_lista,_,edit_func(_),"",235,200,150,25),
	set_text(print(Lista_mult), G_lista),
	edit(G_lista,_,edit_func(_),"",320,250,50,24),
	set_text(print(Cant_mult), G_lista),
	edit(G_lista,_,edit_func(_),"",320,300,50,24),
	set_text(print(Cant_no_mult), G_lista).


% al oprimir el bot�n iniciar se procede a mostrar las preguntas y sus respuestas
boton_iniciar(press):-

	%Esta es una etiqueta para la lista
	text_out(50,100,"Pregunta 1 "),
	text_out(50,150,"Pregunta 2 "),
	text_out(50,200,"Pregunta 3 "),
	text_out(50,250,"Pregunta 4").

	

	






	