/*TRGGERS 2*/
DESC emple
--EJER1
CREATE OR REPLACE TRIGGER dskvfdlskv
AFTER INSERT ON productos2
FOR EACH ROW
BEGIN
  INSERT INTO precios_productos2(co_producto, precio, fecha_actualizacion)
  VALUES (:NEW.co_producto, 100, sysdate);
END;

INSERT INTO productos2 (no_producto) VALUES('Pantalon');
INSERT INTO productos2 (no_producto) VALUES('Zapatos');
INSERT INTO productos2 (no_producto) VALUES('Comida');

--EJER2
CREATE OR REPLACE TRIGGER insert_comision
BEFORE INSERT ON emple
FOR EACH ROW
BEGIN
  IF :NEW.comision IS NULL OR :NEW.comision = 0
    THEN RAISE_APPLICATION_ERROR(-20001, 'No puedes insertarlo con un nulo o 0 en su comision');
  END IF;
END;

INSERT INTO EMPLE VALUES (7777,'Rodrigo','EMPLEADO',7782,'23/01/1982',169000,0,10);
INSERT INTO EMPLE VALUES (7777,'Rodrigo','EMPLEADO',7782,'23/01/1982',169000,null,10);
    
--EJER3
ALTER TRIGGER insert_comision DISABLE;

CREATE OR REPLACE TRIGGER insert_comision
BEFORE INSERT ON emple
FOR EACH ROW
DECLARE
BEGIN
  IF :NEW.comision IS NULL OR :NEW.comision = 0
    THEN :NEW.comision := 1;
  END IF;
END;

INSERT INTO EMPLE VALUES (7777,'Rodrigo','EMPLEADO',7782,'23/01/1982',169000,null,10);

--EJER4
CREATE OR REPLACE TRIGGER dksjgfdklg
BEFORE INSERT OR UPDATE ON emple
FOR EACH ROW
DECLARE
  v_emp 
BEGIN
END;  

INSERT INTO EMPLE VALUES (7778,'Rodrigo','EMPLEADO',7782,'23/01/1982',169000,NULL,10);
INSERT INTO EMPLE VALUES (7799,'Miñana','EMPLEADO',7698,'23/01/1982',169000,NULL,10);  






















































