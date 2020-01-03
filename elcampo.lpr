program elcampo;
 uses crt,dos,sysutils,
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes;   // librerias;

  var
  f:textfile; // var de tipo texto
  linetxt:string;


  var salir:boolean;
    // EJEMPLO PARA APLICAR A PROYECTO FACTURA

  //cosas de guardar


// PRECIOS PRODUCTOS

   const precio_cafe=500;
   const precio_cacao=1000;
   const precio_azucar=800;
   const precio_arroz=700;
   const precio_lentejas=600;
   const precio_espaguetti=1500;
   const precio_leche=1500;
   const precio_harina=2000;
   const precio_avena=1800;
   const precio_fororo=1000;



     // GUARDAR DATOS INICIO
     var conteo_facturas,conteo_ventas:integer;




     type
     TRProductos = RECORD
     nombre_p:string;
     cantidad_p,codigo_p:integer;
     total_p,precio,mi_costo:real;
  end;

 TProductos = array[1..10] of TRProductos;
  var productos:TProductos;
 //iniciar Sesion


  var
    opc:integer; {variable global }
    var datos,operacion:integer;
      var fila: integer;  // posicion de arrays para gotoxy


        // C O M P R A
               var contador:integer; // hasta para el ciclo for del array
                var iva_operacion:real;


        // M E N U
           var seguir: boolean; // ciclo while menu
           var seleccion:integer; //seleccion
           var i,k:integer; // GLOBAL


        // ver proceso

             // ADMIN
         var admin_entrada:boolean;
           var opciones_admin:string;


 var clave:string;
  var intentos:boolean;

 // contador global

   const iva=0.13;
     // posicion de arrays para gotoxy


 // datos de clientes

   var cedula_c,metodo_pago:integer;
   var supago:string;

          // operador
           var nombre_operador,direccion_c,nombre_c:string;



     // F A C T U R A C I O N
            var nro_factura:integer;
            var subtotal: real;
            var    a, m, d, ds : word;   {fecha}
                    h, mm, s, ns : word; {hora}



                 var cant_p,carrito:integer;  // carrito

                  var  existe_cafe,existe_cacao,existe_azucar,existe_arroz,existe_lentejas,existe_espaguetti,existe_leche,existe_harina,existe_avena,existe_fororo:boolean;

                  // animacion preloader
                          var p,n,columnas:integer;

 begin
 clrscr;
 textcolor(15);
 gotoxy(13,10);

 intentos:=true;
 i:=0;







 while intentos=true do
 begin
 writeln('--- Ingresa Los Credenciales Para Ingresar Al Sistema ---');
 writeln;
 textcolor(11);
 write('> ');
 textcolor(15);
 readln(clave);
 if clave=('cisco') then

 intentos:=false

 else
 begin
  i:=i+1;   // intentos

 if i=3 then
 begin
 textcolor(12);
 writeln('Lo siento, intenta denuevo mas tarde..');
 readkey;
 textcolor(15);

halt;  // salir
 end;
   end;
    end;
   clrscr;


