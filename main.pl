% Cargar los datos de jugadores
:- consult('datos_jugadores.pl').

% Reglas para determinar si un jugador es diestro o zurdo
es_diestro :- not(es_zurdo).

% Reglas para determinar la posición general de un jugador
es_defensa :- es_li; es_ld; es_dfc.
es_mediocentro:- es_mc; es_mcd; es_mco.
es_delantero:- es_dc; es_ed; es_ei.

% Regla para calcular el promedio de goles por partido
goles_promedio(Jugador, GolesTemporada, PartidosJugados, Promedio) :-
    PartidosJugados > 0, % Evitar división por cero
    Promedio is GolesTemporada / PartidosJugados.

% Regla para calcular el promedio de Asistencias por partido
asistencias_promedio(Jugador, Asistencias, PartidosJugados, Promedio) :-
    PartidosJugados > 0, % Evitar división por cero
    Promedio is Asistencias / PartidosJugados.

% Regla para calcular el promedio de Regates por partido
regates_promedio(Jugador, Regates, PartidosJugados, Promedio) :-
    PartidosJugados > 0, % Evitar división por cero
    Promedio is Regates / PartidosJugados.

% Regla para calcular el promedio de Recuperaciones ganados por partido
duelos_ganados_promedio(Jugador, Recuperaciones, PartidosJugados, Promedio) :-
    PartidosJugados > 0, % Evitar división por cero
    Promedio is Recuperaciones / PartidosJugados.

% Regla para calcular el promedio de pases por partido
pases_promedio(Jugador, Pases_totales, PartidosJugados, Promedio) :-
    PartidosJugados > 0, % Evitar división por cero
    Promedio is Pases_totales / PartidosJugados.

% Regla para calcular el promedio de pases completados por partido
pases_completados_promedio(Jugador, Pases_completados, PartidosJugados, Promedio) :-
    PartidosJugados > 0, % Evitar división por cero
    Promedio is Pases_completados / PartidosJugados.

% Regla para calcular el promedio de Pases_clave por partido
pases_clave_promedio(Jugador, Pases_clave, PartidosJugados, Promedio) :-
    PartidosJugados > 0, % Evitar división por cero
    Promedio is Pases_clave / PartidosJugados.

% Regla para calcular el promedio de Intercepciones por partido
intercepciones_promedio(Jugador, Intercepciones, PartidosJugados, Promedio) :-
    PartidosJugados > 0, % Evitar división por cero
    Promedio is Intercepciones / PartidosJugados.

% Regla para calcular el promedio de Tarjetas_amarillas por partido
tarjetas_amarillas_promedio(Jugador, Tarjetas_amarillas, PartidosJugados, Promedio) :-
    PartidosJugados > 0, % Evitar división por cero
    Promedio is Tarjetas_amarillas / PartidosJugados.

% Regla para calcular el promedio de Tarjetas_rojas por partido
tarjetas_rojas_promedio(Jugador, Tarjetas_rojas, PartidosJugados, Promedio) :-
    PartidosJugados > 0, % Evitar división por cero
    Promedio is Tarjetas_rojas / PartidosJugados.