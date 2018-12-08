model FormacioN3
  //Constants
  parameter Real maximResolucions; //maxim de resolucions per persona i hora.
  //conexions
  Incidencies entrada;
  Incidencies tancades;
  //treballadors
  Integer treballadors;
  //variables
  Real incidenciesPendents (start = 0);
equation
  tancades.incidencies = (entrada.incidencies + incidenciesPendents)*maximResolucions*treballadors;
  (entrada.incidencies + incidenciesPendents)-((entrada.incidencies + incidenciesPendents)*maximResolucions*treballadors)=0;
  der(incidenciesPendents) = max(0, (entrada.incidencies + incidenciesPendents)-((entrada.incidencies + incidenciesPendents)*maximResolucions*treballadors));
  

end FormacioN3;