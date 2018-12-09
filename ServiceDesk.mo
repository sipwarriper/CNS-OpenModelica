model ServiceDesk
  //Elements
  Resolucio n1(formacio=0.5, maximResolucions=0.41);
  Resolucio n2(formacio=0.5, maximResolucions=0.41);
  Resolucio n3(formacio=1, maximResolucions=0.41);
  Empresa empresa(ratiIncidencies = 0.0001,treballadors = 10000,reopertures = 0.001);
  UnificadorSolucionades uniSolv;
equation
  connect(empresa.generades, n1.entrada);
  connect(n1.seguentNivell, n2.entrada);
  connect(n2.seguentNivell, n3.entrada);
  connect(n1.tancades, uniSolv.n1);
  connect(n2.tancades, uniSolv.n2);
  connect(n3.tancades, uniSolv.n3);
  connect(uniSolv.sortida, empresa.tancades);
  
end ServiceDesk;