textcolor(11);
columnas:=4;
for p:=1 to 70 do
begin
gotoxy(columnas,8);
writeln('-_-_-_-_-_');
delay(3);
columnas:=columnas+1;
clrscr;
end;
for n:=70 downto 1 do
begin
gotoxy(columnas,8);
writeln('-_-_-_-_-_');
delay(3);
columnas:=columnas-1;
clrscr;
end;
 clrscr;


  textcolor(18);
  writeln;
  writeln('>> Has Ingresado Sastifactoriamente');
 textcolor(15);
       writeln;
       writeln('Nombre De Operador: ');
       read(nombre_operador);
       clrscr;
       gotoxy(13,1);
 writeln('--- Bienvenido al Sistema EL CAMPO C.A ---');


 seguir:=true;
 nro_factura:=1;
  i:=i+1;
 // M E N U

 while seguir=true do
 begin

 gotoxy(13,3);
 writeln('Seleccione un producto');

 textcolor(15);
 gotoxy(13,4);
 writeln('Cafe');
 gotoxy(40,4);
 textcolor(11);
 write('[1]');

 textcolor(15);
 gotoxy(13,5);
 writeln('Cacao');
 gotoxy(40,5);
 textcolor(11);
 write('[2]');

 textcolor(15);
 gotoxy(13,6);
 writeln('Azucar');
 gotoxy(40,6);
 textcolor(11);
 write('[3]');

 textcolor(15);
 gotoxy(13,7);
 writeln('Arroz');
 gotoxy(40,7);
 textcolor(11);
 write('[4]');

 textcolor(15);
 gotoxy(13,8);
 writeln('Lentejas');
 gotoxy(40,8);
 textcolor(11);
 write('[5]');

 textcolor(15);
 gotoxy(13,9);
 writeln('Espaguetti');
 gotoxy(40,9);
 textcolor(11);
 write('[6]');

 textcolor(15);
 gotoxy(13,10);
 writeln('Leche');
 gotoxy(40,10);
 textcolor(11);
 write('[7]');

 textcolor(15);
 gotoxy(13,11);
 writeln('Harina Pan');
 gotoxy(40,11);
 textcolor(11);
 write('[8]');

 textcolor(15);
 gotoxy(13,12);
 writeln('Avena');
 gotoxy(40,12);
 textcolor(11);
 write('[9]');

 textcolor(15);
 gotoxy(13,13);
 writeln('Fororo');
 gotoxy(40,13);
 textcolor(11);
 write('[10]');

 textcolor(18);
 gotoxy(13,15);
 writeln('-- Pagar En Caja - - >');

 textcolor(11);
 gotoxy(40,15);
 write('[11]');
 writeln;
 write('> ');
 textcolor(11);
 gotoxy(55,4);
 writeln('Modo Admin [99]');
 textcolor(15);
 gotoxy(4,16);
 read(seleccion);



 // MODO ADMIN

 if seleccion=99 then
 begin

  clrscr;
 textcolor(15);
 gotoxy(13,10);

 intentos:=true;
 i:=0;
 while intentos=true do
 begin
 writeln('--- Ingresar Al Modo Admin ---');
 writeln;
 textcolor(11);
 write('> ');
 textcolor(15);
 readln(clave);
 if clave=('cisco') then
 intentos:=false
 else
 begin
  i:=i+1;

 if i=3 then
 begin
 textcolor(12);
 writeln('Lo siento, intenta denuevo mas tarde..');
 readkey;
 textcolor(15);
halt;  // salir
 end;
   end;
    end;
  clrscr;
  textcolor(18);

  begin
  writeln;
  writeln('>> Has Ingresado Sastifactoriamente');
 textcolor(15);
       writeln;
       writeln('MENU DE OPCIONES ');
       writeln;
       writeln('Ver Dashboard  [ver]');
       writeln;

       read(opciones_admin);



  if opciones_admin=('ver') then
  begin
    clrscr;
   //leer factura
  assignfile(f, 'bloc_archivo.txt');
  try
    reset(f);
    while not eof(f) do
    begin

      readln(f, linetxt);

      writeln(linetxt);

    end;

    close(f);
    readkey;
    writeln;
    writeln('Presiona Una Tecla Para Continuar..');
    clrscr;
  except
    writeln('Error de archivo');
  end;
   end;

  end;
  end;

 // FIN MODO ADMIN








 // C A F E

 if seleccion=1 then

  begin

  clrscr;
  textcolor(11);
  writeln;
  writeln('>> Has Seleccionado Cafe');
  writeln;
  textcolor(15);
  writeln('Cuanto Desea Llevar?, 1kg = 500 Bs');
  write('> ');
  write;
  read(cant_p);
  carrito:=precio_cafe*cant_p;
  contador:=contador+1; // cuantos productos diferentes llevo

  // Si ya esta listado nuestro producto recorremos con for el arreglo y remplazamos los valores
  if existe_cafe=true then
  for k:=1 to 10 do
  begin
  if productos[k].nombre_p='Cafe' then
  begin

  productos[k].cantidad_p:=(productos[k].cantidad_p+cant_p);   // sumanos cantidad pasada y presente
  productos[k].precio:=(productos[k].cantidad_p*precio_cafe);        // obtenemos el valor nuevo de compra
  contador:=contador-1;                                      // dejo igual el aumento del for final por escoger mismo producto

  clrscr;
  textcolor(15);
  gotoxy(12,25);
  textcolor(128);
  write('>');
  gotoxy(13,25);
  write('>');
  gotoxy(14,25);
  write('>');
  textcolor(15);
   writeln('   Llevas en el carrito: ',productos[k].precio:0:2,(' BS Con Cafe'));

  end
  end

  else
  begin
  productos[i].nombre_p:='Cafe';       // detalle
  productos[i].cantidad_p:=cant_p;    // cantidad
  productos[i].precio:=carrito;      // precio
  productos[i].codigo_p:=1982;      // codigo de producto
  productos[i].mi_costo:=500;      // asignamos el costo de cada producto
  existe_cafe:=true;              // declaramos que ya escogimos producto

  clrscr; // limpiar pantalla

  textcolor(15);
  gotoxy(12,25);
  textcolor(128);
  write('>');
  gotoxy(13,25);
  write('>');
  gotoxy(14,25);
  write('>');
  textcolor(15);
   writeln('   Llevas en el carrito: ',productos[i].precio:0:2,(' BS Con Cafe'));
   i:=i+1; // mover posicion al array productos

