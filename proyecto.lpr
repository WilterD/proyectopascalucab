program proyecto;
uses crt,dos; {dos-es-to-fecha}
var producto,kgcafe,kgcacao,operacion,continuar:Integer;
    operador,supago,Nombre_Cliente,Direccion_Cliente,Direccion_Empresa,ejemplo:String;
    rifoperador,cedula,MetodoPago,Rif_Cliente,codigo_producto1:Integer;
    salir:Boolean;

var    a, m, d, ds : word;   {fecha}
   h, mm, s, ns : word; {hora}
const iva=0.13;
  const Rif_Empresa=289229998;


    
  begin

  // Variables para inicializar:
  codigo_producto1:=0;

  ejemplo:=('Ejemplo');




  salir:=false;
  operacion:=0;
  writeln('Bienvenido a nuestra tienda EL CAMPO C.A');
  writeln;//salto de linea
  writeln('Ingrese sus datos como operador');
  writeln;
  writeln('Nombre:');
  readln(operador);
  writeln;
  writeln('Cedula:');
  readln(rifoperador);
  writeln;
  
  while salir=false do
  begin
  writeln('Selecciona un producto');
  writeln('Cafe: 1');
  writeln('Cacao: 2');
  writeln; //salto de linea
  read(producto);
 //primero comenzamos con un producto para luego ir replicando a otros"
  
  case producto of
  
  1:begin
  codigo_producto1:=12345;
    write('Haz seleccionado cafe ');
    writeln; //salto de linea
    write('Cuantos kilos de cafe desea llevar?, cada kg cuesta 300 Bs');
    read(kgcafe);
    operacion:=operacion+(kgcafe*300);
    write('Llevas en el carrito, ',operacion,(' BS'));
    writeln;
    writeln('[1] Ir al menu principal');
    writeln;
    writeln('[2] pagar en caja');
    read(continuar);
    
    if continuar=2 then
      salir:=true
    end; //caso 1
      
  2:begin
    write('Haz seleccionado Cacao ');
    writeln; //salto de linea
    write('Cuantos kilos de cacao desea llevar?, cada kg cuesta 400 Bs');
    read(kgcacao);
    operacion:=operacion+(kgcacao*400);
    write('Llevas en el carrito, ',operacion,(' BS'));
    writeln;
    writeln('[1] Ir al menu principal');
    writeln;
    writeln('[2] pagar en caja');
    read(continuar);
    
    if continuar=2 then
      salir:=true
    end; //caso 2
  
  end; // Fin del case
  
  end; //while
  
  writeln('Usted ha salido');
  writeln('Operacion=',operacion);


        writeln;
        clrscr;
        textcolor(18);
    write('Como desea pagar?');
    writeln;
    writeln('[1] Tarjeta De Credito');
    writeln('-----------------------');
    writeln('[2] Tarjeta De Debito');
    writeln('-----------------------');
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
     writeln('Rif Del Cliente: ');
     readln(Rif_Cliente);
     writeln('Direccion Del Cliente');
     readln(Direccion_Cliente);

  {Datos Empresa}
  Direccion_Empresa:=('DIRECCION EMPRESARIAL EL CAMPO: ');


     {FACTURA}
clrscr;
textcolor(15);
writeln(Direccion_Empresa);
writeln;

writeln('Rif:',Rif_Empresa);
writeln;

getdate(a,m,d,ds);
gettime(h,mm,s,ns);
writeln('FECHA: ----- ',d,'/',m,'/',a);
writeln;
writeln('HORA: ------ ',h,':',mm,':',s);
writeln;

writeln('Datos Del Cliente:');
writeln('Nombre: ',Nombre_Cliente);
writeln('Direccion: ',Direccion_Cliente);
writeln('Rif: ',Rif_Cliente); //detecta solo el rif
writeln;

writeln('Nombre Del Cajero: ',operador);

writeln('Numero #Factura, ');   //Acumulador

writeln('Codigo del producto: ',codigo_producto1);  // codigo del producto

write('Cantidad De Productos: -----',ejemplo);
writeln;
write('------ (costo)',ejemplo);
 writeln;
writeln('COSTO TOTAL ---- ',operacion*iva+operacion:0:2);

writeln('su metodo de pago es: ',supago); //obteniendo metodo pago
writeln;
writeln;
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
