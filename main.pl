% Cargar los datos de jugadores
:- consult('datos_jugadores.pl').

% Reglas para determinar si un jugador es diestro o zurdo
es_diestro :- not(es_zurdo).

% Reglas para determinar la posición general de un jugador
es_defensa :- es_li; es_ld; es_dfc.
es_mediocentro:- es_mc; es_mcd; es_mco.
es_delantero:- es_dc; es_ed; es_ei.



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
