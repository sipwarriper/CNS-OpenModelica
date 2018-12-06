model ServiceDesk
  //CONSTANTS
  parameter Real ratiIncidencies = 0.0001;
  parameter Integer treballadors = 10000;
  parameter Real formacioN1 = 0.5;
  parameter Real formacioN2 = 0.5;
  parameter Real reopertures = 0.001;
  parameter Real maximResolucions = 0.41;
  parameter Integer treballadorsN1 = 10;
  parameter Integer treballadorsN2 = 10;
  parameter Integer treballadorsN3 = 10;
  
  //Variables
  Real incidencies (start = 0);
  Real resoltesN1 (start = 0);
  Real resoltesN2 (start = 0);
  Real resoltesN3 (start = 0);
  Real incidenciesTencades (start = 0);
  Real incidenciesTotals (start = 0);
 equation
  der(resoltesN1) = resoltesN1+ incidencies*formacioN1*treballadorsN1*maximResolucions;
  der(resoltesN2) = resoltesN2+ incidencies*(1-formacioN1)*formacioN2*treballadorsN2*maximResolucions;
  der(resoltesN3) = resoltesN3+ incidencies*(1-formacioN1)*(1-formacioN2)*treballadorsN3*maximResolucions;
  der(incidencies) = incidencies + treballadors*ratiIncidencies - resoltesN1 - resoltesN2 - resoltesN3 + (resoltesN1 + resoltesN2 + resoltesN3)*reopertures;
  der(incidenciesTencades) = resoltesN1+resoltesN2+resoltesN3;
  der(incidenciesTotals) = incidenciesTotals + incidencies + treballadors*ratiIncidencies+ (resoltesN1 + resoltesN2 + resoltesN3)*reopertures;
end ServiceDesk;