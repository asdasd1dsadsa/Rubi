(* ::Package:: *)

(* ::Title:: *)
(*Rubi (Rule-Based Integrator) Package*)


BeginPackage["Rubi`"];


Int::usage = "Int[expn, var] returns the antiderivative (indefinite integral) of <expn> with respect to <var>.\n" <>
    "Int[{expn1, expn2, ...},var] returns a list of the antiderivatives of <expn1>, <expn2>, ... each with respect to <var>." <>
    "Int[expn, {var, a, b}] returns the limit of the antiderivative of <expn> as <var> approaches <b> minus the limit as <var> approaches <a>. " <>
    "Note that this difference will NOT always equal the definite integral of <expn> from <a> to <b>.";
(*"Int[expn, var, Step] displays the first step used to integrate <expn> with respect to <var>, and returns the intermediate result.*)
(*Int[expn, var, Steps] displays all the steps used to integrate <expn> with respect to <var>, and returns the antiderivative.*)
(*Int[expn, var, Stats], before returning the antiderivative of <expn> with respect to <var>, displays a list of statistics of the form {a, b, c, d, e} where *)
(*<a> is the number of steps used to integrate <expn>, *)
(*<b> is the number of distinct rules used to integrate <expn>, *)
(*<c> is the leaf count size of <expn>, *)
(*<d> is the leaf count size of the antiderivative, and*)
(*<e> is the rule-to-size ratio of the integration (i.e. the quotient of <b> and <c>).*)
(*Int[{expn1, expn2, ...}, var] returns a list of the antiderivatives of <expn1>, <expn2>, ... each with respect to <var>.*)
(*Int[expn, {var, a, b}] returns the limit of the antiderivative of <expn> as <var> approaches <b> minus the limit as <var> approaches <a>.  Note that this difference will NOT always equal the definite integral of <expn> from <a> to <b>.",*)

(*"Int[expn, var] returns the antiderivative (indefinite integral) of <expn> with respect to <var>.*)
(*Int[{expn1, expn2, ...},var] returns a list of the antiderivatives of <expn1>, <expn2>, ... each with respect to <var>.*)
(*Int[expn, {var, a, b}] returns the limit of the antiderivative of <expn> as <var> approaches <b> minus the limit as <var> approaches <a>.  Note that this difference will NOT always equal the definite integral of <expn> from <a> to <b>."];*)


Dist::usage = "Dist[expn1,expn2,var] distributes <expn1> over <expn2>.";
Subst::usage = "Subst[expn1,var,expn2] substitutes <expn2> for <var> in <expn1>.";
Step::usage = "Int[expn, var, Step] displays the first step in the integration of <expn> with respect to <var> and returns the intermediate result.";
Steps::usage = "Int[expn, var, Steps] displays all the steps in the integration of <expn> with respect to <var> and returns the antiderivative.";
Stats::usage = "Int[expn, var, Stats] before returning the antiderivative <expn> with respect to <var>, displays a list {a, b, c, d, e} of statistics.";

RubiRule::usage = "RubiRule is a symbolic wrapper that is used when displaying integration steps.";
RubiIntermediateResult::usage = "RubiIntermediateResult is a symbolic wrapper that is used when displaying integration steps.";
RubiStats::usage = "RubiStats is a symbolic wrapper that contains statistical information about an integration." <>
    "It consists of (a) the number of steps used to integrate, (b) the number of distinct rules used, (c) is the leaf count size of the input," <>
    "(d) the leaf count size of the antiderivative, and (e) the rule-to-size ratio of the integration (i.e. the quotient of (b) and (c)).";

Unintegrable::usage = "Unintegrable[expn,var] indicates <expn> is not integrable with respect to <var> in closed-form.";
CannotIntegrate::usage = "CannotIntegrate[expn,var] indicates Rubi is unable to integrate <expn> with respect to <var>.";


$Unintegrable::usage = "If $Unintegrable is True and <expn> is not integrable with respect to <var> in terms of the functions Rubi uses to express antiderivatives, Int[expn,var] returns Unintegrable[expn,var].";


$RuleColor::usage = "$RuleColor is the color used to display rules when showing integration steps. The default rule color is red.";
$ConditionColor::usage = "$ConditionColor is the color used to display application conditions when showing integration steps. The default condition color is blue.";
$StepCounter::usage = "If the ShowSteps package has been loaded and $StepCounter is an integer, it is incremented each time an integration rule is applied.";


sin::usage = "Inert sine function";
cos::usage = "Inert cosine function";
tan::usage = "Inert tangent function";
cot::usage = "Inert cotangent function";
sec::usage = "Inert secant function";
csc::usage = "Inert cosecant function";


Begin["`Private`"];


$LoadShowSteps = Global`$LoadShowSteps;



$rulePackages = FileNames["*.m", {FileNameJoin[{DirectoryName[System`Private`$InputFileName], "IntegrationRules"}]}];
$utilityPackage = FileNameJoin[{DirectoryName[System`Private`$InputFileName], "Integration utility functions.m"}];
$stepRoutines = FileNameJoin[{DirectoryName[System`Private`$InputFileName], "ShowStep routines.m"}];
$ruleFormatting = FileNameJoin[{DirectoryName[System`Private`$InputFileName], "ShowStepFormatting.m"}];

LoadRules::inv = "Could not load file or section: ``";
LoadRules[filename_String /; FileExistsQ[filename]] := (
  StatusBarPrint["Loading " <> FileBaseName@filename <> ".m..."];
  Get[filename];
  StatusBarPrint[""] );
LoadRules[section_String] := With[
  {
    files = Select[$rulePackages, StringMatchQ[FileBaseName[#], section ~~ " " ~~ __] &]
  },
  LoadRules[First[files]] /; Length[files] === 1
];
LoadRules[arg___] := Message[LoadRules::inv, {arg}];


StatusBarPrint[message_String] := If[$Notebooks, CurrentValue[EvaluationNotebook[], WindowStatusArea] = message];
ClearStatusBar[] := If[$Notebooks, CurrentValue[EvaluationNotebook[], WindowStatusArea] = ""];


Unprotect[Int];  Clear[Int];  Clear[Unintegrable];  Clear[CannotIntegrate];


LoadRules[$utilityPackage];
LoadRules["9.1"];
LoadRules["1.1.1"];
LoadRules["1.1.3"];
LoadRules["1.2.1"];
LoadRules["1.1.2"];
LoadRules["1.2.2"];
LoadRules["1.2.3"];
LoadRules["1.2.4"];
LoadRules["1.1.4"];
LoadRules["1.3"];


If[Global`$LoadElementaryFunctionRules === True,
  LoadRules["9.3"];
  LoadRules["2"];
  LoadRules["3"];
  LoadRules["4"];
  LoadRules["5"];
  LoadRules["6"];
  LoadRules["7"];
  LoadRules["8"];
  LoadRules["9.2"]
];
LoadRules["9.4"];

(* Calculate the rule-count directly after all integration rules, because below there are some more rules
 added that are not integration rules*)
$RuleCount = Length[DownValues[Int]];

If[$LoadShowSteps === True,
  LoadRules[$stepRoutines];
  LoadRules[$ruleFormatting];
];

StatusBarPrint["Modifying " <> ToString[$RuleCount] <> " integration rules to distribute coefficients over sums..."];
FixIntRules[];

If[$LoadShowSteps === True,
  StatusBarPrint["Modifying " <> ToString[$RuleCount] <> " integration rules to display steps..."];
  StepFunction[Int];
];

Rubi::argFlag = "The `` routine can only be used with the form Int[expr, x] where x is a symbol.";
SetAttributes[Steps, {HoldAllComplete}];
Steps[Int[expr_, x_Symbol]] := Module[{result, steps},
  {result, steps} = Reap@Block[{$ShowSteps = True},
    FixedPoint[
      Function[int,
        With[{held = ReplaceAll[HoldComplete[int], {Defer[Int] -> Int, Defer[Dist] -> Dist, Defer[Subst] -> Subst}]},
          Sow[RubiIntermediateResult[held]];
          ReleaseHold[held]
        ]
      ], Int[expr, x]]
  ];
  PrintRubiSteps[steps];
  result
];
Steps[___] := Null /; Message[Rubi::argFlag, "Steps"];

SetAttributes[Step, {HoldAllComplete}];
Step[Int[expr_, x_Symbol]] := Module[{result, step},
  {result, step} = Reap@Block[{$ShowSteps = True}, Int[expr, x]];
  PrintRubiSteps[step];
  result
];
Step[___] := Null /; Message[Rubi::argFlag, "Step"];

SetAttributes[Stats, {HoldAllComplete}];
Stats[Int[expr_, x_Symbol]] := Block[{$ShowSteps = False, $StepCounter = 0, $RuleList = {}},
  With[{result = Int[expr, x]},
    Print[RubiStats@{$StepCounter, Length[$RuleList], LeafCount[expr], LeafCount[result], N[Length[$RuleList] / LeafCount[expr], 4]}];
    result]
];
Stats[___] := Null /; Message[Rubi::argFlag, "Stats"];


(* Print a warning when users use the old style routines for showing steps *)
Int::oldFlag = "The usage Int[expr_, x_, `1`] is depreciated. Please use `1`[Int[expr_, x_]].";
Int[_, _, flag : (Stats | Step | Steps)] := Null /; Message[Int::oldFlag, flag];


Int[u_, {x_Symbol, a_, b_}] :=
    With[{result = Int[u, x]},
      Limit[result, x -> b] - Limit[result, x -> a]]


Int[{u__}, x_Symbol] :=
    Map[Function[Int[#, x]], {u}]


Protect[Int];


$Unintegrable = False;


Unintegrable[u_, x_] :=
    If[$Unintegrable === True,
      Defer[Unintegrable][u, x],
      Defer[Int][u, x]];

CannotIntegrate[u_, x_] := Defer[Int][u, x];
ClearStatusBar[];

End[];
EndPackage[];
