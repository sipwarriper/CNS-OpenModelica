model Empresa
  //Constants
  parameter Real ratiIncidencies;
  parameter Integer treballadors;
  parameter Real reopertures;
  //connectors
  Incidencies generades;
  Incidencies tancades;
  //variables
  Real totalTancades (start = 0);
  Real totalObertes (start = 0);
  
equation
  generades.incidencies = treballadors*ratiIncidencies + totalTancades*reopertures;
  der(totalTancades) = totalTancades + tancades.incidencies;
  der (totalObertes) = totalObertes + treballadors*ratiIncidencies + totalTancades*reopertures;
  
  
end Empresa;