/*PAQUETES*/
set serveroutput on
create or replace package gest_depart is
type tcursor is ref cursor;
procedure insertar_depart 
  (vnombre varchar2,vloc varchar2);
procedure borrar_depart 
  (vnrodp number,nroemple number);
procedure cambiar_localidad 
  (vnombredp varchar2,vlocdp varchar2);
procedure visualizar_lista_depart
  (cdepart out tcursor);
procedure visualizar_datos_depart 
  (nrodp varchar2,nroemp out varchar2,
  nrodep varchar2,numdeemp out number);
procedure visualizar_datos_depart 
  (vnombredp depart.dnombre%type,depart out tcursor,
  numemples out number);
end gest_depart;
/
CREATE OR REPLACE PACKAGE BODY gest_depart IS
procedure insertar_depart 
  (vnombre varchar2,vloc varchar2)
  is
    vnro depart.dept_no%type;
    vnroMax depart.dept_no%type;
    begin
      select max(dept_no)into vnroMax from depart;
      select dept_no into vnro from depart where dnombre=vnombre;
      exception
        when no_data_found then insert into depart values(vnroMax+10,vnombre,vloc);
        when others then dbms_output.put_line('Nop');
  end insertar_depart;
procedure borrar_depart 
  (vnrodp number,nroemple number)
  is
  begin
    update emple set dept_no=nroemple
    where dept_no=vnrodp;
    delete from depart where dept_no=vnrodp;   
  end borrar_depart;
procedure cambiar_localidad 
  (vnombredp varchar2,vlocdp varchar2)
  is
  begin
    null;
  end;
procedure visualizar_lista_depart
  (cdepart out tcursor)
  is
  begin
    open cdepart for
      select dept_no, dnombre, loc from depart;
  end visualizar_lista_depart;
procedure visualizar_datos_depart 
  (nrodp varchar2,nroemp out varchar2,
  nrodep varchar2,numdeemp out number)
  is
  begin
    null;
  end;
procedure visualizar_datos_depart 
  (vnombredp depart.dnombre%type,depart out tcursor,
  numemples out number)
  is
  begin
    null;
  end;
  end gest_depart;
/ 
execute gest_depart.insertar_depart ('hola','prueba');
select * from depart;

execute gest_depart.borrar_depart ('30','20');
execute gest_depart.visualizar_lista_depart(cdepart);
declare
  tcursor gest_depart.tcursor;
  vdept_no depart.dept_no%type;
  vdnombre depart.dnombre%type;
  vloc depart.loc%type;
  begin
     gest_depart.visualizar_lista_depart(tcursor);
    loop
      fetch tcursor into vdept_no,vdnombre,vloc;
      exit when tcursor%notfound;
      dbms_output.put_line(vdept_no||' '||vdnombre);
      end loop;
  end;
select * from depart;
select * from emple;
rollback;

