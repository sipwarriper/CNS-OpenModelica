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
//  Real incidenciesPendents (start = 0);
equation

  tancades.incidencies = min(entrada.incidencies*formacio*maximResolucions*treballadors, entrada.incidencies*formacio);
  seguentNivell.incidencies = entrada.incidencies*(1-formacio);
  entrada.incidencies-(entrada.incidencies*formacio*maximResolucions*treballadors)=0;

//  tancades.incidencies = max((entrada.incidencies + incidenciesPendents)*formacio*maximResolucions*treballadors, (entrada.incidencies + incidenciesPendents));
//  seguentNivell.incidencies = entrada.incidencies*(1-formacio);
//  (entrada.incidencies + incidenciesPendents)-((entrada.incidencies + incidenciesPendents)*formacio*maximResolucions*treballadors)=0;
//  der(incidenciesPendents) = max(0, (entrada.incidencies + incidenciesPendents)-((entrada.incidencies + incidenciesPendents)*formacio*maximResolucions*treballadors));
end Formacio;