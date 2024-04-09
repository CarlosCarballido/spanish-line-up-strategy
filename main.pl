% Reglas
es_delantero(Jugador) :- jugador(delantero, Jugador, ataque, defensa, velocidad).
es_defensa(Jugador) :- jugador(defensa, Jugador, ataque, defensa, velocidad).
es_medio(Jugador) :- jugador(medio, Jugador, ataque, defensa, velocidad).
es_portero(Jugador) :- jugador(portero, Jugador, ataque, defensa, velocidad).