end;
  end;

  // C A C A O

  if seleccion=2 then

  begin

  clrscr;
  textcolor(11);
  writeln;
  writeln('>> Has Seleccionado Cacao');
  writeln;
  textcolor(15);
  writeln('Cuanto Desea Llevar?, 1kg = 1000 Bs');
  write('> ');
  write;
  read(cant_p);
  carrito:=precio_cacao*cant_p;
  contador:=contador+1; // cuantos productos diferentes llevo

  // Si ya esta listado nuestro producto recorremos con for el arreglo y remplazamos los valores
  if existe_cacao=true then
  for k:=1 to 10 do
  begin
  if productos[k].nombre_p='Cacao' then
  begin

  productos[k].cantidad_p:=(productos[k].cantidad_p+cant_p);   // sumanos cantidad pasada y presente
  productos[k].precio:=(productos[k].cantidad_p*precio_cacao);        // obtenemos el valor nuevo de compra
  contador:=contador-1;                                      // dejo igual el aumento del for final por escoger mismo producto

  clrscr;
  textcolor(15);
  gotoxy(12,25);
  textcolor(128);
  write('>');
  gotoxy(13,25);
  write('>');
  gotoxy(14,25);
  write('>');
  textcolor(15);
   writeln('   Llevas en el carrito: ',productos[k].precio:0:2,(' BS Con Cacao'));

  end
  end

  else
  begin
  productos[i].nombre_p:='Cacao';      // detalle
  productos[i].cantidad_p:=cant_p;    // cantidad
  productos[i].precio:=carrito;      // precio
  productos[i].codigo_p:=2412;      // codigo de producto
  productos[i].mi_costo:=1000;     // asignamos el costo de cada producto
  existe_cacao:=true;             // declaramos que ya escogimos producto


  clrscr; // limpiar pantalla

  textcolor(15);
  gotoxy(12,25);
  textcolor(128);
  write('>');
  gotoxy(13,25);
  write('>');
  gotoxy(14,25);
  write('>');
  textcolor(15);
   writeln('   Llevas en el carrito: ',productos[i].precio:0:2,(' BS Con Cacao'));
   i:=i+1; // mover posicion al array productos

