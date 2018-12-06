model ServiceDesk
  //CONSTANTS
  parameter Real ratiIncidencies = 0.0001;
  parameter Integer treballadors = 10000;
  parameter Real formacioN1 = 0.5;
  parameter Real formacioN2 = 0.5;
  parameter Real reopertures = 0.001;
  Integer incidencies (start = 0);
  Integer horesPassades (start = 0);
  Integer resoltesN1 (start = 0);
  Integer resoltesN2 (start = 0);
  Integer resoltesN3 (start = 0);
 equation
  der(resoltesN1) = resoltesN1+min(incidencies*formacioN1, 0.42*hores);
  der(resoltesN2) = resoltesN2+min(incidencies*(1-formacioN1)*formacioN2, 0.42*hores);
  der(resoltesN3) = resoltesN3+min(incidencies*(1-formacioN1)*(1-formacioN2), 0.42*hores);
  der(incidencies) = incidencies + treballadors*ratiIncidencies*horesPassades - resoltesN1 - resoltesN2 - resoltesN3;
  der(horesPassades) = hores+1;