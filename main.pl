% Cargar los datos de jugadores
:- consult('datos_jugadores.pl').

% Predicados dinámicos para almacenar datos de jugadores
:- dynamic jugador/17.

% Reglas para seleccionar los mejores delanteros
mejores_delanteros([MejorDelantero]) :-
    findall(Jugador, (
        jugador(Jugador, delantero, _, _, _, _, _, _, _, _, _, _, _, _, _, _)
    ), Delanteros),
    mejor_jugador(Delanteros, GolesPromedio, Precision, MejorDelantero),
    goles_promedio(MejorDelantero, GolesPromedio),
    precision_tiro(MejorDelantero, Precision).

% Reglas para seleccionar los mejores defensores
mejores_defensores([MejorDefensa]) :-
    findall(Jugador, (
        jugador(Jugador, defensa, _, _, _, _, _, _, _, _, _, _, _, _, _, _)
    ), Defensas),
    mejor_jugador(Defensas, Regates, Intercepciones, Recuperacion, MejorDefensa),
    regates_exitosos(MejorDefensa, Regates),
    intercepciones_altas(MejorDefensa, Intercepciones),
    recuperacion_alta(MejorDefensa, Recuperacion).

% Reglas para seleccionar los mejores centrocampistas
mejores_centrocampistas([MejorCentrocampista]) :-
    findall(Jugador, (
        jugador(Jugador, centrocampista, _, _, _, _, _, _, _, _, _, _, _, _, _, _)
    ), Centrocampistas),
    mejor_jugador(Centrocampistas, PrecisionPases, Asistencias, Regates, Recuperacion, MejorCentrocampista),
    precision_pases_alta(MejorCentrocampista, PrecisionPases),
    asistencias_altas(MejorCentrocampista, Asistencias),
    regates_exitosos(MejorCentrocampista, Regates),
    recuperacion_alta_cc(MejorCentrocampista, Recuperacion).

% Reglas para seleccionar los mejores porteros
mejores_porteros([MejorPortero]) :-
    findall(Jugador, (
        jugador(Jugador, portero, _, _, _, _, _, _, _, _, _, _, _, _, _, _)
    ), Porteros),
    mejor_jugador(Porteros, Atajadas, Precision, MejorPortero),
    atajadas_altas(MejorPortero, Atajadas),
    precision_atajadas(MejorPortero, Precision).

% Regla para encontrar el jugador con los mejores valores en las características dadas
mejor_jugador([Jugador], _, _, _, Jugador).
mejor_jugador([Jugador|Resto], Valor1, Valor2, MejorJugador) :-
    mejor_jugador(Resto, Valor1Resto, Valor2Resto, OtroMejorJugador),
    jugador(Jugador, _, _, _, _, _, _, Valor1, _, Valor2, _, _, _, _, _),
    jugador(OtroMejorJugador, _, _, _, _, _, _, Valor1Resto, _, Valor2Resto, _, _, _, _, _),
    mejor_jugador_aux(Jugador, Valor1, Valor2, OtroMejorJugador, Valor1Resto, Valor2Resto, MejorJugador).

% Regla auxiliar para comparar los valores y determinar el mejor jugador
mejor_jugador_aux(Jugador1, Valor1, Valor2, _, Valor1Resto, Valor2Resto, MejorJugador) :-
    (Valor1 > Valor1Resto ; (Valor1 = Valor1Resto, Valor2 > Valor2Resto)),
    MejorJugador = Jugador1.
mejor_jugador_aux(_, _, _, Jugador, _, _, Jugador).

% Reglas auxiliares para evaluar características específicas de los delanteros
goles_promedio(Jugador, Promedio) :-
    jugador(Jugador, _, _, _, GolesTemporada, _, _, _, _, _, _, _, _, _, _),
    % Calcular el promedio de goles por partido (simplificado para este ejemplo)
    Promedio is GolesTemporada / 30. % Suponiendo una temporada de 30 partidos

precision_tiro(Jugador, Precision) :-
    % Suponiendo que esta información está disponible en tus datos de jugadores
    jugador(Jugador, _, _, _, _, _, _, Precision, _, _, _, _, _, _, _).

% Reglas auxiliares para evaluar características específicas de los defensores
regates_exitosos(Jugador, Regates) :-
    jugador(Jugador, _, _, _, _, _, _, _, _, _, Regates, _, _, _, _).

intercepciones_altas(Jugador, Intercepciones) :-
    jugador(Jugador, _, _,_, _, _, _, _, _, _, _, Intercepciones, _, _, _).

recuperacion_alta(Jugador, Recuperacion) :-
    jugador(Jugador, _, _, _, _, _, _, _, _, _, _, _, Recuperacion, _, _).

% Reglas auxiliares para evaluar características específicas de los centrocampistas
precision_pases_alta(Jugador, PrecisionPases) :-
    jugador(Jugador, _, _, _, _, _, _, _, _, PrecisionPases, _, _, _, _).

asistencias_altas(Jugador, Asistencias) :-
    jugador(Jugador, _, _, _, _, _, _, _, _, _, Asistencias, _, _, _).

recuperacion_alta_cc(Jugador, Recuperacion) :-
    jugador(Jugador, _, _, _, _, _, _, _, _, _, _, _, Recuperacion, _, _).

% Reglas auxiliares para evaluar características específicas de los porteros
atajadas_altas(Jugador, Atajadas) :-
    jugador(Jugador, _, _, _, _, _, _, _, Atajadas, _, _, _, _, _, _).

precision_atajadas(Jugador, PrecisionAtajadas) :-
    jugador(Jugador, _, _, _, _, _, _, _, _, _, _, PrecisionAtajadas, _, _, _).