end;
  end;


 // A Z U C A R

  if seleccion=3 then

   begin

   clrscr;
   textcolor(11);
   writeln;
   writeln('>> Has Seleccionado Azucar');
   writeln;
   textcolor(15);
   writeln('Cuanto Desea Llevar?, 1kg = 800 Bs');
   write('> ');
   write;
   read(cant_p);
   carrito:=precio_azucar*cant_p;
   contador:=contador+1; // cuantos productos diferentes llevo

   // Si ya esta listado nuestro producto recorremos con for el arreglo y remplazamos los valores
   if existe_azucar=true then
   for k:=1 to 10 do
   begin
   if productos[k].nombre_p='Azucar' then
   begin

   productos[k].cantidad_p:=(productos[k].cantidad_p+cant_p);   // sumanos cantidad pasada y presente
   productos[k].precio:=(productos[k].cantidad_p*precio_azucar);        // obtenemos el valor nuevo de compra
   contador:=contador-1;                                      // dejo igual el aumento del for final por escoger mismo producto

   clrscr;
   textcolor(15);
   gotoxy(12,25);
   textcolor(128);
   write('>');
   gotoxy(13,25);
   write('>');
   gotoxy(14,25);
   write('>');
   textcolor(15);
    writeln('   Llevas en el carrito: ',productos[k].precio:0:2,(' BS Con Azucar'));

   end
   end

   else
   begin
   productos[i].nombre_p:='Azucar';      // detalle
   productos[i].cantidad_p:=cant_p;     // cantidad
   productos[i].precio:=carrito;       // precio
   productos[i].codigo_p:=3412;       // codigo de producto
   productos[i].mi_costo:=800;       // asignamos el costo de cada producto
   existe_azucar:=true;             // declaramos que ya escogimos producto

   clrscr; // limpiar pantalla

   textcolor(15);
   gotoxy(12,25);
   textcolor(128);
   write('>');
   gotoxy(13,25);
   write('>');
   gotoxy(14,25);
   write('>');
   textcolor(15);
    writeln('   Llevas en el carrito: ',productos[i].precio:0:2,(' BS Con Azucar'));
    i:=i+1; // mover posicion al array productos

 end;
   end;

    // A R R O Z

 if seleccion=4 then

  begin

  clrscr;
  textcolor(11);
  writeln;
  writeln('>> Has Seleccionado Arroz');
  writeln;
  textcolor(15);
  writeln('Cuanto Desea Llevar?, 1kg = 700 Bs');
  write('> ');
  write;
  read(cant_p);
  carrito:=precio_arroz*cant_p;
  contador:=contador+1; // cuantos productos diferentes llevo

  // Si ya esta listado nuestro producto recorremos con for el arreglo y remplazamos los valores
  if existe_arroz=true then
  for k:=1 to 10 do
  begin
  if productos[k].nombre_p='Arroz' then
  begin

  productos[k].cantidad_p:=(productos[k].cantidad_p+cant_p);   // sumanos cantidad pasada y presente
  productos[k].precio:=(productos[k].cantidad_p*precio_arroz);        // obtenemos el valor nuevo de compra
  contador:=contador-1;                                      // dejo igual el aumento del for final por escoger mismo producto

  clrscr;
  textcolor(15);
  gotoxy(12,25);
  textcolor(128);
  write('>');
  gotoxy(13,25);
  write('>');
  gotoxy(14,25);
  write('>');
  textcolor(15);
   writeln('   Llevas en el carrito: ',productos[k].precio:0:2,(' BS Con Arroz'));

  end
  end

  else
  begin
  productos[i].nombre_p:='Arroz';      // detalle
  productos[i].cantidad_p:=cant_p;    // cantidad
  productos[i].precio:=carrito;      // precio
  productos[i].codigo_p:=4412;      // codigo de producto
  productos[i].mi_costo:=700;      // asignamos el costo de cada producto
  existe_arroz:=true;             // declaramos que ya escogimos producto

  clrscr; // limpiar pantalla

  textcolor(15);
  gotoxy(12,25);
  textcolor(128);
  write('>');
  gotoxy(13,25);
  write('>');
  gotoxy(14,25);
  write('>');
  textcolor(15);
   writeln('   Llevas en el carrito: ',productos[i].precio:0:2,(' BS Con Arroz'));
   i:=i+1; // mover posicion al array productos

end;
  end;

     // L E N T E J A S

 if seleccion=5 then

  begin

  clrscr;
  textcolor(11);
  writeln;
  writeln('>> Has Seleccionado Lentejas');
  writeln;
  textcolor(15);
  writeln('Cuanto Desea Llevar?, 1kg = 600 Bs');
  write('> ');
  write;
  read(cant_p);
  carrito:=precio_Lentejas*cant_p;
  contador:=contador+1; // cuantos productos diferentes llevo

  // Si ya esta listado nuestro producto recorremos con for el arreglo y remplazamos los valores
  if existe_lentejas=true then
  for k:=1 to 10 do
  begin
  if productos[k].nombre_p='Lentejas' then
  begin

  productos[k].cantidad_p:=(productos[k].cantidad_p+cant_p);   // sumanos cantidad pasada y presente
  productos[k].precio:=(productos[k].cantidad_p*precio_Lentejas);        // obtenemos el valor nuevo de compra
  contador:=contador-1;                                      // dejo igual el aumento del for final por escoger mismo producto

  clrscr;
  textcolor(15);
  gotoxy(12,25);
  textcolor(128);
  write('>');
  gotoxy(13,25);
  write('>');
  gotoxy(14,25);
  write('>');
  textcolor(15);
   writeln('   Llevas en el carrito: ',productos[k].precio:0:2,(' BS Con Lentejas'));

  end
  end

  else
  begin
  productos[i].nombre_p:='Lentejas';       // detalle
  productos[i].cantidad_p:=cant_p;        // cantidad
  productos[i].precio:=carrito;          // precio
  productos[i].codigo_p:=5412;          // codigo de producto
  productos[i].mi_costo:=600;          // asignamos el costo de cada producto
  existe_Lentejas:=true;              // declaramos que ya escogimos producto

  clrscr; // limpiar pantalla

  textcolor(15);
  gotoxy(12,25);
  textcolor(128);
  write('>');
  gotoxy(13,25);
  write('>');
  gotoxy(14,25);
  write('>');
  textcolor(15);
   writeln('   Llevas en el carrito: ',productos[i].precio:0:2,(' BS Con Lentejas'));
   i:=i+1; // mover posicion al array productos

