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
incioConversacionAux(Lista,[]):-incioConversacion(Lista,[]),dietaSolicitada(Dieta),nivelEjercicio(Nivel),padecimientoSolicitado(Padecimiento),buscarDieta(Nombre,Dieta,Padecimiento,Nivel, Detalle).
incioConversacionAux(Lista,[]):-write("Saludo no detectado"),inicio().
incioConversacion(Lista,Vacio):-saludo(Lista,Resto),nombre(Resto,Vacio).
incioConversacion(Lista,Vacio):-saludo(Lista,Resto),horario(Resto,Vacio).
incioConversacion(Lista,Vacio):-saludo(Lista,Vacio).

% -------------------- Dietas --------------------%

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
%Clasificacion del nivel del usuario segun la cantidad de ejercicio que se hace a la semana
nivel('principiante',["0","1","2"]).
nivel('intermedio',["3","4"]).
nivel('avanzado',["5","6","7"]).


%Busca en el nivel en el que se encuentra el usuario
buscarNivel(Nivel,Cantidad):- nivel(Nivel,Cantidades), miembro(Cantidad, Cantidades).
miembro(X,[X|_]).
miembro(X,[_|Y]):- miembro(X,Y).

% Union

buscarDieta(Nombre,Dieta,Padecimiento,Nivel, Detalle):- dieta(Nombre,Dieta,PadecimientoAux,Nivel, Detalle),Padecimiento\=PadecimientoAux,write('Le recomiendo la siguiente dieta: '),nl,write('Nombre de la dieta: '),write(Nombre),nl,write('Dias a la semana de entrenamiento: '),nl,write(Detalle).
buscarDieta(Nombre,Dieta,Padecimiento,Nivel, Detalle):- write("Lo siento de momento no tengo ninguna dieta que se adapte a sus necesides"),nl.


%dieta(nombreDieta,Dieta, padecimientos,nivel,dias,detalle).

               %----------------- Dieta 1 -----------------%
               
