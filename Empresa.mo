model Empresa
  //Constants
  parameter Real ratiIncidencies;
  parameter Integer usuaris;
  parameter Real reopertures;
  //connectors
  Incidencies generades;
  Incidencies tancades;
  //variables
  //Real totalTancades (start = 0);
  //Real totalObertes (start = 0);
  Real tancadesAra (start = 0, fixed = true);
  
equation
  generades.incidencies = usuaris*ratiIncidencies + usuaris*ratiIncidencies*reopertures;
  der(tancadesAra) = usuaris*ratiIncidencies;
  
  //der(totalTancades) = totalTancades + tancades.incidencies;
  //der (totalObertes) = totalObertes + treballadors*ratiIncidencies + tencadesAra*reopertures;
  
end Empresa;