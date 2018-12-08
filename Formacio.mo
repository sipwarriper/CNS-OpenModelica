model Formacio
  //Constants
  parameter Real formacio;
  parameter Real maximResolucions; //maxim de resolucions per persona i hora.
  //conexions
  Incidencies entrada;
  Incidencies tancades;
  Incidencies seguentNivell;
  //treballadors
  Integer treballadors;
  //variables
  Real incidenciesPendents (start = 0);
equation
  tancades.incidencies = (entrada.incidencies + incidenciesPendents)*formacio*maximResolucions*treballadors;
  seguentNivell.incidencies = entrada.incidencies*(1-formacio);
  (entrada.incidencies + incidenciesPendents)-((entrada.incidencies + incidenciesPendents)*formacio*maximResolucions*treballadors)=0;
  der(incidenciesPendents) = max(0, (entrada.incidencies + incidenciesPendents)-((entrada.incidencies + incidenciesPendents)*formacio*maximResolucions*treballadors));
end Formacio;