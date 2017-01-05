(* ::Package:: *)

BeginPackage[ "MyFunctions`"]

  ms::usage = "ms[t_, n_, q0_, qi_] computes the market share of the specialist in period t."

  etaSpec::usage = "etaSpec[delta_, etaSpecLag_, msSpec_, etaBar_] computes the markup of the specialist."

  pSpec::usage = "pSpec[cs_, etaSpec_] computes the price of the specialist." 

  pFirmSelf::usage = "pFirmSelf[cSelf_, eta_] computes price of firm if it produces the smart component itself."

  pFirmSpec::usage = "pFirmSpec[cSpec_, eta_] computes the price of the firm if it buys the smart component."
  
  cSelf::usage = "cSelf[cp_, cs_]:=cp + cs, computes the marginal costs if firm produces the smart component itself."

  cSpec::usage = "cSpec[cp_,cs_, etaSpec_] computes the marginal costs if firm buys the smart component from specialist."

  CostFirmSelf::usage = "CostsFirmSelf[q_,cp_,cs_]:=q*cSelf[cp, cs], computes the total costs when the firm is producing the smart part itself."

  CostFirmSpec::usage = "CostFirmSpec[q_,cp_,cs_,etaSpec_]:=q*cSpec[cp, cs, etaSpec], computes the total costs when the firm buys the smart part from the specialist."

  CostFirmSelfQuad::usage = "CostFirmSelfQuad[percent_,q_,cp_,cs_]:=q*cSelf[cp, cs]+q^2*cSelf[cp, cs]*percent"

  CostFirmSpecQuad::usage = "CostFirmSpecQuad[percent_,q_,cp_,cs_,etaSpec_]:=q*cSpec[cp, cs, etaSpec] + q^2*cSpec[cp, cs, etaSpec]*percent"

  profit::usage = "profit[q_, p_, c_] computes the profit."

  ProfitFirmSelf::usage = "ProfitFirmSelf[q_,p_,cp_cs_]:= q*p-CostFirmSelf[q,cp,cs]"

  ProfitFirmSpec::usage = "ProfitFirmSpec[q_,p_,cp_,cs_,etaSpec_]:=q*p - CostFirmSpec[q,cp,cs,etaSpec]"

  ProfitFirmSelfQuad::usage = "ProfitFirmSelfQuad[percent_, q_, p_, cp_, cs_]:= q*p - CostFirmSelfQuad[q, cp, cs]"

  ProfitFirmSpecQuad::usage = "ProfitFirmSpecQuad[percent_,q_,p_,cp_,cs_,etaSpec_]:=q*p - CostFirmSpecQuad[q,cp,cs,etaSpec]"

  qualitySpec::usage = "qualitySpec[uBar_, alpha_, beta_, qSpec_] computes the quality of the smart component produced by the specialist."

  qualityFirm::usage = "qualityFirm[uBar_, alpha_, beta_, qFirm_] computes the quality of the smart component produced by the firm."

  probability::usage= "probability[i_, priceList_, qualityList_] computes the probability that consumer j buys from firm i."

Begin["Private`"]

  pSpec[cs_, etaSpec_] := (1 + etaSpec)*cs;

  pFirmSelf[cSelf_, eta_] := (1 + eta)*cSelf;

  pFirmSpec[cSpec_, etaSpec_] := (1 + etaSpec)*cSpec;

  cSelf[cp_, cs_]:=cp + cs;

  cSpec[cp_, cs_, etaSpec_]:=cp + pSpec[cs, etaSpec];

  CostFirmSelf[q_, cp_, cs_]:=q*cSelf[cp, cs];

  CostFirmSpec[q_, cp_, cs_, etaSpec_]:=q*cSpec[cp, cs, etaSpec];

  CostFirmSelfQuad[percent_ ,q_, cp_, cs_]:=q*cSelf[cp, cs] + q^2*cSelf[cp, cs]*percent;

  CostFirmSpecQuad[percent_, q_, cp_, cs_, etaSpec_]:=q*cSpec[cp, cs, etaSpec] + q^2*cSpec[cp, cs, etaSpec]*percent; 

  profit[q_, p_, c_] := q*p - c*q;
  
  ProfitFirmSelf[q_,p_,cp_,cs_]:= q*p - CostFirmSelf[q,cp,cs];

  ProfitFirmSpec[q_,p_,cp_,cs_,etaSpec_]:=q*p - CostFirmSpec[q,cp,cs,etaSpec];

  ProfitFirmSelfQuad[percent_,q_,p_,cp_,cs_]:= q*p-CostFirmSelfQuad[percent,q,cp,cs];

  ProfitFirmSpecQuad[percent_,q_,p_,cp_,cs_,etaSpec_]:=q*p - CostFirmSpecQuad[percent,q,cp,cs,etaSpec];
 
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




