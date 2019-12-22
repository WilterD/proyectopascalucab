program proyecto;
{$mode objfpc}{$H+} // para factura

uses crt,dos,  {dos-es-to-fecha}
    sysutils,
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes;   // librerias
var producto,kgcafe,kgcacao,operacion,continuar,i:Integer;
    operador,supago,Nombre_Cliente,Direccion_Cliente,Direccion_Empresa,ejemplo,clave:String;
    rifoperador,cedula,MetodoPago,Rif_Cliente,codigo_producto1,conteo,cantidad_1,cantidad_2,facturas_emitidas,nro_factura:Integer;
    salir,intentos:Boolean;
var    a, m, d, ds : word;   {fecha}
   h, mm, s, ns : word; {hora}


var
  f:textfile; // var de tipo texto
  linetxt:string;
  var leer_factura: integer;
  var cosa:string;

const iva=0.13;
  const Rif_Empresa=289229998;


    
  begin

  // Variables para inicializar:
  codigo_producto1:=0;
  conteo:=000126240;
  operacion:=0;
  i:=0;
  nro_factura:=100;

  ejemplo:=('Ejemplo');
  salir:=false;  // interruptor para clave
  textcolor(15);

  intentos:=true;
  while intentos=true do
  begin
  writeln;
  writeln('Ingresar Credenciales Para Sistema De Facturacion, (Intentos: ) ',i);
  readln(clave);
  if clave='cisco' then
     intentos:=false
     else
     begin
    i:=i+1;
    if i=5 then
       begin
        writeln('Has intentado muchas veces, intenta mas tarde');
        readln();
        Halt;

  end;
  end;
  end;

   writeln;
   writeln;
   textcolor(15);


  clrscr;
  writeln;
  writeln('Bienvenido a nuestra tienda EL CAMPO C.A');
  writeln;//salto de linea
  writeln('Ingrese sus datos como operador:');
  writeln;
  writeln;
  writeln('Nombre:');
  readln(operador);
  writeln;
  writeln('Cedula:');
  readln(rifoperador);
  writeln;
  clrscr;

  while salir=false do
  begin
  textcolor(19);
  writeln;
  writeln;
  writeln('Seleccione Un Producto De Nuestra Tienda!');
  writeln;
  textcolor(15);
  writeln('> Cafe: 1');
  writeln;
  writeln('> Cacao: 2');
  writeln; //salto de linea
  read(producto);
 //primero comenzamos con un producto para luego ir replicando a otros"
  
  case producto of
  
  1:begin
  codigo_producto1:=12345;   //array
  textcolor(19);
  writeln;
    write('>> Haz Seleccionado Cafe ');
    writeln; //salto de linea
    writeln; //salto de linea
    textcolor(15);
    write('Cuantos kilos de cafe desea llevar?, cada kg cuesta 300 Bs');
    writeln;
    read(kgcafe);
    operacion:=operacion+(kgcafe*300);
    cantidad_1:=(cantidad_1+kgcafe);  // array
    writeln;
    writeln;
    write('Llevas en el carrito, ',operacion,(' BS'));
    writeln;
    writeln;
    writeln('[1] Ir al menu principal');
    writeln;
    textcolor(18);
    writeln('[2] pagar en caja');
    textcolor(15);
    writeln();
    write('> ');
    read(continuar);


    if continuar=1 then
       writeln(); // vuelve al menu por que no he salido con salir=true


     if continuar=2 then    //paga   lo que lleva

      begin
       nro_factura:=nro_factura+1;
        writeln();
        clrscr;


    write('Como desea pagar?');
    textcolor(18);
    writeln;
    writeln;
    writeln('[1] Tarjeta De Credito');
    writeln('-----------------------');
    writeln;
    writeln('[2] Tarjeta De Debito');
    writeln('-----------------------');
    writeln;
    writeln('[3] Dinero En Efectivo');
    writeln('-----------------------');
    read(MetodoPago);

     case MetodoPago of
     1: supago:=('Tarjeta De Credito');
     2: supago:=('Tarjeta De Debito');
     3: supago:=('Dinero En Efectivo');
      end;
     writeln; //salto de linea
     textcolor(15);
     writeln('Nombre Completo Del Cliente: ');
     read(Nombre_Cliente);
     writeln;
     write('Rif Del Cliente: ');
     read(Rif_Cliente);
     writeln;
     writeln('Direccion Del Cliente');
     read(Direccion_Cliente);

     // Creacion de factura en bloc_archivo.txt de texto
        assignfile(f, 'bloc_archivo.txt');
   try
     rewrite(f);
 // datos de la factura

    writeln(f, Direccion_Empresa);
    writeln(f, 'Rif:',Rif_Empresa);
    writeln(f, '----------------------------------');
    writeln(f, 'F A C T U R A');
    writeln(f, 'Numero: #Factura: ',nro_factura);
    writeln(f, '------- EMISION: ');
    writeln(f, d,'/',m,'/',a,' -------');
    writeln(f,' HORA: ',h,':',mm,':',s,(' -------'));
    writeln(f, 'Datos Del Cliente:');
    writeln(f, 'Nombre: ',Nombre_Cliente);

    writeln(f, 'Direccion: ',Direccion_Cliente);
    writeln(f, 'Rif: ',Rif_Cliente);
    writeln(f, 'Nombre Del Cajero: ',operador);
    writeln(f, 'Codigo del producto: ',codigo_producto1);
    writeln(f, 'Cantidad De Productos: -----',cantidad_1,cantidad_2);
    writeln(f, 'Precio De Los Productos De La Tienda: ',operacion);
    writeln(f, 'COSTO TOTAL A PAGAR---- ',operacion*iva+operacion:0:2);
    writeln(f, 'su metodo de pago es: ',supago);
    writeln(f, 'GRACIAS POR SU COMPRA, VUELVA PRONTO!!');
    writeln(f, '------------------FIN------------------');
 close(f);
   except
     writeln('Error En El Sistema');
   end;
     // fin de creacion de bloc_archivo.txt



 clrscr;

  {FACTURA} {Datos Empresa}
  Direccion_Empresa:=('COMERCIAL EL CAMPO DIRECCION EMPRESARIAL EL CAMPO: ');
