(* ::Package:: *)

BeginPackage[ "MyFunctions`"]

  MarketShare::usage = "ms[t_, n_, q0_, qi_] computes the market share of the specialist in period t."

  MarkupSpec::usage = "etaSpec[delta_, etaSpecLag_, msSpec_, etaBar_] computes the markup of the specialist."

  PriceSpec::usage = "pSpec[cs_, etaSpec_] computes the price of the specialist." 

  PriceFirmSelf::usage = "pFirmSelf[cSelf_, eta_] computes price of firm if it produces the smart component itself."

  PriceFirmSpec::usage = "pFirmSpec[cSpec_, eta_] computes the price of the firm if it buys the smart component."
  
  MarginalCostSelf::usage = "cSelf[cp_, cs_]:=cp + cs, computes the marginal costs if firm produces the smart component itself."

  MarginalCostSpec::usage = "cSpec[cp_,cs_, etaSpec_] computes the marginal costs if firm buys the smart component from specialist."

  CostFirmSelf::usage = "CostsFirmSelf[q_,cp_,cs_]:=q*cSelf[cp, cs], computes the total costs when the firm is producing the smart part itself."

  CostFirmSpec::usage = "CostFirmSpec[q_,cp_,cs_,etaSpec_]:=q*cSpec[cp, cs, etaSpec], computes the total costs when the firm buys the smart part from the specialist."

  CostFirmSelfQuad::usage = "CostFirmSelfQuad[percent_,q_,cp_,cs_]:=q*cSelf[cp, cs]+q^2*cSelf[cp, cs]*percent"

  CostFirmSpecQuad::usage = "CostFirmSpecQuad[percent_,q_,cp_,cs_,etaSpec_]:=q*cSpec[cp, cs, etaSpec] + q^2*cSpec[cp, cs, etaSpec]*percent"

  ProfitFirmSelf::usage = "ProfitFirmSelf[q_,p_,cp_cs_]:= q*p-CostFirmSelf[q,cp,cs]"

  ProfitFirmSpec::usage = "ProfitFirmSpec[q_,p_,cp_,cs_,etaSpec_]:=q*p - CostFirmSpec[q,cp,cs,etaSpec]"

  ProfitFirmSelfQuad::usage = "ProfitFirmSelfQuad[percent_, q_, p_, cp_, cs_]:= q*p - CostFirmSelfQuad[q, cp, cs]"

  ProfitFirmSpecQuad::usage = "ProfitFirmSpecQuad[percent_,q_,p_,cp_,cs_,etaSpec_]:=q*p - CostFirmSpecQuad[q,cp,cs,etaSpec]"

  RevenueFirmSelf::usage = "RevenueFirmSelf[q_, cp_, cs_, eta_]:= q * PriceFirmSelf[cp, cs, eta]"

  RevenueFirmSpec::usage = "RevenueFirmSelf[q_, cp_, cs_, eta_, etaSpec_]:= q * PriceFirmSpec[cp, cs, eta, etaSpec]"
  
  QualityFirmSpec::usage = "qualitySpec[uBar_, alpha_, beta_, qSpec_] computes the quality of the smart component produced by the specialist."

  QualityFirmSelf::usage = "qualityFirm[uBar_, alpha_, beta_, qFirm_] computes the quality of the smart component produced by the firm."

  Prob::usage= "probability[i_, priceList_, qualityList_] computes the probability that consumer j buys from firm i."

Begin["Private`"]

  MarginalCostSelf[cp_, cs_]:= cp + cs;

  MarginalCostSpec[cp_, cs_, etaSpec_]:= cp + PriceSpec[cs, etaSpec];

  CostFirmSelf[q_, cp_, cs_]:= q * MarginalCostSelf[cp, cs];

  CostFirmSpec[q_, cp_, cs_, etaSpec_]:= q * MarginalCostSpec[cp, cs, etaSpec];

  CostFirmSelfQuad[percent_ ,q_, cp_, cs_]:= q * MarginalCostSelf[cp, cs] + q^2 * MarginalCostSelf[cp, cs] * percent;

  CostFirmSpecQuad[percent_, q_, cp_, cs_, etaSpec_]:= q * MarginalCostSpec[cp, cs, etaSpec] + q^2 * MarginalCostSpec[cp, cs, etaSpec] * percent; 

  PriceSpec[cs_, etaSpec_] := (1 + etaSpec) * cs;

  PriceFirmSelf[cp_, cs_, \[Eta]_] := (1 + \[Eta]) * MarginalCostSelf[cp, cs];

  PriceFirmSpec[cp_, cs_, \[Eta]_, etaSpec_] := (1 + \[Eta]) * MarginalCostSpec[cp, cs, etaSpec];
  
  ProfitFirmSelf[q_, cp_, cs_, \[Eta]_]:= RevenueFirmSelf[q, cp, cs, \[Eta]] - CostFirmSelf[q, cp, cs];

  ProfitFirmSpec[q_, cp_, cs_, \[Eta]_, etaSpec_]:= RevenueFirmSpec[q, cp, cs, \[Eta], etaSpec] - CostFirmSpec[q, cp, cs, etaSpec];

  ProfitFirmSelfQuad[percent_, q_, cp_, cs_, \[Eta]_]:= RevenueFirmSelf[q, cp, cs, \[Eta]] - CostFirmSelfQuad[percent, q, cp, cs];
 
  ProfitFirmSpecQuad[percent_, q_, cp_, cs_, \[Eta]_, etaSpec_]:= RevenueFirmSpec[q, cp, cs, \[Eta], etaSpec] - CostFirmSpecQuad[percent, q, cp, cs, etaSpec];
 
  RevenueFirmSelf[q_, cp_, cs_, \[Eta]_]:= q * PriceFirmSelf[cp, cs, \[Eta]];

  RevenueFirmSpec[q_, cp_, cs_, \[Eta]_, etaSpec_]:= q * PriceFirmSpec[cp, cs, \[Eta], etaSpec];

  QualityFirmSelf[uBar_, \[Alpha]_, \[Beta]_, qFirmAgg_ ] := uBar * (1 + \[Beta]*qFirmAgg^\[Alpha]);

  QualityFirmSpec[uBar_, \[Alpha]_, \[Beta]_, qSpecAgg_] := uBar * (1 + \[Beta]*qSpecAgg^\[Alpha]);

  Prob[firm_, n_, priceList_, qualityList_, \[Kappa]_, \[Chi]_] := 
  Module[
  {i=firm, p = priceList, u = qualityList},
   Exp[-\[Chi] * Indexed[p,i] + \[Kappa] * Indexed[u,i]]/
   Sum[Exp[-\[Chi] * Indexed[p,k] + \[Kappa] * Indexed[u,k]], {k, 1, n}]
  ];

End[]

MarketShare[q0_, qi_] := q0 / Sum[qi[[t, i]], {i, 1, n}];

MarkupSpec[\[Delta]_, etaSpecLag_, msSpec_, etaBar_] := (1 - \[Delta]) * etaSpecLag + \[Delta] * msSpec * etaBar;

EndPackage[]






















