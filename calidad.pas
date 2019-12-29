program calidad;
 uses crt,dos;
type
     TRProductos = RECORD
     nombre_p:string;
     cantidad_p,codigo_p:integer;
     total_p,precio:real;
  end;



 TProductos = array[1..10] of TRProductos;

 //iniciar Sesion

 var clave:string;
  var intentos:boolean;

 // contador global

   const iva=0.13;
   var fila: integer;  // posicion de arrays para gotoxy
   var productos:TProductos;

 // datos de clientes

   var cedula_c,metodo_pago:integer;
   var supago:string;


           // operador
           var nombre_operador,direccion_c,nombre_c:string;



     // M E N U
     var seguir: boolean; // ciclo while menu
       var seleccion:integer; //seleccion
         var i:integer; // GLOBAL

     // F A C T U R A C I O N
           var nro_factura:integer;
           var subtotal: real;
            var    a, m, d, ds : word;   {fecha}
                    h, mm, s, ns : word; {hora}

           // C O M P R A
             var contador:integer; // hasta para el ciclo for del array
               var iva_operacion:real;



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

  if seleccion=1 then
begin
  with productos[1] do
  begin
  if nombre_p='Cafe' then   // si ya habia seleccionado cafe no suma el contador
    begin
    contador:=contador-1;
    writeln;
    end;
  clrscr;
  textcolor(11);
  writeln;
  writeln('>> Has seleccionado Cafe');
  writeln;
  textcolor(15);
  writeln('Cuanto desea llevar?, cada kg cuesta 500 Bs');
  write('> ');
  write;
  read(cantidad_p);
  nombre_p:='Cafe';
  precio:=500;
  codigo_p:=1234;
  total_p:=total_p+(cantidad_p*precio);
  contador:=contador+1;

  clrscr;
  gotoxy(12,25);
  textcolor(128);
  write('>');
  gotoxy(13,25);
  write('>');
  gotoxy(14,25);
  write('>');
  textcolor(15);

  writeln('   Llevas en el carrito: ',total_p:0:2,(' BS Con Cafe'));
  writeln();
end;
  end;

  // C A C A O


   if seleccion=2 then
  begin
  with productos[2] do
  begin
  if nombre_p='Cacao' then   // si ya habia seleccionado cafe no suma el contador
    begin
    contador:=contador-1;
    writeln;
    end;
  clrscr;
  textcolor(11);
  writeln;
  writeln('>> Has seleccionado Cacao');
  writeln;
  textcolor(15);
  writeln('Cuanto desea llevar?, cada kg cuesta 200 Bs');
  write('> ');
  write;
  read(cantidad_p);
  nombre_p:='Cacao';
  precio:=200;
  codigo_p:=3123;
  total_p:=total_p+(cantidad_p*precio);
  contador:=contador+1;

  clrscr;
  gotoxy(12,25);
  textcolor(128);
  write('>');
  gotoxy(13,25);
  write('>');
  gotoxy(14,25);
  write('>');
  textcolor(15);

  writeln('   Llevas en el carrito: ',total_p:0:2,(' BS Con Cacao'));
  writeln();
end;
  end;


 // A Z U C A R

    if seleccion=3 then
begin
  with productos[3] do
  begin
  if nombre_p='Azucar' then   // si ya habia seleccionado cafe no suma el contador
    begin
    contador:=contador-1;
    writeln;
    end;
  clrscr;
  textcolor(11);
  writeln;
  writeln('>> Has seleccionado Azucar');
  writeln;
  textcolor(15);
  writeln('Cuanto desea llevar?, cada kg cuesta 700 Bs');
  write('> ');
  write;
  read(cantidad_p);
  nombre_p:='Azucar';
  precio:=700;
  codigo_p:=3423;
  total_p:=total_p+(cantidad_p*precio);
  contador:=contador+1;

  clrscr;
  gotoxy(12,25);
  textcolor(128);
  write('>');
  gotoxy(13,25);
  write('>');
  gotoxy(14,25);
  write('>');
  textcolor(15);

  writeln('   Llevas en el carrito: ',total_p:0:2,(' BS Con Azucar'));
  writeln();
end;
  end;

    // A R R O Z

     if seleccion=4 then
