program proyecto;
     uses crt;
var producto,kgcafe,operacion,continuar: real;
 begin
   writeln('Bienvenido a nuestra tienda EL CAMPO C.A');
   writeln();//salto de linea
writeln('selecciona un producto');
writeln('Cafe: 1');
writeln(); //salto de linea
read(producto);
 //primero comenzamos con un producto para luego ir replicando a otros"
if producto=1 then
textcolor(15);
write('has seleccionado cafe ');
writeln(); //salto de linea
write(' cuantos kilos de cafe desea llevar?, cada kg cuesta 300 Bs');
read(kgcafe);
operacion:=kgcafe*300;
write('Llevas en el carrito, ',operacion:2:0,(' BS'));
writeln;
writeln('[1] Ir al menu principal');
writeln;
writeln('[2] pagar en caja');
read(continuar);
case continuar of
1:
  begin  // regresar al menu principal
   numero:
  end;
end;



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



