# Sistema de Evaluación de Jugadores de Fútbol
## Spanish Version

Este es un sistema desarrollado en Prolog para evaluar el rendimiento de jugadores de fútbol basándose en diversas métricas estadísticas. El sistema permite calcular el ranking de jugadores en diferentes posiciones, como porteros, defensas, mediocampistas y delanteros.

## Funcionalidades

El programa ofrece una variedad de funcionalidades diseñadas para facilitar la evaluación del rendimiento de los jugadores de fútbol:

- **Cálculo de ranking de porteros**: Esta función permite calcular el ranking de los porteros en función de una serie de métricas clave, como el promedio de goles encajados por partido, porcentaje de penaltis parados, cantidad de tarjetas rojas y amarillas recibidas, así como el número de intercepciones realizadas.

- **Cálculo de ranking de defensas**: Para los defensas, tanto centrales como laterales, el programa evalúa métricas como el número de intercepciones exitosas, duelos ganados, pases clave efectuados, porcentaje de pases completados con éxito, y la cantidad de tarjetas recibidas, para determinar su posición en el ranking.

- **Cálculo de ranking de mediocampistas**: Los mediocampistas son evaluados en base a su eficacia en la distribución del balón, su capacidad para recuperar posesión, su participación en la creación de oportunidades de gol, entre otras métricas relevantes.

- **Cálculo de ranking de delanteros**: Para los delanteros, el programa analiza métricas como el promedio de goles marcados por partido, porcentaje de regates exitosos, asistencias realizadas, efectividad en el remate al arco, y su capacidad para mantener la posesión del balón en situaciones de ataque.

- **Cálculo de métricas individuales**: Además de los rankings generales, el programa permite calcular una amplia gama de métricas individuales para cada jugador, lo que proporciona una visión detallada de su desempeño en áreas específicas como asistencias, regates, goles acertados, cantidad de pases por partido, minutos jugados por partido, entre otras.

Estas funcionalidades combinadas ofrecen una herramienta integral para evaluar y comparar el rendimiento de los jugadores de fútbol en diferentes posiciones y roles dentro del campo.


## Uso del Programa

1. **Instalación de Prolog**: Asegúrate de tener instalado un intérprete de Prolog en tu sistema. Puedes encontrar instrucciones de instalación en [este enlace](https://www.swi-prolog.org/Download.html).

2. **Ejecución del Programa**: Abre un intérprete de Prolog en la carpeta donde se encuentra el archivo del programa y ejecuta consultas para utilizar las funcionalidades proporcionadas.

3. **Ejemplo de Consulta**:
   ```prolog
   ?- ranking_porteros(_).
