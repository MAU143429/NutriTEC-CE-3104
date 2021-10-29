/** ---------- Tarea 2 NutriTEC CE-3104 ----------

                    Gabriel Vargas
                    Yendry Badilla
                   Mauricio Calderon
                   
    ----------                          ----------
*/

%Reconocimiento de palabras
%Parte 1 de la conversacion, reconocimiento de saludo o ausencia de etse
%Comando para iniciar la conversacion.
inicio():- nl, read_string(user_input, '\n', '.', _, Str),string_lower(Str,LowerCase),atomic_list_concat(Lista, ' ', LowerCase),incioConversacionAux(Lista,[]).
incioConversacionAux(Lista,[]):-incioConversacion(Lista,[]),dietaSolicitada(Dieta),nivelEjercicio(Nivel),padecimientoSolicitado(Padecimiento),buscarDieta(Nombre,Dieta,Padecimiento,Nivel,Dias, Detalle).
incioConversacionAux(Lista,[]):-write("Saludo no detectado"),inicio().
incioConversacion(Lista,Vacio):-saludo(Lista,Resto),nombre(Resto,Vacio).
incioConversacion(Lista,Vacio):-saludo(Lista,Resto),horario(Resto,Vacio).
incioConversacion(Lista,Vacio):-saludo(Lista,Vacio).


%saludos aceptados por NutriTEC
saludo(['hola'|Lista],Lista).
saludo(['buenos'|Lista],Lista).
horario(['dias'|Lista],Lista).
horario(['tardes'|Lista],Lista).
horario(['noches'|Lista],Lista).
nombre(['NutriTEC'|Lista],Lista).

%Parte 2 de la conversacion, reconocimiento del tipo de Dieta
%Devuelve la Dieta ingresado por el usuario
dietaSolicitada(Dieta):- write("Tiene alguna preferencia de dieta?"), nl, read_string(user_input, '\n', '.', _, Str),string_lower(Str,LowerCase),atomic_list_concat(Lista, ' ', LowerCase),seleccion(Lista,[],Dieta).
dietaSolicitada(Dieta):- write("No he reconocido su respuesta, por favor pruebe con otra como por ejemplo: si/si keto"),nl,dietaSolicitada(Dieta).
seleccion(Lista,Vacio,Dieta):-afirmacion(Lista,Vacio),write('Puede escoger entre keto,vegetariana,proteica,vegana o NA'),opcionesDieta(Dieta).
seleccion(Lista,Vacio,Dieta):-negacion(Lista,Vacio),write('Adios'),nl,break.
seleccion(Lista,Vacio,Dieta):-afirmacion(Lista,Resto),Dieta(Resto,Vacio),atomics_to_string(Resto,Dieta).

opcionesDieta(LowerCase):- nl, read_string(user_input, '\n', '.', _, Str),string_lower(Str,LowerCase),atomic_list_concat(Dieta, ' ', LowerCase),dieta(Dieta,Vacio).

%Dietas reconocidos por NutriTEC
dieta(['keto'|Lista],Lista).
dieta(['vegana'|Lista],Lista).
dieta(['proteica'|Lista],Lista).
dieta(['vegetariana'|Lista],Lista).
dieta(['NA'|Lista],Lista).
afirmacion(['si'|Lista],Lista).
negacion(['no'|Lista],Lista).


%Parte 3 de la conversacion, reconocimieno de padecimientos.
%Devuelve el padecimiento que tiene el usuario
padecimientoSolicitado(Padecimiento):- write("Padece usted de alguna enfermedad que le impida hacer una dieta en especifico"), nl, read_string(user_input, '\n', '.', _, Str),string_lower(Str,LowerCase),atomic_list_concat(Lista, ' ', LowerCase),padecimientos(Lista,[],Padecimiento).
padecimientoSolicitado(Padecimiento):- write("No he reconocido su respuesta, por favor prube con otra como por ejemplo: dislipidemia/diabetes/celiaquia/obesidad/NA"),nl,padecimientoSolicitado(Padecimiento).
padecimientos(Lista,Vacio,Padecimiento):- afirmacion(Lista,Resto),padecimiento(Resto,Vacio),atomics_to_string(Resto,Padecimiento).
padecimientos(Lista,Vacio,Padecimiento):- afirmacion(Lista,Vacio),padecimientosAux(Padecimiento).
padecimientos(Lista,Vacio,Padecimiento):- padecimiento(Lista,Vacio),atomics_to_string(Lista,Padecimiento).

padecimientosAux(Str):- write('Que tipo de padecimientos posee?\n'),nl, read_string(user_input, '\n', '.', _, Str),string_lower(Str,LowerCase),atomic_list_concat(Padecimiento, ' ', LowerCase),padecimiento(Padecimiento,Vacio).

%Padecimientos reconocidos por NutriTEC
padecimiento(['celiquia'|Lista],Lista).
padecimiento(['diabetes'|Lista],Lista).
padecimiento(['dislipidemia'|Lista],Lista).
padecimiento(['obesidad'|Lista],Lista).
padecimiento(['NA'|Lista],Lista).
padecimiento(['no'|Lista],Lista).



nivelEjercicio(Nivel):- write('Cuantos dias a la semana hace ejercicio?'),nl ,read_string(user_input, '\n', '.', _, Cantidad), buscarNivel(Nivel,Cantidad).


