/** ---------- Tarea 2 NutriTEC CE-3104 ----------

                    Gabriel Vargas
                    Yendry Badilla
                   Mauricio Calderon

    ----------                          ----------
*/

%----------------Importar archivos----------------%
:- consult(nutriGrammar).
:- consult(nutriTECdiets).
% :- [nutriGrammar, nutriTECdiets].

%-----------Mensajes predeterminados---------%
saludo:- write("NutriTEC: ¡Hola, encantado de ver que deseas mejorar tu estilo de vida! ¿En qué te puedo ayudar? \n").
iniciativa:- write("NutriTEC: ¡Excelente iniciativa! Estamos para asesorarte en todo lo que necesites.\n").
enfermedad:- write("NutriTEC: ¿Tienes alguna enfermedad por la que has iniciado este proceso?\n").
calorias:- write("NutriTEC: ¿Tienes pensado una cantidad específica de calorías diarias por consumir?\n").
actividad:- write("NutriTEC: ¿Cuántas veces a la semana realizas actividad física?\n").
tipoDieta:- write("NutriTEC: ¿Tienes algún tipo de dieta te gustaría realizar?\n").
despedida:- write("NutriTEC: ¡Hasta luego, fue un placer ayudarte!\n").
error_dieta:- write("NutriTEC: ¡Lo sentimos! No hemos encontrado una dieta que se ajuste a tus requirimientos :(\n").
error_palabra:- write("NutriTEC: ¡Disculpa, no hemos entendido tu mensaje! \n \t  ¿Podrías intentar con otra frase?\n"),!.

%---------Obtener el saludo que el usuario escribe en la oracion---------%

%Obtiene la respuesta del usuario con readln
obtener_saludo(Saludo):- write("Usuario: "),readln(Entrada), analizar_oracion_saludo(Entrada,Saludo),!.

%analiza la oracion
analizar_oracion_saludo(Entrada,Saludo):- saludo_inicial(Entrada,[Saludo|_]),!. %cut
analizar_oracion_saludo(Entrada,Saludo):- saludo_inicial(Entrada,Saludo).
analizar_oracion_saludo(Entrada,Saludo):- error_palabra, obtener_saludo(Saludo),!.

%------------Obtener respuesta de en que puede ayudar al usuario--------------%

%Obtiene la respuesta del usuario con readln
obtener_respuesta_ayuda(Ayuda):- write("Usuario: "),readln(Entrada), analizar_oracion_respuesta_ayuda(Entrada,Ayuda),!. %cut

%analiza la oracion
analizar_oracion_respuesta_ayuda(Entrada,Ayuda):- oracion_ayuda(Entrada,[Ayuda|_]),!. %cut
analizar_oracion_respuesta_ayuda(Entrada,Ayuda):- oracion_ayuda(Entrada,Ayuda),!.
analizar_oracion_respuesta_ayuda(Entrada,Ayuda):- error_palabra, saludo, obtener_respuesta_ayuda(Ayuda),!.


%---------Obtener el padecimiento que el usuario escribe en la oracion---------%

%Obtiene la respuesta del usuario con readln
obtener_padecimiento(Padecimiento):- write("Usuario: "),readln(Entrada), analizar_oracion_padecimiento(Entrada,Padecimiento),!.

%analiza la oracion para encontrar el padecimiento
analizar_oracion_padecimiento(Entrada,Padecimiento):- oracion(Entrada,[Padecimiento|_]),!.
analizar_oracion_padecimiento(Entrada,Padecimiento):- oracion(Entrada,Padecimiento).
analizar_oracion_padecimiento(Entrada,Padecimiento):- error_palabra, enfermedad, obtener_padecimiento(Padecimiento),!.

%-------------Analiza si la respuesta tiene un numero con la funcion number--------------%
encontrar_numero([N|X],N):-number(N).
encontrar_numero([_|X],Y):-encontrar_numero(X,Y).

%---------Obtienen la cantidad de calorias que el usuario escribe en la oracion---------%

%Obtiene la respuesta del usuario con readln
obtener_cantidad_calorias(Calorias):- write("Usuario: "),readln(Entrada), analizar_oracion_calorias(Entrada,Cantidad_calorias).

