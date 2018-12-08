model FormacioN1
  //Constants
  parameter Real formacio = 0.5;
  parameter Real maximResolucions = 0.41; //maxim de resolucions per persona i hora.
  //conexions
  Incidencies entrada;
  Incidencies tancades;
  Incidencies seguentNivell;
  //treballadors
  parameter Integer treballadors = 10;
  //variables
  Real incidenciesPendents (start = 0);
equation
  tancades.incidencies = (entrada.incidencies + incidenciesPendents)*formacio*maximResolucions*treballadors;
  seguentNivell.incidencies = entrada.incidencies*(1-formacio);
  der(incidenciesPendents) = max(0, (entrada.incidencies + incidenciesPendents)-((entrada.incidencies + incidenciesPendents)*formacio*maximResolucions*treballadors));
end FormacioN1;