%Base de Datos
%Clasificacion del nivel del usuario segun la cantidad de Dieta que se hace a la semana
nivel('principiante',["0","1","2"]).
nivel('intermedio',["3","4"]).
nivel('avanzado',["5","6","7"]).


%Busca en el nivel en el que se encuentra el usuario
buscarNivel(Nivel,Cantidad):- nivel(Nivel,Cantidades), miembro(Cantidad, Cantidades).
miembro(X,[X|_]).
miembro(X,[_|Y]):- miembro(X,Y).


%dieta(nombreDieta,Dieta, padecimientos,nivel,dias,detalle).


dieta('Dieta 6',"keto", "NA",'intermedio',1,'
Puedes empezar con el siguiente plan alimenticio bajo en carbohidratos.\n
Desayuno:   ½ aguacate picado en rodaja.\n
            2 huevos + rebanada de tocino.\n
            Preparar solo rociando aceite en spray (no oliva ni vegetal). \n
Merienda Mañana:  ¼ pullado de semillas de girasol. \n
        ½ naranja picada. \n
Almuerzo: 2 tazas de ensalada Mixta.\n
          2-3 hash Browns o tortitas de coliflor.\n
          1 rebanada de pan keto.\n
Merienda tarde: 1 taza de café o té. \n
                30g de mantequilla de maní. \n
                1 muffin keto de arándanos. \n
Cena: ½ Tortilla de bacalao. \n
      1 lata de atún mediana en agua. \n
      1 aguacate en trozos. \n
').

dieta('Dieta 7',"vegetariana", "celiaquia",'intermedio',2,'
Puedes empezar con el siguiente plan alimenticio vegetariano. \n
Desayuno:   1 taza de leche de soya. \n
            Pullado de pipas de girasol. \n
            Banano en rebanadas. \n
Merienda Mañana:  ½ taza de leche de coco. \n
                  1 tostada de pan integral con mermelada. \n
Almuerzo: 1 taza de Espaguetis con frutos secos. \n
          ½ taza de sopa de quinua. \n
          1 higo. \n
Merienda tarde: 1 taza de jugo de naranja. \n
                1 bocadillo de tofu y tomate. \n
Cena: Ensalada de alga wakame con sésamo. \n
      ½ rebanada de pan integral con pure y aguacate.\n
').

dieta('Dieta 8',"vegana", "dislipidemia",'intermedio',4,'
Puedes empezar con el siguiente plan alimenticio vegano. \n
Desayuno: 1 smoothie bowl de piña y coco con frutos rojos. \n
          1 galleta de avena y manzana. \n
          ½ pieza de frutas fresca. \n
Merienda Mañana:  1 tazón de leche de soya . \n
                  4-5 Almendras sin azúcar y nueces. \n
Almuerzo: 2 Albóndigas veganas de brócoli con garbanzos y arroz. \n
          ½ taza de ensalada de vegetales. \n
          1 trozo de mandarina. \n
Merienda tarde: 1 vaso de bebida vegetal sin azúcar. \n
                1 barrita de avena y frutos secos. \n
Cena:  Salteado rápido de tofu y kale con sésamo. \n
       ½ pimiento relleno de soja texturizada. \n
').

dieta('Dieta 9',"proteica", "diabetes",'intermedio',4,'
Puedes empezar con el siguiente plan alimenticio alto en proteínas. \n
Desayuno: 2 huevos revueltos. \n
          2 galletas de trigo con mantequilla de maní. \n
          1 taza de café. \n
Merienda Mañana: ½ Banano . \n
                 1 galleta de proteína Whey. \n
Almuerzo: 1 taza de Ensalada mixta. \n
          2 trozos de pechuga a la plancha. \n
          1 higo. \n
Merienda tarde: Batido de proteína y creatina. \n
                3-4 Almendras sin azúcar. \n
Cena: ½ taza de rodajas de tomate. \n
      1 ½ de Filet de pescado al horno. \n
      Papas salteadas con culantro. \n
').

dieta('Dieta 10',"NA", "obesidad",'intermedio',5,'
Puedes empezar con el siguiente plan alimenticio bajo en grasas. \n
Desayuno: 2 huevos revueltos con aguacate y tomate. \n
          Manzana en rebanadas. \n
Merienda Mañana:  ½ taza de té verde. \n
                  1 bolsita de palitos de zanahoria. \n
Almuerzo: Estofado de ternera con verduras. \n
          ½ taza pejibayes. \n
Merienda tarde: 1 taza de café o té. \n
                1 tostada con miel. \n
Cena:  Verduras al horno. \n
       Filet de res asado. \n
       1 tortilla de maíz a la brasa. \n
').

% Union

buscarDieta(Nombre,Dieta,Padecimiento,Nivel,Dias, Detalle):- dieta(Nombre,Dieta,PadecimientoAux,Nivel,Dias, Detalle),Padecimiento\=PadecimientoAux,write('Le recomiendo la siguiente dieta: '),nl,write('Nombre de la dieta: '),write(Nombre),nl,write('Dias a la semana de entrenamiento: '),write(Dias),nl,write(Detalle).
buscarDieta(Nombre,Dieta,Padecimiento,Nivel,Dias, Detalle):- write("Lo siento de momento no tengo ninguna dieta que se adapte a sus necesides"),nl.
