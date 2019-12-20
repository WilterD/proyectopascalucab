program proyecto;
uses crt;
var producto,kgcafe,kgcacao,operacion,continuar:Integer;
    operador:String;
    rifoperador,cedula:Integer;
    salir:Boolean;
    
  begin
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
    write('Haz seleccionado cafe ');
    writeln; //salto de linea
    write('Cuantos kilos de cafe desea llevar?, cada kg cuesta 300 Bs');
    read(kgcafe);
    operacion:=operacion+(kgcafe*300);
    write('Llevas en el carrito, ',operacion:2:0,(' BS'));
    writeln;
    writeln('[1] Ir al menu principal');
    writeln;
    writeln('[2] pagar en caja');
    read(continuar);
    
    if continuar=2 then
      salir:=false
    end; //caso 1
      
  2:begin
    write('Haz seleccionado Cacao ');
    writeln; //salto de linea
    write('Cuantos kilos de cacao desea llevar?, cada kg cuesta 400 Bs');
    read(kgcafe);
    operacion:=operacion+(kgcacao*400);
    write('Llevas en el carrito, ',operacion:2:0,(' BS'));
    writeln;
    writeln('[1] Ir al menu principal');
    writeln;
    writeln('[2] pagar en caja');
    read(continuar);
    
    if continuar=2 then
      salir:=false
    end; //caso 2
  
  end; // Fin del case
  
  end; //while
  
  writeln('Usted ha salido');
  writeln('Operacion=',operacion:2:0);
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
Digame nombre del cliente
rif del cliente
direccion
fecha de la compra
hora de la compra
nombre del cajero constante
numero de factura   acumulador
--Detalle de la compra--
codigo del producto   constante
Descripción del producto.   contante
Cantidad.     variable que escogio
Costo del producto.   acumulador
Total de la compra.   variable sumatoria sin iva
IVA de la compra.    constante multiplicar
Total a pagar.   pagar con iva
Descripción del pago(Efectivo o con tarjeta de débito o con tarjeta de crédito)*)
end.
