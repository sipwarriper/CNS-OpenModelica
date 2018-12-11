model Empresa2
  //Constants
  parameter Real ratiIncidencies;
  parameter Integer usuaris;
  parameter Real reopertures;
  //connectors
  Incidencies generades;
  Incidencies tancades;
  //variables
  Real tancadesAra (start = 0, fixed = true);
  Real BonusUsuaris;
equation
  generades.incidencies = (usuaris+BonusUsuaris)*ratiIncidencies + usuaris*ratiIncidencies*reopertures;
  der(tancadesAra) = (usuaris+BonusUsuaris)*ratiIncidencies;
  if time >= 2400 then 
    BonusUsuaris = 3000;  
  else
    BonusUsuaris = 0;
  end if;    
  
end Empresa2;