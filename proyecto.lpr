program proyecto;
uses crt,dos; {dos-es-to-fecha}
var producto,kgcafe,kgcacao,operacion,continuar,i:Integer;
    operador,supago,Nombre_Cliente,Direccion_Cliente,Direccion_Empresa,ejemplo,clave:String;
    rifoperador,cedula,MetodoPago,Rif_Cliente,codigo_producto1,conteo,nro_factura,cantidad_1,cantidad_2:Integer;
    salir,intentos:Boolean;

var    a, m, d, ds : word;   {fecha}
   h, mm, s, ns : word; {hora}
const iva=0.13;
  const Rif_Empresa=289229998;


    
  begin

  // Variables para inicializar:
  codigo_producto1:=0;
  conteo:=000126240;
  operacion:=0;

  ejemplo:=('Ejemplo');
  salir:=false;  // interruptor para menu
  textcolor(15);

  intentos:=true;
  while intentos=true do
  begin
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
        break;

  end;
  end;
  end;

   writeln;
   writeln;
   textcolor(15);



  writeln('Bienvenido a nuestra tienda EL CAMPO C.A');
  writeln;//salto de linea
  writeln('Ingrese sus datos como operador');
  writeln;
  writeln;
  writeln('Nombre:');
  readln(operador);
  writeln;
  writeln('Cedula:');
  readln(rifoperador);
  writeln;
  clrscr;
  textcolor(19);
  while salir=false do
  begin
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
  codigo_producto1:=12345;
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
    cantidad_1:=(cantidad_1+kgcafe);
    writeln;
    writeln;
    write('Llevas en el carrito, ',operacion,(' BS'));
    writeln;
    writeln;
    writeln('[1] Ir al menu principal');
    writeln;
    textcolor(18);
    writeln('[2] pagar en caja');
    read(continuar);
    textcolor(15);
    if continuar=2 then
      salir:=true
    end; //caso 1

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
    cantidad_2:=(cantidad_2+kgcacao);
    writeln;
    write('Llevas en el carrito, ',operacion,(' BS'));
    writeln;
    writeln;
    writeln('[1] Ir al menu principal');
    writeln;
    textcolor(18);
    writeln('[2] pagar en caja');
    read(continuar);
    
    if continuar=2 then
      salir:=true
    end; //caso 2
  
  end; // Fin del case
  
  end; //while
  nro_factura:=(conteo+1);   // sumar cantidad a factura
  writeln('Usted ha salido');
   clrscr;



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
     writeln('Nombre Completo Del Cliente: ');
     readln(Nombre_Cliente);
     writeln;
     write('Rif Del Cliente: ');
     readln(Rif_Cliente);
     writeln;
     writeln('Direccion Del Cliente');
     readln(Direccion_Cliente);
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
writeln;
writeln('codigo de barras (HACER)');
writeln('GRACIAS POR SU COMPRA, VUELVA PRONTO!!');
writeln;
writeln('------------------FIN------------------');
writeln;
Writeln('SELLO EMPRESA');

  readkey;

  

(*
 Cosas basicas para el project
bienvenido a la tienda nombre()   // YA
escoge un producto //YA
has seleccionado cafe //YA
cuanto desea llevar c/u cuesta 300  //YA
llevas 300 en el carrito, desea seguir escogiendo productos y/n?
Y
Volver al menu principal de menu
N
Digame nombre del cliente   // YA
rif del cliente        //ya
direccion           //ya
fecha de la compra   //ya
hora de la compra    //ya
nombre del cajero constante //ya
numero de factura   acumulador
--Detalle de la compra--
codigo del producto   acumulador
Descripción del producto.   contante
Cantidad.     variable que escogio
Costo del producto.   acumulador
Total de la compra.   variable sumatoria sin iva
IVA de la compra.    constante multiplicar
Total a pagar.   pagar con iva
Descripción del pago(Efectivo o con tarjeta de débito o con tarjeta de crédito)*)
end.
