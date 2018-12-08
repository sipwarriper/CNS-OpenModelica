model FormacioN3
  //Constants
  parameter Real formacio = 0.5;
  parameter Real maximResolucions = 0.41; //maxim de resolucions per persona i hora.
  //conexions
  Incidencies entrada;
  Incidencies tancades;
  //treballadors
  parameter Integer treballadors = 10;
  //variables
  Real incidenciesPendents (start = 0);
equation
  tancades.incidencies = (entrada.incidencies + incidenciesPendents)*formacio*maximResolucions*treballadors;
  der(incidenciesPendents) = max(0, (entrada.incidencies + incidenciesPendents)-((entrada.incidencies + incidenciesPendents)*formacio*maximResolucions*treballadors));
  

end FormacioN3;