begin
  with productos[4] do
  begin
  if nombre_p='Arroz' then   // si ya habia seleccionado cafe no suma el contador
    begin
    contador:=contador-1;
    writeln;
    end;
  clrscr;
  textcolor(11);
  writeln;
  writeln('>> Has seleccionado Arroz');
  writeln;
  textcolor(15);
  writeln('Cuanto desea llevar?, cada kg cuesta 1000 Bs');
  write('> ');
  write;
  read(cantidad_p);
  nombre_p:='Arroz';
  precio:=1000;
  codigo_p:=2345;
  total_p:=total_p+(cantidad_p*precio);
  contador:=contador+1;

  clrscr;
  gotoxy(12,25);
  textcolor(128);
  write('>');
  gotoxy(13,25);
  write('>');
  gotoxy(14,25);
  write('>');
  textcolor(15);

  writeln('   Llevas en el carrito: ',total_p:0:2,(' BS Con Arroz'));
  writeln();
end;
  end;

     // L E N T E J A S

     if seleccion=5 then
begin
  with productos[5] do
  begin
  if nombre_p='Lentejas' then   // si ya habia seleccionado cafe no suma el contador
    begin
    contador:=contador-1;
    writeln;
    end;
  clrscr;
  textcolor(11);
  writeln;
  writeln('>> Has seleccionado Lentejas');
  writeln;
  textcolor(15);
  writeln('Cuanto desea llevar?, cada kg cuesta 600 Bs');
  write('> ');
  write;
  read(cantidad_p);
  nombre_p:='Lentejas';
  precio:=600;
  codigo_p:=6853;
  total_p:=total_p+(cantidad_p*precio);
  contador:=contador+1;

  clrscr;
  gotoxy(12,25);
  textcolor(128);
  write('>');
  gotoxy(13,25);
  write('>');
  gotoxy(14,25);
  write('>');
  textcolor(15);

  writeln('   Llevas en el carrito: ',total_p:0:2,(' BS Con Lentejas'));
  writeln();
end;
  end;

  // E S P A G U E T T I

     if seleccion=6 then
begin
  with productos[6] do
  begin
  if nombre_p='Espaguetti' then   // si ya habia seleccionado cafe no suma el contador
    begin
    contador:=contador-1;
    writeln;
    end;
  clrscr;
  textcolor(11);
  writeln;
  writeln('>> Has seleccionado Espaguetti');
  writeln;
  textcolor(15);
  writeln('Cuanto desea llevar?, cada kg cuesta 700 Bs');
  write('> ');
  write;
  read(cantidad_p);
  nombre_p:='Espaguetti';
  precio:=700;
  codigo_p:=1345;
  total_p:=total_p+(cantidad_p*precio);
  contador:=contador+1;

  clrscr;
  gotoxy(12,25);
  textcolor(128);
  write('>');
  gotoxy(13,25);
  write('>');
  gotoxy(14,25);
  write('>');
  textcolor(15);

  writeln('   Llevas en el carrito: ',total_p:0:2,(' BS Con Espaguetti'));
  writeln();
end;
  end;

     // L E C H E

     if seleccion=7 then
begin
  with productos[7] do
  begin
  if nombre_p='Leche' then   // si ya habia seleccionado cafe no suma el contador
    begin
    contador:=contador-1;
    writeln;
    end;
  clrscr;
  textcolor(11);
  writeln;
  writeln('>> Has seleccionado Leche');
  writeln;
  textcolor(15);
  writeln('Cuanto desea llevar?, cada kg cuesta 700 Bs');
  write('> ');
  write;
  read(cantidad_p);
  nombre_p:='Leche';
  precio:=700;
  codigo_p:=2377;
  total_p:=total_p+(cantidad_p*precio);
  contador:=contador+1;

  clrscr;
  gotoxy(12,25);
  textcolor(128);
  write('>');
  gotoxy(13,25);
  write('>');
  gotoxy(14,25);
  write('>');
  textcolor(15);

  writeln('   Llevas en el carrito: ',total_p:0:2,(' BS Con Leche'));
  writeln();
end;
  end;

          // H A R I N A PAN

     if seleccion=8 then