end;
  end;

  // E S P A G U E T T I

 if seleccion=6 then

  begin

  clrscr;
  textcolor(11);
  writeln;
  writeln('>> Has Seleccionado Espaguetti');
  writeln;
  textcolor(15);
  writeln('Cuanto Desea Llevar?, 1kg = 1500 Bs');
  write('> ');
  write;
  read(cant_p);
  carrito:=precio_espaguetti*cant_p;
  contador:=contador+1; // cuantos productos diferentes llevo

  // Si ya esta listado nuestro producto recorremos con for el arreglo y remplazamos los valores
  if existe_espaguetti=true then
  for k:=1 to 10 do
  begin
  if productos[k].nombre_p='Espaguetti' then
  begin

  productos[k].cantidad_p:=(productos[k].cantidad_p+cant_p);   // sumanos cantidad pasada y presente
  productos[k].precio:=(productos[k].cantidad_p*precio_espaguetti);        // obtenemos el valor nuevo de compra
  contador:=contador-1;                                      // dejo igual el aumento del for final por escoger mismo producto

  clrscr;
  textcolor(15);
  gotoxy(12,25);
  textcolor(128);
  write('>');
  gotoxy(13,25);
  write('>');
  gotoxy(14,25);
  write('>');
  textcolor(15);
   writeln('   Llevas en el carrito: ',productos[k].precio:0:2,(' BS Con Espaguetti'));

  end
  end

  else
  begin
  productos[i].nombre_p:='Espaguetti';      // detalle
  productos[i].cantidad_p:=cant_p;         // cantidad
  productos[i].precio:=carrito;           // precio
  productos[i].codigo_p:=6412;           // codigo de producto
  productos[i].mi_costo:=1500;          // asignamos el costo de cada producto
  existe_espaguetti:=true;             // declaramos que ya escogimos producto

  clrscr; // limpiar pantalla

  textcolor(15);
  gotoxy(12,25);
  textcolor(128);
  write('>');
  gotoxy(13,25);
  write('>');
  gotoxy(14,25);
  write('>');
  textcolor(15);
   writeln('   Llevas en el carrito: ',productos[i].precio:0:2,(' BS Con Espaguetti'));
   i:=i+1; // mover posicion al array productos

end;
  end;

     // L E C H E

 if seleccion=7 then

  begin

  clrscr;
  textcolor(11);
  writeln;
  writeln('>> Has Seleccionado Leche');
  writeln;
  textcolor(15);
  writeln('Cuanto Desea Llevar?, 1kg = 1500 Bs');
  write('> ');
  write;
  read(cant_p);
  carrito:=precio_leche*cant_p;
  contador:=contador+1; // cuantos productos diferentes llevo

  // Si ya esta listado nuestro producto recorremos con for el arreglo y remplazamos los valores
  if existe_leche=true then
  for k:=1 to 10 do
  begin
  if productos[k].nombre_p='Leche' then
  begin

  productos[k].cantidad_p:=(productos[k].cantidad_p+cant_p);   // sumanos cantidad pasada y presente
  productos[k].precio:=(productos[k].cantidad_p*precio_leche);        // obtenemos el valor nuevo de compra
  contador:=contador-1;                                      // dejo igual el aumento del for final por escoger mismo producto

  clrscr;
  textcolor(15);
  gotoxy(12,25);
  textcolor(128);
  write('>');
  gotoxy(13,25);
  write('>');
  gotoxy(14,25);
  write('>');
  textcolor(15);
   writeln('   Llevas en el carrito: ',productos[k].precio:0:2,(' BS Con Leche'));

  end
  end

  else
  begin
  productos[i].nombre_p:='Leche';      // detalle
  productos[i].cantidad_p:=cant_p;    // cantidad
  productos[i].precio:=carrito;      // precio
  productos[i].codigo_p:=7412;      // codigo de producto
  productos[i].mi_costo:=1500;     // asignamos el costo de cada producto
  existe_leche:=true;             // declaramos que ya escogimos producto

  clrscr; // limpiar pantalla

  textcolor(15);
  gotoxy(12,25);
  textcolor(128);
  write('>');
  gotoxy(13,25);
  write('>');
  gotoxy(14,25);
  write('>');
  textcolor(15);
   writeln('   Llevas en el carrito: ',productos[i].precio:0:2,(' BS Con Leche'));
   i:=i+1; // mover posicion al array productos

