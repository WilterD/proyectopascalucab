program calidad;
 uses crt;
type
  TRProductos = RECORD
    nombre_p:string;
     cantidad_p,codigo_p:integer;
     total_p:real;
  end;



 TProductos = array[1..10] of TRProductos;


 var productos_canasta: integer; // contador global
   var productos:TProductos;

     // M E N U
     var seguir: boolean; // ciclo while menu
       var seleccion:integer; //seleccion
         var i:integer; // GLOBAL

           var nro_factura:integer; // facturacion

           // C O M P R A
           var precio:integer;
             var contador:integer; // hasta para el ciclo for del array


     procedure insertar(VAR productos:TProductos);
     var i:integer;

       begin
         for i:=1 to 2 do
         begin
         with productos[1] do
         begin
         writeln('alumnos-',i);
         write('nombre');readln(nombre_p);
         write('cantidad_p');readln(cantidad_p);
         write('codigo_p');readln(codigo_p);
         end;
         end;
        end;




 begin

 writeln('1 - colocare los datos de sesion');
 seguir:=true;
 nro_factura:=1;
 while seguir=true do
 begin
 writeln('selecciona un producto');
 writeln('cafe[1]');
 writeln('cacao[2]');
 writeln('salir [3]');
 writeln('insertan o [4]');
 writeln('mostrar [11]');
 read(seleccion);

 if seleccion=1 then
 begin
   with productos[1] do
   begin
   writeln('has seleccionado cafe');
   writeln('cada kg cuesta 500 bs');
   read(cantidad_p);
   nombre_p:='cafe';
   precio:=500;
   codigo_p:=1234;
   total_p:=total_p+(cantidad_p*precio);
   contador:=contador+1;
   i:=i+1; // insertar datos next campo array

   writeln('llevas en el carrito: ',total_p:0:2,(' BS'));
   writeln();
 end;
   end;

  // C A C A O


   if seleccion=2 then
 begin
   with productos[2] do
   begin
   writeln('has seleccionado cafe');
   writeln('cada kg cuesta 200 bs');
   read(cantidad_p);
   nombre_p:='cacao';
   precio:=200;
   codigo_p:=5678;
   total_p:=total_p+(cantidad_p*precio);
   contador:=contador+1;
   i:=i+1; // insertar datos next campo array

   writeln('llevas en el carrito: ',total_p:0:2,(' BS'));
   writeln();
 end;
   end;

  if seleccion=5 then   // M O S T R A R
 begin
   clrscr;
    writeln('EL Campo');
    writeln('RIF: 279229998');
    writeln('Factura #',nro_factura);
    writeln('Nombre Cliente: ');
    writeln('Cedula Cliente: ');
    writeln('Direccion Cliente: ');

    for i:=1 to contador do

    begin

    with productos[i] do
    begin

     gotoxy(10,1);write('Cantidad',cantidad_p,'   ');
     gotoxy(10,1);write('Codigo Producto',codigo_p,'   ');
    write('Detalle',nombre_p,'   ');
    write('Precio',precio,'    ');
    end;
    end;
   end;
  writeln('Continuar o salir');
  writeln('');
  read(); // salir del ciclo

 end;



 end.

