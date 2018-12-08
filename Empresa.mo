model Empresa
  //Constants
  parameter Real ratiIncidencies = 0.0001;
  parameter Integer treballadors = 10000;
  parameter Real reopertures = 0.001;
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