end;
  end;

          // H A R I N  A -  -  P A N


 if seleccion=8 then

  begin

  clrscr;
  textcolor(11);
  writeln;
  writeln('>> Has Seleccionado Harina Pan');
  writeln;
  textcolor(15);
  writeln('Cuanto Desea Llevar?, 1kg = 2000 Bs');
  write('> ');
  write;
  read(cant_p);
  carrito:=precio_harina*cant_p;
  contador:=contador+1; // cuantos productos diferentes llevo

  // Si ya esta listado nuestro producto recorremos con for el arreglo y remplazamos los valores
  if existe_harina=true then
  for k:=1 to 10 do
  begin
  if productos[k].nombre_p='Harina' then
  begin

  productos[k].cantidad_p:=(productos[k].cantidad_p+cant_p);   // sumanos cantidad pasada y presente
  productos[k].precio:=(productos[k].cantidad_p*precio_harina);        // obtenemos el valor nuevo de compra
  contador:=contador-1;                                      // dejo igual el aumento del for final por escoger mismo producto

  clrscr;
  textcolor(15);
  gotoxy(12,25);
  textcolor(128);
  write('>');
  gotoxy(13,25);
  write('>');
  gotoxy(14,25);
  write('>');
  textcolor(15);
   writeln('   Llevas en el carrito: ',productos[k].precio:0:2,(' BS Con Harina Pan'));

  end
  end

  else
  begin
  productos[i].nombre_p:='Harina';      // detalle
  productos[i].cantidad_p:=cant_p;     // cantidad
  productos[i].precio:=carrito;       // precio
  productos[i].codigo_p:=8412;       // codigo de producto
  productos[i].mi_costo:=2000;      // asignamos el costo de cada producto
  existe_harina:=true;             // declaramos que ya escogimos producto

  clrscr; // limpiar pantalla

  textcolor(15);
  gotoxy(12,25);
  textcolor(128);
  write('>');
  gotoxy(13,25);
  write('>');
  gotoxy(14,25);
  write('>');
  textcolor(15);
   writeln('   Llevas en el carrito: ',productos[i].precio:0:2,(' BS Con Harina'));
   i:=i+1; // mover posicion al array productos

end;
  end;


   // A V E  N A

 if seleccion=9 then

  begin

  clrscr;
  textcolor(11);
  writeln;
  writeln('>> Has Seleccionado Avena');
  writeln;
  textcolor(15);
  writeln('Cuanto Desea Llevar?, 1kg = 1800 Bs');
  write('> ');
  write;
  read(cant_p);
  carrito:=precio_avena*cant_p;
  contador:=contador+1; // cuantos productos diferentes llevo

  // Si ya esta listado nuestro producto recorremos con for el arreglo y remplazamos los valores
  if existe_avena=true then
  for k:=1 to 10 do
  begin
  if productos[k].nombre_p='Avena' then
  begin

  productos[k].cantidad_p:=(productos[k].cantidad_p+cant_p);   // sumanos cantidad pasada y presente
  productos[k].precio:=(productos[k].cantidad_p*precio_avena);        // obtenemos el valor nuevo de compra
  contador:=contador-1;                                      // dejo igual el aumento del for final por escoger mismo producto

  clrscr;
  textcolor(15);
  gotoxy(12,25);
  textcolor(128);
  write('>');
  gotoxy(13,25);
  write('>');
  gotoxy(14,25);
  write('>');
  textcolor(15);
   writeln('   Llevas en el carrito: ',productos[k].precio:0:2,(' BS Con Avena'));

  end
  end

  else
  begin
  productos[i].nombre_p:='Avena';      // detalle
  productos[i].cantidad_p:=cant_p;    // cantidad
  productos[i].precio:=carrito;      // precio
  productos[i].codigo_p:=9412;      // codigo de producto
  productos[i].mi_costo:=1800;     // asignamos el costo de cada producto
  existe_avena:=true;             // declaramos que ya escogimos producto

  clrscr; // limpiar pantalla

  textcolor(15);
  gotoxy(12,25);
  textcolor(128);
  write('>');
  gotoxy(13,25);
  write('>');
  gotoxy(14,25);
  write('>');
  textcolor(15);
   writeln('   Llevas en el carrito: ',productos[i].precio:0:2,(' BS Con Avena'));
   i:=i+1; // mover posicion al array productos

