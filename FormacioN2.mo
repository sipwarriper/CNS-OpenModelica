model FormacioN2
  //Constants
  parameter Real formacio = 0.5;
  parameter Real maximResolucions = 0.41; //maxim de resolucions per persona i hora.
  //conexions
  Incidencies entrada;
  Incidencies tancades;
  Incidencies seguentNivell;
  //variables
  Integer treballadors;
  Real incidenciesPendents (start = 0);
equation
  tancades.incidencies = (entrada.incidencies + incidenciesPendents)*formacio*maximResolucions*treballadors;
  seguentNivell.incidencies = entrada.incidencies*(1-formacio);
  der(incidenciesPendents) = max(0, (entrada.incidencies + incidenciesPendents)-((entrada.incidencies + incidenciesPendents)*formacio*maximResolucions*treballadors));
end FormacioN2;