textcolor(15);
writeln(Direccion_Empresa);
writeln('Rif:',Rif_Empresa);
writeln('----------------------------------');
writeln('F A C T U R A');
writeln('Numero: #Factura: ',nro_factura);
writeln;
write('------- EMISION: ');
getdate(a,m,d,ds);
gettime(h,mm,s,ns);
write(d,'/',m,'/',a,' -------');
write(' HORA: ',h,':',mm,':',s,(' -------'));
writeln;
writeln('Datos Del Cliente:');
writeln('Nombre: ',Nombre_Cliente);
writeln('Direccion: ',Direccion_Cliente);
writeln('Rif: ',Rif_Cliente); //detecta solo el rif
writeln('---------------------------------------');

writeln('Nombre Del Cajero: ',operador);

writeln('Codigo del producto: ',codigo_producto1);  // codigo del producto
write('Cantidad De Productos: -----',cantidad_1,cantidad_2);
writeln;
writeln('Precio De Los Productos De La Tienda: ',operacion);
 writeln;
writeln('COSTO TOTAL A PAGAR---- ',operacion*iva+operacion:0:2);

writeln('su metodo de pago es: ',supago); //obteniendo metodo pago
writeln;
writeln('GRACIAS POR SU COMPRA, VUELVA PRONTO!!');
writeln;
writeln('------------------FIN------------------');
writeln;

writeln('para volver a emitir otra factura [1]');
writeln('para leer las facturas emitidas haga clic en [2]');


readln(leer_factura);

  if leer_factura=1 then
   facturas_emitidas:=(facturas_emitidas+1);
   operacion:=0;
  supago:='';
  Rif_Cliente:=0;
  Nombre_Cliente:='';
  Direccion_Cliente:='';

  writeln();    // vuelvo al ciclo while y reseteo los valores de factura

  if leer_factura=2 then
  begin
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
  except
    writeln('Error de archivo');
  end;

   end;

  end;  // fin sistema de pago

  end; //fin caso 1


  //producto 2  y su comercializacion (opciones) antes de > pagar



  2:begin
  clrscr;
   textcolor(19);
    write('>>Haz seleccionado Cacao ');
    writeln; //salto de linea
    writeln; //salto de linea
    textcolor(15);
    write('Cuantos kilos de cacao desea llevar?, cada kg cuesta 400 Bs');
    writeln;
    read(kgcacao);
    operacion:=operacion+(kgcacao*400);
    cantidad_2:=(cantidad_2+kgcacao);  //array
    writeln;
    write('Llevas en el carrito, ',operacion,(' BS'));
    writeln;
    writeln;
    writeln('[1] Ir al menu principal');
    writeln;
    textcolor(18);
    writeln('[2] pagar en caja');
    textcolor(15);
    writeln();
    write('> ');
    read(continuar);


    if continuar=1 then
       writeln(); // vuelve al menu por que no he salido con salir=true


     if continuar=2 then    //paga   lo que lleva

      begin
        writeln();
        clrscr;




    end; //caso 2
  end;end;end;


  readkey;


end.