end;
  end;

     // F O R O R O

 if seleccion=10 then

  begin

  clrscr;
  textcolor(11);
  writeln;
  writeln('>> Has Seleccionado Fororo');
  writeln;
  textcolor(15);
  writeln('Cuanto Desea Llevar?, 1kg = 1000 Bs');
  write('> ');
  write;
  read(cant_p);
  carrito:=precio_fororo*cant_p;
  contador:=contador+1; // cuantos productos diferentes llevo

  // Si ya esta listado nuestro producto recorremos con for el arreglo y remplazamos los valores
  if existe_fororo=true then
  for k:=1 to 10 do
  begin
  if productos[k].nombre_p='Fororo' then
  begin

  productos[k].cantidad_p:=(productos[k].cantidad_p+cant_p);   // sumanos cantidad pasada y presente
  productos[k].precio:=(productos[k].cantidad_p*precio_fororo);        // obtenemos el valor nuevo de compra
  contador:=contador-1;                                      // dejo igual el aumento del for final por escoger mismo producto

  clrscr;
  textcolor(15);
  gotoxy(12,25);
  textcolor(128);
  write('>');
  gotoxy(13,25);
  write('>');
  gotoxy(14,25);
  write('>');
  textcolor(15);
   writeln('   Llevas en el carrito: ',productos[k].precio:0:2,(' BS Con Fororo'));

  end
  end

  else
  begin
  productos[i].nombre_p:='Fororo';       // detalle
  productos[i].cantidad_p:=cant_p;      // cantidad
  productos[i].precio:=carrito;        // precio
  productos[i].codigo_p:=1412;        // codigo de producto
  productos[i].mi_costo:=1000;       // asignamos el costo de cada producto
  existe_fororo:=true;              // declaramos que ya escogimos producto

  clrscr; // limpiar pantalla

  textcolor(15);
  gotoxy(12,25);
  textcolor(128);
  write('>');
  gotoxy(13,25);
  write('>');
  gotoxy(14,25);
  write('>');
  textcolor(15);
   writeln('   Llevas en el carrito: ',productos[i].precio:0:2,(' BS Con Fororo'));
   i:=i+1; // mover posicion al array productos

end;
  end;

 // PAGAR

  if seleccion=11 then   // PAGAR EN CAJA
 begin
   clrscr;
   writeln('Cedula Del Cliente: ');
   readln(cedula_c);

   writeln('Nombre Del cliente: ');
   readln(nombre_c);

   writeln('Direccion Del Cliente: ');
   read(direccion_c);

   writeln('Seleccione Su Metodo De Pago');
   writeln('EFECTIVO [1]');
   writeln('TARJETA DE CREDITO [2]');
   writeln('TARJETA DE DEBITO [3]');
   read(metodo_pago);

   case metodo_pago of
    1:
    begin
    supago:=('Efectivo');
    end;
    2:
    begin
    supago:=('Tarjeta De Credito');
    end;
    3:
    begin
    supago:=('Tarjeta De Debito');
    end;

    end;

      clrscr;
  gotoxy(15,12);
  textcolor(11);