begin
  with productos[8] do
  begin
  if nombre_p='Harina Pan' then   // si ya habia seleccionado cafe no suma el contador
    begin
    contador:=contador-1;
    writeln;
    end;
  clrscr;
  textcolor(11);
  writeln;
  writeln('>> Has seleccionado Leche');
  writeln;
  textcolor(15);
  writeln('Cuanto desea llevar?, cada kg cuesta 900 Bs');
  write('> ');
  write;
  read(cantidad_p);
  nombre_p:='Harina Pan';
  precio:=900;
  codigo_p:=1145;
  total_p:=total_p+(cantidad_p*precio);
  contador:=contador+1;

  clrscr;
  gotoxy(12,25);
  textcolor(128);
  write('>');
  gotoxy(13,25);
  write('>');
  gotoxy(14,25);
  write('>');
  textcolor(15);

  writeln('   Llevas en el carrito: ',total_p:0:2,(' BS Con Harina Pan'));
  writeln();
end;
  end;


   // A V E  N A

     if seleccion=9 then
begin
  with productos[9] do
  begin
  if nombre_p='Avena' then   // si ya habia seleccionado cafe no suma el contador
    begin
    contador:=contador-1;
    writeln;
    end;
  clrscr;
  textcolor(11);
  writeln;
  writeln('>> Has seleccionado Avena');
  writeln;
  textcolor(15);
  writeln('Cuanto desea llevar?, cada kg cuesta 1000 Bs');
  write('> ');
  write;
  read(cantidad_p);
  nombre_p:='Avena';
  precio:=1000;
  codigo_p:=7578;
  total_p:=total_p+(cantidad_p*precio);
  contador:=contador+1;

  clrscr;
  gotoxy(12,25);
  textcolor(128);
  write('>');
  gotoxy(13,25);
  write('>');
  gotoxy(14,25);
  write('>');
  textcolor(15);

  writeln('   Llevas en el carrito: ',total_p:0:2,(' BS Con Avena'));
  writeln();
end;
  end;


     // F O R O R O


     if seleccion=10 then
begin
  with productos[10] do
  begin
  if nombre_p='Fororo' then   // si ya habia seleccionado cafe no suma el contador
    begin
    contador:=contador-1;
    writeln;
    end;
  clrscr;
  textcolor(11);
  writeln;
  writeln('>> Has seleccionado Avena');
  writeln;
  textcolor(15);
  writeln('Cuanto desea llevar?, cada kg cuesta 1200 Bs');
  write('> ');
  write;
  read(cantidad_p);
  nombre_p:='Fororo';
  precio:=1200;
  codigo_p:=9547;
  total_p:=total_p+(cantidad_p*precio);
  contador:=contador+1;

  clrscr;
  gotoxy(12,25);
  textcolor(128);
  write('>');
  gotoxy(13,25);
  write('>');
  gotoxy(14,25);
  write('>');
  textcolor(15);

  writeln('   Llevas en el carrito: ',total_p:0:2,(' BS Con Fororo'));
  writeln();
end;
  end;

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

  writeln;
  writeln('>> Has Ingresado Sastifactoriamente');
 textcolor(15);
       writeln;
       writeln('MENU DE OPCIONES ');
       writeln;
       writeln('Ver Cantidad De Facturas Realizadas En El Dia  [1]');
       writeln;
       writeln('Ver Productos Vendidos [2]');
       writeln;
       writeln('Salir [3]');
       read(seleccion);
       if seleccion=1 then
       begin
       end;

       if seleccion=2 then
       begin
       end;

       if seleccion=3 then
       begin
       intentos:=false;
       end;


 end;

 // FIN MODO ADMIN













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
     write(precio:2:0,' BS');
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
           write(total_p:2:0,' BS');
               end;
             end;


    for i:=1 to contador do
    begin

    with productos[i] do
    begin
       fila:=fila+contador+1;

       subtotal:=(subtotal+total_p);
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
    write(iva_operacion:0:2,' BS');
    gotoxy(4,18);
    writeln('Pago Por: ',supago);
    gotoxy(4,19);
    writeln('Cajero:',nombre_operador);
    gotoxy(4,20);
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
    nro_factura:=nro_factura+1; // emitir ora factura
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
    clrscr;

      end;
    end;

    // cantidad_p:=[0]; // inicializar arrays

  writeln; // continuar en el ciclo menu
  end;
  if seleccion=2 then
  begin
  seguir:=false;
  end;  // salir del ciclo


       end;
    end;
 end.