%analiza la oracion para encontrar el numero -> cantidad de calorias
analizar_oracion_calorias(Entrada,Cantidad_calorias):- oracion(Entrada,[Cantidad_calorias|_]).
analizar_oracion_calorias(Entrada,Cantidad_calorias):- encontrar_numero(Entrada,Cantidad_calorias).
analizar_oracion_calorias(Entrada,Cantidad_calorias):- error_palabra, calorias, obtener_cantidad_calorias(Calorias).


/**Obtiene la cantidad de veces o dias (0-7) de actividad fisica que el usuario escribe en la oracion
   para determinar el nivel (principiante, intermedio, avanzado) en el que se clasificara al usuario*/
   
%Obtiene la respuesta del usuario con readln
obtener_cantidad_actividad_fisica(Dias):- write("Usuario: "),readln(Entrada), analizar_oracion_actividad_fisica(Entrada,Dias).

%analiza la oracion para encontrar el numero (cantidad de dias o veces semanales)
analizar_oracion_actividad_fisica(Entrada,Dias):- encontrar_numero(Entrada,Dias).
analizar_oracion_actividad_fisica(Entrada,Dias):- error_palabra, actividad, obtener_cantidad_actividad_fisica(Dias).


%---------Obtener el tipo de dieta que el usuario escribe en la oracion---------%

%Obtiene la respuesta del usuario con readln
obtener_tipo_dieta(Tipo_Dieta):- write("Usuario: "),readln(Entrada), analizar_oracion_tipo_dieta(Entrada,Tipo_Dieta),!.

%analiza la oracion para encontrar el tipo de dieta que quiere
analizar_oracion_tipo_dieta(Entrada,Tipo_Dieta):- oracion(Entrada,[Tipo_Dieta|_]),!.
analizar_oracion_tipo_dieta(Entrada,Tipo_Dieta):- oracion(Entrada,Tipo_Dieta).
analizar_oracion_tipo_dieta(Entrada,Tipo_Dieta):- error_palabra, tipoDieta, obtener_tipo_dieta(Tipo_Dieta).


%---------Obtener la despedida que el usuario escribe en la oracion---------%

%Obtiene la respuesta del usuario con readln
obtener_despedida(Despedida):- write("Usuario: "),readln(Entrada), analizar_oracion_despedida(Entrada,Despedida),!.

%analiza la oracion
analizar_oracion_despedida(Entrada,Despedida):- despedida_final(Entrada,[Despedida|_]),!. %cut
analizar_oracion_despedida(Entrada,Despedida):- despedida_final(Entrada,Despedida).
analizar_oracion_despedida(Entrada,Despedida):- error_palabra, obtener_despedida(Despedida).

%funcion miembro de una lista
miembro(X,[X|_]).
miembro(X,[_|Y]):- miembro(X,Y).

% Busca en el nivel en el que se encuentra el usuario
buscarNivel(Nivel,Cantidad):- nivel(Nivel,Cantidades), miembro(Cantidad, Cantidades).

% Busca en el nivel en el que se encuentra el usuario
buscarCalorias(Nivel,Calorias):- nivel_calorias(Nivel,Cantidades), miembro(Calorias, Cantidades).

% Busca en el nivel en el que se encuentra el usuario
clasificar_dieta(Padecimiento, Dieta):- relacion_dieta_padecimiento(Padecimientos,Dieta), miembro(Padecimiento, Padecimientos).


%------------------------Asigna la dieta----------------------%
asignar_dieta(Padecimiento_elegido, Dias, Calorias):- padecimiento(Padecimiento_elegido,Padecimiento_asociado), buscarNivel(Nivel, Dias), buscarCalorias(Nivel, Calorias), clasificar_dieta(Padecimiento_elegido,Dieta), dieta(Dieta, Padecimiento_elegido, Nivel, Texto_Dieta), write(Texto_Dieta),!.
asignar_dieta(Padecimiento_elegido, Dias, Calorias):- error_dieta.


%--------------------------Programa---------------------------%
nutriTEC:- obtener_saludo(Saludo),saludo,
           obtener_respuesta_ayuda(Ayuda),iniciativa,
           enfermedad,obtener_padecimiento(Padecimiento_elegido),
           calorias,obtener_cantidad_calorias(Calorias),
           actividad,obtener_cantidad_actividad_fisica(Dias),
           tipoDieta,obtener_tipo_dieta(Tipo_Dieta),
           
           asignar_dieta(Padecimiento_elegido, Dias, Calorias),
           obtener_despedida(Despedida),despedida.
