% Cargar los datos de jugadores
:- consult('datos_jugadores.pl').

% Reglas para determinar si un jugador es diestro o zurdo
es_diestro :- not(es_zurdo).

% Reglas para determinar la posición general de un jugador
es_defensa :- es_li; es_ld; es_dfc.
es_mediocentro:- es_mc; es_mcd; es_mco.
es_delantero:- es_dc; es_ed; es_ei.

% Regla para determinar el promedio de minutos por partido
minutos_promedio(Jugador, MinutosJugados, PartidosJugados, Promedio) :-
    PartidosJugados > 0, % Evitar división por cero
    Promedio is MinutosJugados / PartidosJugados.

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

% Regla para calcular el promedio de Goles_encajados por partido
goles_encajados_promedio(Jugador, Goles_encajados, PartidosJugados, Promedio) :-
    PartidosJugados > 0, % Evitar división por cero
    Promedio is Goles_encajados / PartidosJugados.

% Regla para calcular el promedio de Penaltis_parados por partido
penaltis_parados_promedio(Jugador, Penaltis_parados, PartidosJugados, Promedio) :-
    PartidosJugados > 0, % Evitar división por cero
    Promedio is Penaltis_parados / PartidosJugados.

% Regla para calcular el promedio de Goles_pp por partido
goles_pp_promedio(Jugador, Goles_pp, PartidosJugados, Promedio) :-
    PartidosJugados > 0, % Evitar división por cero
    Promedio is Goles_pp / PartidosJugados.

% Regla para calcular el promedio de Penaltis por partido
penaltis_promedio(Jugador, Penaltis, PartidosJugados, Promedio) :-
    PartidosJugados > 0, % Evitar división por cero
    Promedio is Penaltis / PartidosJugados.

rp(Jugador, Goles_encajados, Penaltis_promedio, Penaltis_parados_promedio, Duelos_ganados_promedio, Partidos_jugados):-
    Goles_encajados(Jugador, Goles_encajados, PartidosJugados, Promedio),
    



% Regla para calcular el ranking de porteros
ranking_porteros(Jugador, Goles_encajados, penaltis_promedio, penaltis_parados_promedio, duelos_ganados_promedio, pases_promedio, pases_completados_promedio, pases_clave_promedio, intercepciones_promedio, tarjetas_amarillas_promedio, tarjetas_rojas_promedio, goles_pp_promedio, Ranking) :-
    Partidos_jugados > 0, % Evitar división por cero
    Ranking is 2 * (penaltis_promedio - penaltis_parados_promedio) - Goles_encajados + duelos_ganados_promedio + (pases_promedio - pases_completados_promedio) + pases_clave_promedio + intercepciones_promedio - tarjetas_amarillas_promedio - tarjetas_rojas_promedio - goles_pp_promedio.

% Regla para calcular el ranking de jugadores defensas
ranking_defensas(Jugador, goles_pp_promedio, minutos_promedio, asistencias_promedio, regates_promedio, duelos_ganados_promedio, pases_promedio, pases_completados_promedio, pases_clave_promedio, intercepciones_promedio, tarjetas_amarillas_promedio, tarjetas_rojas_promedio, Ranking) :-
    minutos_promedio > 0, % Evitar división por cero
    es_defensa,
    Ranking is asistencias_promedio + regates_promedio + 2 * duelos_ganados_promedio + 1.7 * (pases_promedio - pases_completados_promedio) + 1.5 * pases_clave_promedio + 2 * intercepciones_promedio + (0.1 * minutos_promedio) - 3 * tarjetas_amarillas_promedio - 3 *tarjetas_rojas_promedio - 3 *goles_pp_promedio.

% Regla para calcular el ranking de jugadores mediocentros
ranking_mediocentros(Jugador, goles_pp_promedio, minutos_promedio, asistencias_promedio, regates_promedio, duelos_ganados_promedio, pases_promedio, pases_completados_promedio, pases_clave_promedio, intercepciones_promedio, tarjetas_amarillas_promedio, tarjetas_rojas_promedio, Ranking) :-
    minutos_promedio > 0, % Evitar división por cero
    es_mediocentro,
    Ranking is 1.7 * asistencias_promedio + 1.5 * regates_promedio + 1.7 * duelos_ganados_promedio + 2 * (pases_promedio - pases_completados_promedio) + 2 * pases_clave_promedio + 2 * intercepciones_promedio + (0.1 * minutos_promedio) - 2 * tarjetas_amarillas_promedio - 2 * tarjetas_rojas_promedio - 1.5 * goles_pp_promedio.

% Regla para calcular el ranking de jugadores delanteros
ranking_delanteros(Jugador, goles_pp_promedio, minutos_promedio, asistencias_promedio, regates_promedio, duelos_ganados_promedio, pases_promedio, pases_completados_promedio, pases_clave_promedio, intercepciones_promedio, tarjetas_amarillas_promedio, tarjetas_rojas_promedio, Ranking) :-
    minutos_promedio > 0, % Evitar división por cero
    es_delantero,
    Ranking is 1.5 * asistencias_promedio + 1.5 * regates_promedio + 1.7 * duelos_ganados_promedio + 1.2 * (pases_promedio - pases_completados_promedio) + 1.7 * pases_clave_promedio + 1.2 * intercepciones_promedio + (0.1 * minutos_promedio) - tarjetas_amarillas_promedio - tarjetas_rojas_promedio - goles_pp_promedio.