writeln('-_-_-_-_- C R E A N D O     F A C T U R A -_-_-_-_-');
delay(1300);
textcolor(15);
 clrscr;

   clrscr;
    gotoxy(20,1);
    writeln('------- F A C T U R A -------');
    gotoxy(15,2);
    writeln('EL CAMPO C.A');
    gotoxy(30,2);
    writeln('RIF: 279229998');
    writeln('   Factura #',nro_factura);

    getdate(a,m,d,ds);
    gettime(h,mm,s,ns);
    gotoxy(24,3);
    write('FECHA: ',d,'/',m,'/',a,'    ');
    gotoxy(44,3);
    write('HORA: ',h,':',mm,':',s);
    gotoxy(4,4);
    writeln('-----------------------------------------------------------------');
    gotoxy(4,5);
    writeln('Nombre: ',nombre_c);
    gotoxy(44,5);
    writeln('CI: ',cedula_c);
    gotoxy(4,6);
    writeln('Direccion Cliente: ',direccion_c);
    gotoxy(4,7);
    writeln('CANTIDAD:   codigoP:    Detalle:    Precio:   Total: ');

      // CANTIDAD
     fila:=8;  // para las filas

     for i:=1 to contador do
       begin

       with productos[i] do
       begin
    gotoxy(4,fila);
    fila:=fila+1;
    write(cantidad_p);
         end;
       end;
    //  CODIGO P
    fila:=8;  // para las filas


         for i:=1 to contador do
       begin

       with productos[i] do
       begin

     gotoxy(16,fila);
     fila:=fila+1;
     write(codigo_p);
       end;
       end;

      //  DETALLE P
      fila:=8;  // para las filas


       for i:=1 to contador do
       begin
       with productos[i] do
       begin

     gotoxy(28,fila);
     fila:=fila+1;
     write(nombre_p);
         end;
       end;

        //  PRECIO P
      fila:=8;  // para las filas


       for i:=1 to contador do
       begin
       with productos[i] do
       begin

     gotoxy(40,fila);
     fila:=fila+1;
     write(mi_costo:2:0,'  BS');
         end;
       end;


      // TOTAL
         fila:=8;  // para las filas

             for i:=1 to contador do
             begin
             with productos[i] do
             begin

           gotoxy(50,fila);
           fila:=fila+1;
           write(precio:2:0,'  BS');
               end;
             end;


    for i:=1 to contador do
    begin

    with productos[i] do
    begin
       fila:=fila+contador+1;

       subtotal:=(subtotal+precio);
       iva_operacion:=(subtotal*iva);
       end;
    end;
   // gotoxy(54,15);
   // write('Subtotal:  ');   // S U B T O T A L
   // gotoxy(54,16);          // No entra asi q no va
   // write(subtotal:0:2);
    gotoxy(32,19);
    writeln('IVA (13.00 %):');
    gotoxy(50,19);
    write(iva_operacion:0:2,'  BS');
    gotoxy(4,18);
    writeln('Pago Por: ',supago);
    gotoxy(4,19);
    writeln('Cajero:',nombre_operador);
    gotoxy(34,20);
    writeln('T O T A L');
    writeln('---------------------------------------------------------------------');
    gotoxy(50,20);
    writeln(subtotal+iva_operacion:0:2,' BS');
    gotoxy(4,21);
    writeln('------- Gracias Por Su Compra ! -------');
    gotoxy(4,22);
    writeln('---------- Vuelva Pronto! ----------');


      // Desicion de continuar
  writeln();
  gotoxy(53,23);
  textcolor(11);
  writeln('> Emitir Otra Factura [1]');
  gotoxy(53,24);
  textcolor(12);
  writeln('> Salir [2]');
  textcolor(15);
  gotoxy(40,24);
  write('> ');
  gotoxy(40,24);

  read(seleccion);



  if seleccion=1 then
  begin
  conteo_facturas:=nro_factura;
  nro_factura:=nro_factura+1; // E M I T I R --- O T R A --- F A C T U R A


  with productos[i] do
  begin

    for i:=1 to contador do
       begin

       with productos[i] do
       begin
    gotoxy(4,fila);
    fila:=fila+1;
    // Ingresar datos en bloc de notas
      assignfile(f, 'bloc_archivo.txt');
  try
    rewrite(f);
    writeln(f, '--------------');
    writeln(f, 'Se han emitido: ',conteo_facturas,'  Facturas En Total');
    writeln(f, '--------------');
    writeln(f, 'Se han Vendido: ',subtotal+iva_operacion:0:2,' BS En Total');
    clrscr;
    close(f);

  except
    writeln('Error En El Sistema');
  end;

         end;
       end;
    end;
  end;


  begin


    contador:=0;
    for i:=1 to 10 do
    begin
    with productos[i] do    // Reinicio los valores
    begin
    nombre_p:='';
    cantidad_p:=0;
    total_p:=0;
    precio:=0;
    codigo_p:=0;
    subtotal:=0;
    iva_operacion:=0;



    // reiniciar productos que existen
    existe_cafe:=false;
    existe_cacao:=false;
    existe_azucar:=false;
    existe_arroz:=false;
    existe_lentejas:=false;
    existe_espaguetti:=false;
    existe_leche:=false;
    existe_harina:=false;
    existe_avena:=false;
    existe_fororo:=false;

    clrscr;

      end;
    end;

    // inicializar arrays
    i:=1;
  writeln; // continuar en el ciclo menu

  end;


  if seleccion=2 then
  begin
  seguir:=false;
  end;  // salir del ciclo

       end;
    end;
 end.

