% Cargar los datos de jugadores
:- consult('datos_jugadores.pl').

% Reglas para determinar si un jugador es diestro o zurdo
es_diestro :- not(es_zurdo).

% Regla para calcular el promedio de goles por partido
goles_promedio(Jugador, GolesTemporada, PartidosJugados, Promedio) :-
    PartidosJugados > 0, % Evitar división por cero
    Promedio is GolesTemporada / PartidosJugados.

% Regla para calcular el promedio de asistencias por partido
asistencias_promedio(Jugador, Asistencias, PartidosJugados, Promedio) :-
    PartidosJugados > 0, % Evitar división por cero
    Promedio is Asistencias / PartidosJugados.

    