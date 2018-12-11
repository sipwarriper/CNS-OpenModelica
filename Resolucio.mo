model Resolucio
  //Constants
  parameter Real formacio; // % d'incidències que es poden solucionar a aquest nivell
  parameter Real maximResolucions; //maxim de resolucions per persona i hora.
  //conexions
  Incidencies entrada;
  Incidencies tancades;
  Incidencies seguentNivell;
  //treballadors
  Integer treballadors;
  //variables
  //Real incidenciesPendents (start = 0);
  
equation
  tancades.incidencies = entrada.incidencies*formacio;
  seguentNivell.incidencies = entrada.incidencies*(1-formacio);
  treballadors = ceil((entrada.incidencies*formacio)/maximResolucions);

  //  tancades.incidencies = max((entrada.incidencies + incidenciesPendents)*formacio*maximResolucions*treballadors, (entrada.incidencies + incidenciesPendents));
  //  seguentNivell.incidencies = entrada.incidencies*(1-formacio);
  //  (entrada.incidencies + incidenciesPendents)-((entrada.incidencies + incidenciesPendents)*formacio*maximResolucions*treballadors)=0;
  //  der(incidenciesPendents) = max(0, (entrada.incidencies + incidenciesPendents)-((entrada.incidencies + incidenciesPendents)*formacio*maximResolucions*treballadors));
end Resolucio;