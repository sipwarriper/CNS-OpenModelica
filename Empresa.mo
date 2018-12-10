model Empresa
  //Constants
  parameter Real ratiIncidencies;
  parameter Integer treballadors;
  parameter Real reopertures;
  //connectors
  Incidencies generades;
  Incidencies tancades;
  //variables
  //Real totalTancades (start = 0);
  //Real totalObertes (start = 0);
  Real tencadesAra (start = 0, fixed = true);
  
equation
  generades.incidencies = treballadors*ratiIncidencies + treballadors*ratiIncidencies*reopertures;
  der(tencadesAra) = treballadors*ratiIncidencies;
  //der(totalTancades) = totalTancades + tancades.incidencies;
  //der (totalObertes) = totalObertes + treballadors*ratiIncidencies + tencadesAra*reopertures;
  
  
end Empresa;