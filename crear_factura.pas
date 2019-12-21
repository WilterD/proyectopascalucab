program crear_factura;

{$mode objfpc}{$H+}

uses
  sysutils,
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes;   // librerias

var
  f:textfile; // var de tipo texto
  linetxt:string;
  var leer_factura: integer;
  var cosa:string;

    // EJEMPLO PARA APLICAR A PROYECTO FACTURA

begin
writeln('Para crear Factura [4]');
  writeln('Leer Facturas En La Base de Datos [5]');
  readln(leer_factura);

  if leer_factura=5 then
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

   // Escribir en factura
  if leer_factura=4 then

  begin

  writeln('Escribir datos en factura leidos');
  readln(cosa);
  assignfile(f, 'bloc_archivo.txt');
  try
    rewrite(f);
    writeln(f, cosa);
    writeln(f, '--------------');
    close(f);
  except
    writeln('Error En El Sistema');
  end;
  end;

  writeln;
  writeln;
  writeln('Presiona alguna tecla para salir');
  readln;
end.

