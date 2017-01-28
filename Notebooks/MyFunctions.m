(* ::Package:: *)

BeginPackage[ "MyFunctions`"]

  CostFirmSelf::usage = "CostFirmSelf[q_, cp_, cs_]:= q * MarginalCostSelf[cp, cs], computes the total costs when the firm is producing the smart part itself."

  CostFirmSpec::usage = "CostFirmSpec[q_, cp_, cs_, etaSpec_]:= q * MarginalCostSpec[cp, cs, etaSpec], computes the total costs when the firm buys the smart part from the specialist."

  CostFirmSelfInc::usage = "CostFirmSelfInc[percent_,q_,cp_,cs_]:=q*cSelf[cp, cs]+q^2*cSelf[cp, cs]*percent, uses a quadratic cost function."

  CostFirmSpecInc::usage = "CostFirmSpecQuad[percent_,q_,cp_,cs_,etaSpec_]:=q*cSpec[cp, cs, etaSpec] + q^2*cSpec[cp, cs, etaSpec]*percent, uses a quadratic cot function."

  MarketShare::usage = "MarketShare[q0_, qi_] computes the market share of the specialist in period t."

  MarkupSpec::usage = "MarkupSpec[delta_, etaSpecLag_, msSpec_, etaBar_] computes the markup of the specialist."
  
  MarginalCostSelf::usage = "MarginalCostSelf[cp_, cs_]:=cp + cs, computes the marginal costs if firm produces the smart component itself."

  MarginalCostSpec::usage = "MarginalCostSpec[cp_,cs_, etaSpec_]:= cp + PriceSpec[cs, etaSpec], computes the marginal costs if firm buys the smart component from specialist."

  MarginalCostSelfInc::usage = "MarginalCostSelf[cp_, cs_]:=cp + cs, computes the marginal costs if firm produces the smart component itself."

  MarginalCostSpecInc::usage = "MarginalCostSpec[cp_,cs_, etaSpec_]:= cp + PriceSpec[cs, etaSpec], computes the marginal costs if firm buys the smart component from specialist."

  PriceSpec::usage = "PriceSpec[cs_, etaSpec_] := (1 + etaSpec) * cs, computes the price of the specialist." 

  PriceFirmSelf::usage = "PriceFirmSelf[cp_, cs_, \[Eta]_] := (1 + \[Eta]) * MarginalCostSelf[cp, cs], computes price of firm if it produces the smart component itself."

  PriceFirmSpec::usage = "PriceFirmSpec[cp_, cs_, \[Eta]_, etaSpec_] := (1 + \[Eta]) * MarginalCostSpec[cp, cs, etaSpec], computes the price of the firm if it buys the smart component."

  PriceFirmSelfInc::usage = "PriceFirmSelf[cp_, cs_, \[Eta]_] := (1 + \[Eta]) * MarginalCostSelf[cp, cs], computes price of firm if it produces the smart component itself."

  PriceFirmSpecInc::usage = "PriceFirmSpec[cp_, cs_, \[Eta]_, etaSpec_] := (1 + \[Eta]) * MarginalCostSpec[cp, cs, etaSpec], computes the price of the firm if it buys the smart component."

  Prob::usage= "Prob[firm_, priceList_, qualityList_, \[Kappa]_, \[Chi]_], computes the probability that an arbitrary consumer buys from a specific firm."
  
  ProfitFirmSelf::usage = "ProfitFirmSelf[q_, cp_, cs_, \[Eta]_]:= RevenueFirmSelf[q, cp, cs, \[Eta]] - CostFirmSelf[q, cp, cs], computes the profit of a firm that produces the smart part."

  ProfitFirmSpec::usage = "ProfitFirmSpec[q_, cp_, cs_, \[Eta]_, etaSpec_]:= RevenueFirmSpec[q, cp, cs, \[Eta], etaSpec] - CostFirmSpec[q, cp, cs, etaSpec], computes the profit of a firm that buys the smart part."

  ProfitFirmSelfInc::usage = "ProfitFirmSelfQuad[percent_, q_, cp_, cs_, \[Eta]_]:= RevenueFirmSelf[q, cp, cs, \[Eta]] - CostFirmSelfQuad[percent, q, cp, cs], 
								computes profit of a firm that produces the smart part and has a quadratic cost function."

  ProfitFirmSpecInc::usage = "ProfitFirmSpecQuad[percent_, q_, cp_, cs_, \[Eta]_, etaSpec_]:= RevenueFirmSpec[q, cp, cs, \[Eta], etaSpec] - CostFirmSpecQuad[percent, q, cp, cs, etaSpec],
								computes the profit of a firm that buys the smart part and has a quadratic cost function."

  QualityFirmSelf::usage = "QualityFirmSelf[uBar_, \[Alpha]_, \[Beta]_, qFirmAgg_ ] := uBar * (1 + \[Beta]*qFirmAgg^\[Alpha]), computes the quality of products if the smart part is produced by the firm."

  QualityFirmSpec::usage = "qualitySpec[uBar_, alpha_, beta_, qSpec_], computes the quality of products if the smart part is bought from the specialist."

  RevenueFirmSelf::usage = "RevenueFirmSelf[q_, cp_, cs_, eta_]:= q * PriceFirmSelf[cp, cs, eta], computes the revenue of a firm that produces the smart part."

  RevenueFirmSpec::usage = "RevenueFirmSelf[q_, cp_, cs_, eta_, etaSpec_]:= q * PriceFirmSpec[cp, cs, eta, etaSpec], computes the revenue of a firm the buy the smart part form the specialist."

  RevenueFirmSelfInc::usage = "RevenueFirmSelf[q_, cp_, cs_, eta_]:= q * PriceFirmSelf[cp, cs, eta], computes the revenue of a firm that produces the smart part."

  RevenueFirmSpecInc::usage = "RevenueFirmSelf[q_, cp_, cs_, eta_, etaSpec_]:= q * PriceFirmSpec[cp, cs, eta, etaSpec], computes the revenue of a firm the buy the smart part form the specialist."
  
