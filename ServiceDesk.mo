model ServiceDesk
  //Elements
  FormacioN1 n1;
  FormacioN2 n2;
  FormacioN3 n3;
  Empresa empresa;
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