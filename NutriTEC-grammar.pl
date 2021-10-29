/** ---------- Tarea 2 NutriTEC CE-3104 ----------

                    Gabriel Vargas
                    Yendry Badilla
                   Mauricio Calderon

    ----------                          ----------
*/

%----------------Importar archivos----------------%
 :- [NutriGrammar, NutriTEC-diets].
 


%-----------Mensajes predeterminados---------%
saludo:- write("NutriTEC: ¡Hola, encantado de ver que deseas mejorar tu estilo de vida! ¿En qué te puedo ayudar? \n").
enfermedad:- write("¿Tienes alguna enfermedad por la que has iniciado este proceso?\n").
calorias:- write("¿Tienes pensado una cantidad específica de calorías diarias por consumir?\n").
actividad:- write("¿Cuántas veces a la semana realizas actividad física?\n").
tipoDieta:- write("¿Tienes un tipo de dieta te gustaría realizar?\n").
despedida:- write("¡Con mucho gusto!\n").

%------------------Programa------------------%
iniciar():- %RECIBIR HOLA NUTRITEC
            saludo,
            %
            pregunta_ejercicio(Ejercicio),
            write("Mr Trainer: Me parece muy buena su iniciativa"),nl,
            pregunta_frecuencia_realiza_AF(Frecuencia),
            pregunta_padecimiento(Padecimiento),
            pregunta_dias_descanso(DiasDescanso),
            consulta(Ejercicio,Padecimiento,DiasDescanso,Nivel,Rutina),
            write(Nivel),nl,write(Rutina),nl,nl,
            despedida_del_usuario(Despedida).

% Recolecta el ejercio dentro de una oracion
%
respuesta_usuario_ejercicios(Respuesta,Ejercicio):- oracion(Respuesta,[Ejercicio|_]).


% Recolecta el padecimiento que tiene el usuario
%
respuesta_usuario_padecimiento(Respuesta,Padecimiento):- oracion(Respuesta,[Padecimiento|_]),!.

respuesta_usuario_padecimiento(Respuesta,Padecimiento):- oracion(Respuesta,Padecimiento).



% Recolecta la frecuencia que el usuario realiza ejercicio a la semana
%
respuesta_usuario_frecuencia(Respuesta,Frecuencia):- getNumber(Respuesta,Frecuencia),1>Frecuencia,mensajeErrorFrecuenciaPoco.

respuesta_usuario_frecuencia(Respuesta,Frecuencia):- getNumber(Respuesta,Frecuencia),Frecuencia>6,mensajeErrorFrecuenciaMucho.

respuesta_usuario_frecuencia(Respuesta,Frecuencia):- getNumber(Respuesta,Frecuencia).

iniciar()
