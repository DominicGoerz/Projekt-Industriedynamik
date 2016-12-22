(* ::Package:: *)

BeginPackage[ "MyFunctions`"]

  ms::usage = "ms[t_, n_, q0_, qi_] computes the market share of the specialist in period t."

  etaSpec::usage = "etaSpec[delta_, etaSpecLag_, msSpec_, etaBar_] computes the markup of the specialist."

  pSpec::usage = "pSpec[cs_, etaSpec_] computes the price of the specialist." 

  pFirmSelf::usage = "pFirmSelf[cSelf_, eta_] computes price of firm if it produces the smart component itself."

  pFirmSpec::usage = "pFirmSpec[cSpec_, eta_] computes the price of the firm if it buys the smart component."
  
  cSelf::usage = "cSelf[cp_, cs_] computes the marginal costs if firm produces the smart component itself."

  cSpec::usage = "cSpec[cp_,cs_, etaSpec_] computes the marginal costs if firm buys the smart component from specialist."

  profit::usage = "profit[q_, p_, c_] computes the profit."

  qualitySpec::usage = "qualitySpec[uBar_, alpha_, beta_, qSpec_] computes the quality of the smart component produced by the specialist."

  qualityFirm::usage = "qualityFirm[uBar_, alpha_, beta_, qFirm_] computes the quality of the smart component produced by the firm."

  probability::usage= "probability[i_, priceList_, qualityList_] computes the probability that consumer j buys from firm i."

Begin["Private`"]

  pSpec[cs_, etaSpec_] := (1 + etaSpec)*cs;

  pFirmSelf[cSelf_, eta_] := (1 + eta)*cSelf;

  pFirmSpec[cSpec_, etaSpec_] := (1 + etaSpec)*cSpec;

  cSelf[cp_, cs_]:=cp + cs;

  cSpec[cp_,cs_, etaSpec_]:=cp + pSpec[cs, etaSpec];

  profit[q_, p_, c_] := q*p - c*q;
   
  qualitySpec[uBar_, alpha_, beta_, qSpec_] := uBar*(1 + beta*qSpec^alpha);

  qualityFirm[uBar_, alpha_, beta_, qFirm_ ] := uBar*(1 + beta*qFirm^alpha);

End[]

ms[q0_, qi_] := q0 / Sum[qi[[t, i]], {i, 1, n}];

etaSpec[delta_, etaSpecLag_, msSpec_, etaBar_] := (1 - delta)*etaSpecLag + delta*msSpec*etaBar;

probability[priceList_, qualityList_] := 
  Module[
  {p = priceList, u = qualityList},
   Exp[-chi*Indexed[p,i] + katta*Indexed[u,i]]/
   Sum[Exp[-chi*Indexed[p,k] + katta*Indexed[u,k]], {k, 1, n}]
  ];

EndPackage[]