Begin["Private`"]

  CostFirmSelf[q_, cp_, cs_]:= q * MarginalCostSelf[cp, cs];

  CostFirmSpec[q_, cp_, cs_, etaSpec_]:= q * MarginalCostSpec[cp, cs, etaSpec];

  CostFirmSelfInc[cp_, cs_, cparSelf_, \[Rho]Self_, expSelf_, q_, qAgg_]:= q * MarginalCostSelfInc[cp, cs, \[Rho]Self, expSelf] + qAgg * cparSelf;

  CostFirmSpecInc[cp_, cs_, cparSpec_, \[Rho]Spec_, expSelf_, q_, qAgg_, etaSpec_]:= q * MarginalCostSpecInc[cp, cs, \[Rho]Spec, expSelf, etaSpec] + qAgg * cparSpec; 

  MarginalCostSelf[cp_, cs_]:= cp + cs;

  MarginalCostSpec[cp_, cs_, etaSpec_]:= cp + PriceSpec[cs, etaSpec];
  
  MarginalCostSelfInc[cp_, cs_, \[Rho]Self_ ,expSelf_]:= \[Rho]Self*(cp + cs)^expSelf;

  MarginalCostSpecInc[cp_, cs_, \[Rho]Spec_, expSpec_, etaSpec_]:= \[Rho]Spec*(cp + PriceSpec[cs, etaSpec])^expSpec;

  PriceSpec[cs_, etaSpec_] := (1 + etaSpec) * cs;

  PriceFirmSelf[cp_, cs_, \[Eta]_] := (1 + \[Eta]) * MarginalCostSelf[cp, cs];

  PriceFirmSpec[cp_, cs_, \[Eta]_, etaSpec_] := (1 + \[Eta]) * MarginalCostSpec[cp, cs, etaSpec];

  PriceFirmSelfInc[cp_, cs_, \[Rho]Self_, expSelf_, \[Eta]_] := (1 + \[Eta]) * MarginalCostSelfInc[cp, cs, \[Rho]Self, expSelf];

  PriceFirmSpecInc[cp_, cs_, \[Rho]Spec_, expSpec_, etaSpec_, \[Eta]_] := (1 + \[Eta]) * MarginalCostSpecInc[cp, cs, \[Rho]Spec, expSpec, etaSpec];

  ProfitFirmSelf[q_, cp_, cs_, \[Eta]_]:= RevenueFirmSelf[q, cp, cs, \[Eta]] - CostFirmSelf[q, cp, cs];

  ProfitFirmSpec[q_, cp_, cs_, \[Eta]_, etaSpec_]:= RevenueFirmSpec[q, cp, cs, \[Eta], etaSpec] - CostFirmSpec[q, cp, cs, etaSpec];

  ProfitFirmSelfInc[cp_, cs_, cparSelf_, \[Rho]Self_, expSelf_, q_, \[Eta]_, qAgg_]:= RevenueFirmSelfInc[cp, cs, \[Rho]Self, expSelf, \[Eta], q] - CostFirmSelfInc[cp, cs, cparSelf, \[Rho]Self, expSelf, q, qAgg];
 
  ProfitFirmSpecInc[cp_, cs_, cparSpec_, \[Rho]Spec_, expSpec_, q_, \[Eta]_, etaSpec_, qAgg_]:= RevenueFirmSpecInc[cp, cs, \[Rho]Spec, expSpec, \[Eta], etaSpec, q] - CostFirmSpecInc[cp, cs, cparSpec, \[Rho]Spec, expSpec, q, qAgg, etaSpec];
 
  QualityFirmSelf[uBar_, \[Alpha]_, \[Beta]_, qFirmAgg_ ] := uBar * (1 + \[Beta]*qFirmAgg^\[Alpha]);

  QualityFirmSpec[uBar_, \[Alpha]_, \[Beta]_, qSpecAgg_] := uBar * (1 + \[Beta]*qSpecAgg^\[Alpha]);
  
  RevenueFirmSelf[q_, cp_, cs_, \[Eta]_]:= q * PriceFirmSelf[cp, cs, \[Eta]];

  RevenueFirmSpec[q_, cp_, cs_, \[Eta]_, etaSpec_]:= q * PriceFirmSpec[cp, cs, \[Eta], etaSpec];

  RevenueFirmSelfInc[cp_, cs_, \[Rho]Self_, expSelf_, \[Eta]_, q_]:= q * PriceFirmSelfInc[cp, cs, \[Rho]Self, expSelf, \[Eta]];

  RevenueFirmSpecInc[cp_, cs_, \[Rho]Spec_, expSpec_, \[Eta]_, etaSpec_, q_]:= q * PriceFirmSpecInc[cp, cs, \[Rho]Spec, expSpec, etaSpec, \[Eta]];

End[]

  Prob[firm_, priceList_, qualityList_, \[Kappa]_, \[Chi]_] := 
    Module[
    {i=firm, p = priceList, u = qualityList},
     Exp[-\[Chi] * Indexed[p,i] + \[Kappa] * Indexed[u,i]]/
     Sum[Exp[-\[Chi] * (Indexed[p,k] + \[Kappa] * Indexed[u,k])], {k, 1, n}]
    ];

  MarketShare[q0_, qi_] := q0 / Sum[qi[[t, i]], {i, 1, n}];

  MarkupSpec[\[Delta]_, etaSpecLag_, msSpec_, etaBar_] := (1 - \[Delta]) * etaSpecLag + \[Delta] * msSpec * etaBar;

EndPackage[]





