dieta('Dieta 1',"keto", "NA",'principiante','
Puedes empezar con el siguiente plan alimenticio bajo en carbohidratos.\n
Desayuno:   2 huevos revueltos con 30g de jam�n y 30g de queso. \n
Merienda Media Ma�ana:  100g de zanahoria con aguacate. \n
Almuerzo: 1 pechuga de pollo a la parrilla con cebolla. \n
          6 tomates cherry. \n
          3 tazas de verduras mixtas y cocidas en aceite de oliva. \n
Merienda tarde: Rodajas de aguacate con tomate y sal. \n
Cena: 150g de salm�n al horno. \n
      100g de br�coli. \n').

               %----------------- Dieta 2 -----------------%
               
dieta('Dieta 2',"vegetariana", "diabetes",'principiante','
Puedes empezar con el siguiente plan alimenticio vegetariano.\n
Desayuno:   1 vaso de leche de soja. \n
            Galletas de avena. \n
            1 banano. \n
            Almendras. \n
Merienda Media Ma�ana:  Sandwich de pan integral con tofu, aguacate, tomate y lechuga. \n
                        Jugo de naranja. \n
Almuerzo:Lasa�a vegetariana de verduras . \n
Merienda tarde: Batido de banano con leche de coco y semillas de girasol. \n
Cena: Coliflor asada con espinacas, almendras y salsa de yogurt. \n
      Ensalada de vegetales frescos con semillas de ayote. \n').

               %----------------- Dieta 3 -----------------%

dieta('Dieta 3',"vegana", "dislipidemia",'principiante','
Puedes empezar con el siguiente plan alimenticio vegano.\n
Desayuno:   2 tostadas de pan integral. \n
            1 tomate rallado. \n
            Medio aguacate con or�gano. \n
            Semillas ch�a. \n
Merienda Media Ma�ana:  Jugo de naranja con zanahoria. \n
Almuerzo: Ensalada de hongos, espinaca y br�coli. \n
          Arroz con alcachofas. \n
Merienda tarde: 1 tostada integral con pur� de papa, cebolla y especias. \n
Cena: Fideos salteados con tofu y soja. \n').

               %----------------- Dieta 4 -----------------%

dieta('Dieta 4',"proteica", "celiquia",'principiante','
Puedes empezar con el siguiente plan alimenticio alto en prote�nas.\n
Desayuno:   100g de at�n. \n
            3 huevos. \n
            1 tomate picado con cebolla. \n
Merienda Media Ma�ana:  1 yogurt griego. \n
                        15 almendras. \n
Almuerzo: 300g de bistec de res. \n
          1 taza de br�coli. \n
          1 papa \n
          Media taza de zanahorias. \n
          Media taza de cebolla picada. \n
Merienda tarde: 1 taza de fruta. \n
Cena: 2 quesadillas de pollo. \n').

               %----------------- Dieta 5 -----------------%
      
dieta('Dieta 5',"NA", "obesidad",'principiante','
Puedes empezar con el siguiente plan alimenticio bajo en grasas.\n
Desayuno:   1 vaso de leche descremada. \n
            20g de pan. \n
            Medio banano. \n
            Media manzana. \n
Merienda Media Ma�ana:  . \n
Almuerzo: 40 g de pan. \n
          30 g de jam�n york. \n
          1 taza de caf�. \n
Merienda tarde: 20 g de pan. \n
                30 g de pechuga de pavo. \n
                1 taza de caf�. \n
Cena: Sopa de verduras (75 g de repollo, 25 g de zanahoria, 50 g de nabo, 50 g de puerro). \n
      100 g de pollo asado. \n
      30 g de arroz. \n
      20 g de pan. \n').
      
               %----------------- Dieta 6 -----------------%
      
dieta('Dieta 6',"keto", "NA",'intermedio','
Puedes empezar con el siguiente plan alimenticio bajo en carbohidratos.\n
Desayuno:   � aguacate picado en rodaja.\n
            2 huevos + rebanada de tocino.\n
            Preparar solo rociando aceite en spray (no oliva ni vegetal). \n
Merienda Ma�ana:  � pullado de semillas de girasol. \n
        � naranja picada. \n
Almuerzo: 2 tazas de ensalada Mixta.\n
          2-3 tortitas de coliflor.\n
          1 rebanada de pan keto.\n
Merienda tarde: 1 taza de caf� o t�. \n
                30g de mantequilla de man�. \n
                1 muffin keto de ar�ndanos. \n
Cena: � Tortilla de bacalao. \n
      1 lata de at�n mediana en agua. \n
      1 aguacate en trozos. \n
').

               %----------------- Dieta 7 -----------------%


dieta('Dieta 7',"vegetariana", "diabetes",'intermedio','
Puedes empezar con el siguiente plan alimenticio vegetariano. \n
Desayuno:   1 taza de leche de soya. \n
            Pullado de pipas de girasol. \n
            Banano en rebanadas. \n
Merienda Ma�ana:  � taza de leche de coco. \n
                  1 tostada de pan integral con mermelada. \n
Almuerzo: 1 taza de Espaguetis con frutos secos. \n
          � taza de sopa de quinua. \n
          1 higo. \n
Merienda tarde: 1 taza de jugo de naranja. \n
                1 bocadillo de tofu y tomate. \n
Cena: Ensalada de alga wakame con s�samo. \n
      � rebanada de pan integral con pure y aguacate.\n
').

               %----------------- Dieta 8 -----------------%

dieta('Dieta 8',"vegana", "dislipidemia",'intermedio','
Puedes empezar con el siguiente plan alimenticio vegano. \n
Desayuno: 1 smoothie bowl de pi�a y coco con frutos rojos. \n
          1 galleta de avena y manzana. \n
          � pieza de frutas fresca. \n
Merienda Ma�ana:  1 taz�n de leche de soya . \n
                  4-5 Almendras sin az�car y nueces. \n
Almuerzo: 2 Alb�ndigas veganas de br�coli con garbanzos y arroz. \n
          � taza de ensalada de vegetales. \n
          1 trozo de mandarina. \n
Merienda tarde: 1 vaso de bebida vegetal sin az�car. \n
                1 barrita de avena y frutos secos. \n
Cena:  Salteado r�pido de tofu y kale con s�samo. \n
       � pimiento relleno de soja texturizada. \n
').

               %----------------- Dieta 9 -----------------%

dieta('Dieta 9',"proteica", "celiaquia",'intermedio','
Puedes empezar con el siguiente plan alimenticio alto en prote�nas. \n
Desayuno: 2 huevos revueltos. \n
          2 galletas de trigo con mantequilla de man�. \n
          1 taza de caf�. \n
Merienda Ma�ana: � Banano . \n
                 1 galleta de prote�na Whey. \n
Almuerzo: 1 taza de Ensalada mixta. \n
          2 trozos de pechuga a la plancha. \n
          1 higo. \n
Merienda tarde: Batido de prote�na y creatina. \n
                3-4 Almendras sin az�car. \n
Cena: � taza de rodajas de tomate. \n
      1 � de Filet de pescado al horno. \n
      Papas salteadas con culantro. \n
').

               %----------------- Dieta 10 -----------------%

dieta('Dieta 10',"NA", "obesidad",'intermedio','
Puedes empezar con el siguiente plan alimenticio bajo en grasas. \n
Desayuno: 2 huevos revueltos con aguacate y tomate. \n
          Manzana en rebanadas. \n
Merienda Ma�ana:  � taza de t� verde. \n
                  1 bolsita de palitos de zanahoria. \n
Almuerzo: Estofado de ternera con verduras. \n
          � taza pejibayes. \n
Merienda tarde: 1 taza de caf� o t�. \n
                1 tostada con miel. \n
Cena:  Verduras al horno. \n
       Filet de res asado. \n
       1 tortilla de ma�z a la brasa. \n
').

               %----------------- Dieta 11 -----------------%

dieta('Dieta 11',"keto", "NA",'avanzado','
Puedes empezar con el siguiente plan alimenticio bajo en carbohidratos.\n
Desayuno:   Huevos revueltos con espinacas y salchicha fresca. \n
            2 huevos grandes + 1 cucharada de aceite de coco. \n
            30g queso mozzarella. \n
            1 salchicha de cerdo (aproximadamente 48 g). \n
            142,5 g de espinacas congeladas + 1,5 cucharadas de mantequilla.\n
Merienda Media Ma�ana:  1/2 aguacate (67 g) + 56 g de queso suizo. \n
Almuerzo: Salm�n a la parrilla y ensalada. \n
          115g de salm�n atl�ntico parrilla + 1 cucharada de mantequilla. \n
          2.5 tazas de ensalada variada (aproximadamente 200g). \n
          1 tomate mediano en trozos. \n
          20 g de cebolla picada. \n
          30g queso feta. \n
          8 aceitunas negras y verdes. \n
          1.5 cucharada de salsa de queso azul. \n
Merienda tarde: 30 gramos de frutos secos + 1 yogur griego. \n
Cena: Solomillo con hongos y vainicas salteadas. \n
      100g Solomillo de cerdo. \n
      2 cucharadas de aceite de oliva. \n
      80g de salteado de hongos: 1/4 taza. \n
      50 gramos vaincas frescas + 2 cucharadas aceite de coco. \n
      Postre: 1 gelatina sin az�car gelatina (120 g). \n').

               %----------------- Dieta 12 -----------------%

dieta('Dieta 12',"vegetariana", "diabetes",'avanzado','
Puedes empezar con el siguiente plan alimenticio vegetariano. \n
Desayuno:   2 tostadas integrales (40g) con una cucharada de aceite de oliva. \n
            1 vaso de batido de soya enriquecida, con una cucharadita de cacao en polvo. \n
            2 porciones de fruta. \n
Merienda Ma�ana:  2 pu�ados de frutos secos (40 g). \n
Almuerzo: Lentejas cocidas (80g), hierbas con aceite de oliva (1 cucharada). \n
          Falafel 120 g. \n
          Calabaza 75 g. \n
          Cebolla 25 g. \n
          Aceite de oliva (1 cucharadita). \n
          1 tomate mediano (150g) con aceite de oliva. \n
          4 rebanadas de 1/4 de pan integral (70 g). \n
          2 porciones de fruta. \n
          
Merienda tarde: Galletas (4 u.). \n
                2 yogures de soya, con dos cucharadas de postre con miel de ca�a. \n
Cena: Crema de Calabaza. \n
      Calabaza 250 g. \n
      Cebolla 30 g. \n
      Patata 100 g. \n
      Aceite de oliva 1 cucharada. \n
      Rollos Primvaera con flan de arroz. \n
      Rollitos de primavera 120g. \n
      Arroz 30 g. \n
      Aceite de oliva 1 cucharada. \n
      4 rebanadas de 1/4 de pan integral (70g). \n
Merienda despu�s de la cena: 1 taza de fruta. \n').

               %----------------- Dieta 13 -----------------%

dieta('Dieta 13',"vegana", "dislipidemia",'avanzado','
Puedes empezar con el siguiente plan alimenticio vegano.\n
Desayuno:   75g Copos de Avena. \n
            300ml de bebida de soja. \n
            Una manzana , o frutos rojos , fresas �. (o mix de frutas). \n
Merienda Media Ma�ana:  1 banano mediano/grande + 50g Mantequilla de man�, almendras, mara��n. \n
Almuerzo: Ensalada verde variada. \n
          1 manzana troceada. \n
          40gr de nueces. \n
          125gr de lentejas rojas o pasta de lentejas. \n
Merienda tarde: Batido de 45gr prote�na vegana y agua. \n
Cena: 100g de arroz basmati con br�coli, cebolla, pimiento, curry. \n
      200g de tofu sazonado con especias al gusto. \n
Merienda despu�s de la cena: 1 banano. \n').

               %----------------- Dieta 14 -----------------%

dieta('Dieta 14',"proteica", "celiaquia",'avanzado','
Puedes empezar con el siguiente plan alimenticio alto en prote�nas.\n
Desayuno:   Batido de naranja natural. \n
            1 tostada de mermelada. \n
Merienda Media Ma�ana:  S�ndwich de jam�n y queso. \n
                        1 porci�n de ensalada de at�n. \n
Almuerzo: 150g de carne de cerdo magra. \n
          1 taza de arroz hervido. \n
          Ensalada vegetales mixtos. \n
          1 pera. \n
Merienda tarde: 1 yogurt griego. \n
                15 almendras. \n
Cena: 100g Pasta con pechuga de pollo. \n
      Ensalada vegetales mixtos. \n
      Queso fresco. \n
Merienda despu�s de la cena: 1 taza de fruta. \n').

               %----------------- Dieta 15 -----------------%

dieta('Dieta 15',"NA", "obesidad",'avanzado','
Puedes empezar con el siguiente plan alimenticio bajo en grasas.\n
Desayuno:   180g de queso fresco 0%. \n
            100g de avena. \n
            1 vaso de leche semi descremada. \n
            4 nueces. \n
Merienda Media Ma�ana:  batido con 2 yogures naturales + 2 pl�tanos + 10 almendras crudas. \n
Almuerzo: 150g de pechuga de pavo. \n
          100g de pasta integral. \n
          200g ensalada mixta. \n
          Aceite de oliva. \n
Merienda tarde: 100g de pavo. \n
                2 rebanadas de pan integral. \n
                1 manzana. \n
Cena: brocoli cocido con 2 huevos cocidos. \n
      150 g de pechuga de pollo. \n
      100g de patata asada. \n
      200g ensalada de repollo y tomate. \n
Merienda despu�s de la cena: 1 manzana. \n').




%------------------ Programa ------------------%
/**
% Mensajes predeterminados
saludo:- write("NutriTEC: �Hola, encantado de ver que deseas mejorar tu estilo de vida! �En qu� te puedo ayudar? \n").
enfermedad:- write("�Tienes alguna enfermedad por la que has iniciado este proceso?\n").
calorias:- write("�Tienes pensado una cantidad espec�fica de calor�as diarias por consumir?\n").
actividad:- write("�Cu�ntas veces a la semana realizas actividad f�sica?\n").
tipoDieta:- write("�Tienes un tipo de dieta te gustar�a realizar?\n").
despedida:- write("�Con mucho gusto!\n").
  */


