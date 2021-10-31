/** ---------- Tarea 2 NutriTEC CE-3104 ----------

                    Gabriel Vargas
                    Yendry Badilla
                   Mauricio Calderon

    ----------                          ----------
*/

%----------------Importar archivos----------------%
 :- consult(nutriGrammar).
 :- consult(nutriTECdiets).

%-----------Mensajes predeterminados---------%
saludo:- write("NutriTEC: ¡Hola, encantado de ver que deseas mejorar tu estilo de vida! ¿En qué te puedo ayudar? \n").
iniciativa:- write("NutriTEC: ¡Excelente iniciativa! Estamos para asesorarte en todo lo que necesites.\n").
enfermedad:- write("NutriTEC: ¿Tienes alguna enfermedad por la que has iniciado este proceso?\n").
calorias:- write("NutriTEC: ¿Tienes pensado una cantidad específica de calorías diarias por consumir?\n").
actividad:- write("NutriTEC: ¿Cuántas veces a la semana realizas actividad física?\n").
tipoDieta:- write("NutriTEC: ¿Tienes algún tipo de dieta te gustaría realizar?\n").
despedida:- write("NutriTEC: ¡Hasta luego, fue un placer ayudarte!\n").

%---------Obtener el saludo que el usuario escribe en la oracion---------%

%Obtiene la respuesta del usuario con readln
obtener_saludo(Saludo):- write("Usuario: "),readln(Entrada), analizar_oracion_saludo(Entrada,Saludo),!.

%analiza la oracion
analizar_oracion_saludo(Entrada,Saludo):- saludo_inicial(Entrada,[Saludo|_]),!. %cut
analizar_oracion_saludo(Entrada,Saludo):- saludo_inicial(Entrada,Saludo).

%------------Obtener respuesta de en que puede ayudar al usuario--------------%

%Obtiene la respuesta del usuario con readln
obtener_respuesta_ayuda(Ayuda):- write("Usuario: "),readln(Entrada), analizar_oracion_respuesta_ayuda(Entrada,Ayuda),!. %cut

%analiza la oracion
analizar_oracion_respuesta_ayuda(Entrada,Ayuda):- oracion_ayuda(Entrada,[Ayuda|_]),!. %cut
analizar_oracion_respuesta_ayuda(Entrada,Ayuda):- oracion_ayuda(Entrada,Ayuda).


%---------Obtener el padecimiento que el usuario escribe en la oracion---------%

%Obtiene la respuesta del usuario con readln
obtener_padecimiento(Padecimiento):- write("Usuario: "),readln(Entrada), analizar_oracion_padecimiento(Entrada,Padecimiento),!.

%analiza la oracion para encontrar el padecimiento
analizar_oracion_padecimiento(Entrada,Padecimiento):- oracion(Entrada,[Padecimiento|_]),!.
analizar_oracion_padecimiento(Entrada,Padecimiento):- oracion(Entrada,Padecimiento).

%-------------Analiza si la respuesta tiene un numero con la funcion number--------------%
encontrar_numero([N|X],N):-number(N).
encontrar_numero([_|X],Y):-encontrar_numero(X,Y).

%---------Obtienen la cantidad de calorias que el usuario escribe en la oracion---------%

%Obtiene la respuesta del usuario con readln
obtener_cantidad_calorias(Calorias):- write("Usuario: "),readln(Entrada), analizar_oracion_calorias(Entrada,Cantidad_calorias).

%analiza la oracion para encontrar el numero -> cantidad de calorias
analizar_oracion_calorias(Entrada,Cantidad_calorias):- oracion(Entrada,[Cantidad_calorias|_]).
analizar_oracion_calorias(Entrada,Cantidad_calorias):- encontrar_numero(Entrada,Cantidad_calorias).


/**Obtiene la cantidad de veces o dias (0-7) de actividad fisica que el usuario escribe en la oracion
   para determinar el nivel (principiante, intermedio, avanzado) en el que se clasificara al usuario*/
   
%Obtiene la respuesta del usuario con readln
obtener_cantidad_actividad_fisica(Dias):- write("Usuario: "),readln(Entrada), analizar_oracion_actividad_fisica(Entrada,Dias).

%analiza la oracion para encontrar el numero (cantidad de dias o veces semanales)
analizar_oracion_actividad_fisica(Entrada,Dias):- encontrar_numero(Entrada,Dias).


%---------Obtener el tipo de dieta que el usuario escribe en la oracion---------%

%Obtiene la respuesta del usuario con readln
obtener_tipo_dieta(Dieta):- write("Usuario: "),readln(Entrada), analizar_oracion_tipo_dieta(Entrada,Dieta),!.

%analiza la oracion para encontrar el tipo de dieta que quiere
analizar_oracion_tipo_dieta(Entrada,Dieta):- oracion(Entrada,[Dieta|_]),!.
analizar_oracion_tipo_dieta(Entrada,Dieta):- oracion(Entrada,Dieta).


%---------Obtener la despedida que el usuario escribe en la oracion---------%

%Obtiene la respuesta del usuario con readln
obtener_despedida(Despedida):- write("Usuario: "),readln(Entrada), analizar_oracion_despedida(Entrada,Despedida),!.

%analiza la oracion
analizar_oracion_despedida(Entrada,Despedida):- despedida_final(Entrada,[Despedida|_]),!. %cut
analizar_oracion_despedida(Entrada,Despedida):- despedida_final(Entrada,Despedida).

%------------------Programa------------------%
iniciar():- obtener_saludo(Saludo),saludo,
            obtener_respuesta_ayuda(Ayuda),iniciativa,
            enfermedad,obtener_padecimiento(Padecimiento),
            calorias,obtener_cantidad_calorias(Calorias),
            actividad,obtener_cantidad_actividad_fisica(Dias),
            tipoDieta,obtener_tipo_dieta(Dieta),%LE ASIGNA LA DIETA
            obtener_despedida(Despedida),despedida.
