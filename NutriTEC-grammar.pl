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
iniciativa:- write("¡Excelente iniciativa! Estamos para asesorarte en todo lo que necesites.\n").
enfermedad:- write("¿Tienes alguna enfermedad por la que has iniciado este proceso?\n").
calorias:- write("¿Tienes pensado una cantidad específica de calorías diarias por consumir?\n").
actividad:- write("¿Cuántas veces a la semana realizas actividad física?\n").
tipoDieta:- write("¿Tienes un tipo de dieta te gustaría realizar?\n").
despedida:- write("¡Con mucho gusto!\n").

%------------------Programa------------------%
iniciar():- %RECIBIR HOLA NUTRITEC
            saludo,
            %RECIBIR RESPUESTA DEL SALUDO
            iniciativa,
            enfermedad,
            obtener_padecimiento(Padecimiento),
            calorias,
            obtener_cantidad_calorias(Calorias),
            actividad,
            obtener_cantidad_actividad_fisica(Dias),
            tipoDieta,
            %LE ASIGNA DIETA
            %Despedida del usuario
            despedida.

%---------Obtener el padecimiento que el usuario escribe en la oracion---------%

%busca si el padecimiento esta definido en el programa
encontrar_padecimiento(Padecimiento):- padecimiento(Padecimiento,_).

%Obtiene la respuesta del usuario con readln
obtener_padecimiento(Padecimiento):- write("Usuario: "),readln(Entrada), analizar_oracion_padecimiento(Entrada,Padecimiento),!.

%analiza la oracion para encontrar el padecimiento
analizar_oracion_padecimiento(Entrada,Padecimiento):- oracion(Entrada,[Padecimiento|_]),!.
analizar_oracion_padecimiento(Entrada,Padecimiento):- oracion(Entrada,Padecimiento).


%---------Obtienen la cantidad de calorias que el usuario escribe en la oracion---------%

%busca si la cantidad de calorias esta definida en el programa
encontrar_cantidad_calorias(Calorias):- calorias(Calorias,_).

%Obtiene la respuesta del usuario con readln
obtener_cantidad_calorias(Calorias):- write("Usuario: "),readln(Entrada), analizar_oracion_calorias(Entrada,Cantidad_calorias).

%analiza la oracion para encontrar el numero -> cantidad de calorias
analizar_oracion_calorias(Entrada,Cantidad_calorias):- oracion(Entrada,[Cantidad_calorias|_]).
analizar_oracion_calorias(Entrada,Cantidad_calorias):- getNumber(Entrada,Cantidad_calorias).


%-------------Analiza si la respuesta tiene un numero con la funcion number--------------%
encontrar_numero([N|X],N):-number(X).
encontrar_numero([_|X],Y):-encontrar_numero(X,Y).


/**Obtiene la cantidad de veces o dias (0-7) de actividad fisica que el usuario escribe en la oracion
   para determinar el nivel (principiante, intermedio, avanzado) en el que se clasificara al usuario*/
   
%Obtiene la respuesta del usuario con readln
obtener_cantidad_actividad_fisica(Dias):- write("Usuario: "),readln(Entrada), analizar_oracion_actividad_fisica(Entrada,Dias).

%analiza la oracion para encontrar el numero -> cantidad de dias o veces semanales
analizar_oracion_actividad_fisica(Entrada,Dias):- getNumber(Entrada,Dias).


