model UnificadorSolucionades
  Incidencies n1;
  Incidencies n2;
  Incidencies n3;
  Incidencies sortida;
equation
  sortida.incidencies = n1.incidencies + n2.incidencies + n3.incidencies;
  
end UnificadorSolucionades;