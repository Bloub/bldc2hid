package Test_BLDC
model PMSMm "3ph-PMSM stator frame model with mutual inductance"
  extends Modelica.Icons.MotorIcon;
  import Modelica.Constants.pi;
  import Modelica.Electrical.Analog;
  import Modelica.Mechanics.Rotational;
  import Modelica.SIunits;
  parameter SIunits.Inertia Jr = 0.0027 "Inertia of the rotor";
  parameter SIunits.Inertia Js = 1 "Inertia of the stator";
  parameter SIunits.Resistance R_p = 0.54 "Per phase resistance";
  parameter SIunits.Inductance L_p = 0.00145 "Per phase inductance";
  parameter Real m_k(min=0, max=0.999) = 0 "Mutual coupling coefficient";
  parameter Integer ppz = 1 "Pairs of poles";
  parameter SIunits.Angle ang_p(displayUnit = "rad") = 2 / 3 * pi
    "Electrical angle between 2 phases";
  parameter SIunits.MagneticFlux PhaseBEMF = 2 / 3 * 1.04
    "Back EMF constant of one single phase (peak value) [VS/rad]";
  constant Integer m = 3 "Number of phases";
  parameter SIunits.Inductance L_3 = L_p * (1 - m_k / 3) "Override L_v3";
  parameter SIunits.Inductance L_M = m_k / 3 * L_p "Override L_M";
  SIunits.MagneticFlux psi_m = PhaseBEMF / ppz;
  output SIunits.Angle phiMechanical = flange.phi - support.phi;
  output SIunits.AngularVelocity wMechanical(displayUnit = "1/min") = der(phiMechanical);
  output SIunits.Angle phiElectrical = ppz * phiMechanical;
  output SIunits.AngularVelocity wElectrical = ppz * wMechanical;
  Rotational.Components.Inertia inertia_rotor(J = Jr);
  Rotational.Components.Inertia inertia_housing(J = Js);
  Rotational.Sources.Torque2 torque2;
  Modelica.SIunits.Torque tau_el;
  SIunits.MagneticFlux flux_a;
  SIunits.MagneticFlux flux_b;
  SIunits.MagneticFlux flux_c;
  SIunits.Torque tau_a;
  SIunits.Torque tau_b;
  SIunits.Torque tau_c;
  Modelica.Electrical.Analog.Interfaces.Pin a1 annotation(
      Placement(visible = true, transformation(origin = {-100, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(extent = {{-110, 90}, {-90, 110}}, rotation = 0)));
  Modelica.Electrical.Analog.Interfaces.Pin b1 annotation(
      Placement(visible = true, transformation(origin = {-100, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(extent = {{-110, 10}, {-90, 30}}, rotation = 0)));
  Modelica.Electrical.Analog.Interfaces.Pin c1 annotation(
      Placement(visible = true, transformation(origin = {-100, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(extent = {{-110, -70}, {-90, -50}}, rotation = 0)));

  Modelica.Electrical.Analog.Interfaces.Pin a2 annotation(
      Placement(visible = true, transformation(origin = {-100, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(extent = {{-110, 50}, {-90, 70}}, rotation = 0)));
  Modelica.Electrical.Analog.Interfaces.Pin b2 annotation(
      Placement(visible = true, transformation(origin = {-100, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(extent = {{-110, -30}, {-90, -10}}, rotation = 0)));
  Modelica.Electrical.Analog.Interfaces.Pin c2 annotation(
      Placement(visible = true, transformation(origin = {-100, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(extent = {{-110, -110}, {-90, -90}}, rotation = 0)));
  Rotational.Interfaces.Flange_a flange annotation(Placement(transformation(extent = {{90,-10},{110,10}})));
  Rotational.Interfaces.Support support annotation(Placement(transformation(extent = {{90,-90},{110,-70}})));

  Modelica.Electrical.MultiPhase.Basic.MutualInductor mutualInductor(L=[L_3,-
        L_M,-L_M; -L_M,L_3,-L_M; -L_M,-L_M,L_3])
    annotation (Placement(transformation(extent={{-56,30},{-36,50}})));
  Modelica.Electrical.MultiPhase.Basic.Resistor resistor(m=3, R={R_p,R_p,R_p})
    annotation (Placement(transformation(extent={{-32,30},{-12,50}})));
  Modelica.Electrical.MultiPhase.Basic.PlugToPin_p plugToPin_a1(m=m, k=1)
    annotation (Placement(transformation(extent={{-66,80},{-86,100}})));
  Modelica.Electrical.MultiPhase.Basic.PlugToPin_p plugToPin_a2(m=m, k=1)
    annotation (Placement(transformation(extent={{-66,60},{-86,80}})));
  Modelica.Electrical.MultiPhase.Basic.PlugToPin_p plugToPin_b1(m=m, k=2)
    annotation (Placement(transformation(extent={{-66,0},{-86,20}})));
  Modelica.Electrical.MultiPhase.Basic.PlugToPin_p plugToPin_b2(m=m, k=2)
    annotation (Placement(transformation(extent={{-66,-20},{-86,0}})));
  Modelica.Electrical.MultiPhase.Basic.PlugToPin_p plugToPin_c1(m=m, k=3)
    annotation (Placement(transformation(extent={{-66,-80},{-86,-60}})));
  Modelica.Electrical.MultiPhase.Basic.PlugToPin_p plugToPin_c2(m=m, k=3)
    annotation (Placement(transformation(extent={{-66,-100},{-86,-80}})));
  Modelica.Electrical.MultiPhase.Sources.SignalVoltage u
    annotation (Placement(transformation(extent={{-8,30},{12,50}})));

equation
  flux_a = psi_m * cos(phiElectrical + 0 * ang_p);
  flux_b = psi_m * cos(phiElectrical + 1 * ang_p);
  flux_c = psi_m * cos(phiElectrical + 2 * ang_p);
  u.v[1] = wElectrical * flux_a;
  u.v[2] = wElectrical * flux_b;
  u.v[3] = wElectrical * flux_c;
  tau_a = ppz * flux_a * a2.i;
  tau_b = ppz * flux_b * b2.i;
  tau_c = ppz * flux_c * c2.i;
  tau_el = -(tau_a + tau_b + tau_c);
  tau_el = torque2.tau;
  connect(flange,inertia_rotor.flange_a);
  connect(inertia_rotor.flange_b,torque2.flange_a);
  connect(torque2.flange_b,inertia_housing.flange_a);
  connect(inertia_housing.flange_b,support);
  connect(u.plug_n, plugToPin_a1.plug_p) annotation (Line(
      points={{12,40},{12,90},{-74,90}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(u.plug_n, plugToPin_b1.plug_p) annotation (Line(
      points={{12,40},{12,10},{-74,10}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(u.plug_n, plugToPin_c1.plug_p) annotation (Line(
      points={{12,40},{12,-70},{-74,-70}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(u.plug_p, resistor.plug_n) annotation (Line(
      points={{-8,40},{-12,40}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(resistor.plug_p, mutualInductor.plug_n) annotation (Line(
      points={{-32,40},{-36,40}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(mutualInductor.plug_p, plugToPin_a2.plug_p) annotation (Line(
      points={{-56,40},{-60,40},{-60,70},{-74,70}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(mutualInductor.plug_p, plugToPin_b2.plug_p) annotation (Line(
      points={{-56,40},{-60,40},{-60,-10},{-74,-10}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(mutualInductor.plug_p, plugToPin_c2.plug_p) annotation (Line(
      points={{-56,40},{-60,40},{-60,-90},{-74,-90}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(a1, plugToPin_a1.pin_p) annotation (Line(
      points = {{-100, 100}, {-89, 100}, {-89, 90}, {-78, 90}},
      color={0,0,255}));
  connect(a2, plugToPin_a2.pin_p) annotation (Line(
      points = {{-100, 60}, {-89, 60}, {-89, 70}, {-78, 70}},
      color={0,0,255}));
  connect(b1, plugToPin_b1.pin_p) annotation (Line(
      points = {{-100, 20}, {-89, 20}, {-89, 10}, {-78, 10}},
      color={0,0,255}));
  connect(b2, plugToPin_b2.pin_p) annotation (Line(
      points = {{-100, -20}, {-89, -20}, {-89, -10}, {-78, -10}},
      color={0,0,255}));
  connect(c1, plugToPin_c1.pin_p) annotation (Line(
      points = {{-100, -60}, {-89, -60}, {-89, -70}, {-78, -70}},
      color={0,0,255}));
  connect(c2, plugToPin_c2.pin_p) annotation (Line(
      points = {{-100, -100}, {-89, -100}, {-89, -90}, {-78, -90}},
      color={0,0,255}));
  annotation(Diagram(coordinateSystem(preserveAspectRatio=false,   extent={{-100,
            -100},{100,100}}),                                                                        graphics));

end PMSMm;


model Tester
  Test_BLDC.PMSMm pMSMm annotation(
      Placement(visible = true, transformation(origin = {-18, 0}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.OpAmp opAmp annotation(
      Placement(visible = true, transformation(origin = {30, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground annotation(
      Placement(visible = true, transformation(origin = {30, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Sources.ConstantVoltage constantVoltage(V = 5)  annotation(
      Placement(visible = true, transformation(origin = {30, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Electrical.Analog.Basic.OpAmp opAmp1 annotation(
      Placement(visible = true, transformation(origin = {70, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.Speed speed annotation(
      Placement(visible = true, transformation(origin = {-50, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Trapezoid trapezoid(amplitude = 2 * 2 * 3.14 * 2, offset = -2 * 2 * 3.14, period = 2, width = 1)  annotation(
      Placement(visible = true, transformation(origin = {-80, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(pMSMm.a2, pMSMm.b2) annotation(
      Line(points = {{-40, 6}, {-36, 6}, {-36, -2}, {-40, -2}}, color = {0, 0, 255}));
    connect(pMSMm.b2, pMSMm.c2) annotation(
      Line(points = {{-40, -2}, {-36, -2}, {-36, -10}, {-40, -10}}, color = {0, 0, 255}));
    connect(opAmp.VMin, ground.p) annotation(
      Line(points = {{30, 0}, {30, -60}}, color = {0, 0, 255}));
    connect(constantVoltage.p, opAmp.VMax) annotation(
      Line(points = {{30, 30}, {30, 20}}, color = {0, 0, 255}));
    connect(constantVoltage.n, ground.p) annotation(
      Line(points = {{30, 50}, {0, 50}, {0, -60}, {30, -60}}, color = {0, 0, 255}));
  connect(pMSMm.c2, ground.p) annotation(
      Line(points = {{-18, -1}, {-18, -60}, {30, -60}}, color = {0, 0, 255}));
    connect(ground.p, opAmp1.VMin) annotation(
      Line(points = {{30, -60}, {70, -60}}, color = {0, 0, 255}));
    connect(constantVoltage.p, opAmp1.VMax) annotation(
      Line(points = {{30, 30}, {70, 30}, {70, -40}}, color = {0, 0, 255}));
    connect(trapezoid.y, speed.w_ref) annotation(
      Line(points = {{-69, 0}, {-63, 0}}, color = {0, 0, 127}));
  connect(speed.flange, pMSMm.flange) annotation(
      Line(points = {{-40, 0}, {-28, 0}}));
  connect(speed.support, pMSMm.support) annotation(
      Line(points = {{-50, -10}, {-50, -20}, {-28, -20}, {-28, -8}}));
  connect(pMSMm.a2, pMSMm.b2) annotation(
      Line(points = {{-8, 6}, {-4, 6}, {-4, -2}, {-8, -2}}, color = {0, 0, 255}));
  connect(pMSMm.b2, pMSMm.c2) annotation(
      Line(points = {{-8, -2}, {-4, -2}, {-4, -10}, {-8, -10}}, color = {0, 0, 255}));
  connect(pMSMm.a1, opAmp.in_n) annotation(
      Line(points = {{-8, 10}, {20, 10}, {20, 16}}, color = {0, 0, 255}));
  connect(pMSMm.b1, opAmp.in_p) annotation(
      Line(points = {{-8, 2}, {20, 2}, {20, 4}}, color = {0, 0, 255}));
  connect(opAmp.in_p, opAmp1.in_p) annotation(
      Line(points = {{20, 4}, {20, -56}, {60, -56}}, color = {0, 0, 255}));
  connect(opAmp1.in_n, pMSMm.c1) annotation(
      Line(points = {{60, -44}, {8, -44}, {8, -6}, {-8, -6}}, color = {0, 0, 255}));
  annotation(
      experiment(StartTime = 0, StopTime = 2, Tolerance = 1e-6, Interval = 0.0001));end Tester;

  model Source
  Test_BLDC.PMSMm pMSMm annotation(
      Placement(visible = true, transformation(origin = {40, 0}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.Speed speed annotation(
      Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Interfaces.PositivePin L1 annotation(
      Placement(visible = true, transformation(origin = {98, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {98, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Interfaces.PositivePin L2 annotation(
      Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Interfaces.PositivePin L3 annotation(
      Placement(visible = true, transformation(origin = {98, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {98, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Interfaces.NegativePin gnd annotation(
      Placement(visible = true, transformation(origin = {0, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, -96}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.CombiTimeTable combiTimeTable(fileName = "D:/_CODE/Modelica/timeTable.txt", tableName = "rect", tableOnFile = true)  annotation(
      Placement(visible = true, transformation(origin = {-80, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Trapezoid trapezoid(amplitude = 2 * 2 * 3.14 * 2, offset = -2 * 2 * 3.14, period = 2, width = 1) annotation(
      Placement(visible = true, transformation(origin = {-6, 84}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain(k = 2 * Modelica.Constants.pi)  annotation(
      Placement(visible = true, transformation(origin = {-40, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(speed.flange, pMSMm.flange) annotation(
      Line(points = {{10, 0}, {30, 0}}));
    connect(speed.support, pMSMm.support) annotation(
      Line(points = {{0, -10}, {0, -20}, {30, -20}, {30, -8}}));
    connect(pMSMm.a2, pMSMm.b2) annotation(
      Line(points = {{50, 6}, {56, 6}, {56, -2}, {50, -2}}));
    connect(pMSMm.c2, pMSMm.b2) annotation(
      Line(points = {{50, -10}, {56, -10}, {56, -2}, {50, -2}}));
    connect(gnd, pMSMm.c2) annotation(
      Line(points = {{0, -100}, {50, -100}, {50, -10}}));
    connect(pMSMm.a1, L1) annotation(
      Line(points = {{50, 10}, {98, 10}, {98, 60}}, color = {0, 0, 255}));
    connect(pMSMm.b1, L2) annotation(
      Line(points = {{50, 2}, {100, 2}, {100, 0}}, color = {0, 0, 255}));
    connect(pMSMm.c1, L3) annotation(
      Line(points = {{50, -6}, {98, -6}, {98, -60}}, color = {0, 0, 255}));
  connect(gain.y, speed.w_ref) annotation(
      Line(points = {{-28, 0}, {-12, 0}}, color = {0, 0, 127}));
  connect(combiTimeTable.y[1], gain.u) annotation(
      Line(points = {{-68, 0}, {-52, 0}}, color = {0, 0, 127}));
  end Source;

  model AOPs
  Modelica.Electrical.Analog.Basic.OpAmp opAmp1 annotation(
      Placement(visible = true, transformation(origin = {20, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.OpAmp opAmp annotation(
      Placement(visible = true, transformation(origin = {0, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Sources.ConstantVoltage constantVoltage(V = 5) annotation(
      Placement(visible = true, transformation(origin = {50, -60}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  
  Modelica.Electrical.Analog.Interfaces.NegativePin L1 annotation(
      Placement(visible = true, transformation(origin = {-100, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Interfaces.NegativePin L2 annotation(
      Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Interfaces.NegativePin L3 annotation(
      Placement(visible = true, transformation(origin = {-100, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, -58}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Interfaces.PositivePin a annotation(
      Placement(visible = true, transformation(origin = {100, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {98, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Interfaces.NegativePin gnd annotation(
      Placement(visible = true, transformation(origin = {0, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Interfaces.PositivePin b annotation(
      Placement(visible = true, transformation(origin = {100, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Resistor R1(R = 10e3)  annotation(
      Placement(visible = true, transformation(origin = {-70, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Resistor R2(R = 10e3) annotation(
      Placement(visible = true, transformation(origin = {-70, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Resistor R3(R = 10e3) annotation(
      Placement(visible = true, transformation(origin = {-70, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Capacitor C1(C = 30e-9)  annotation(
      Placement(visible = true, transformation(origin = {-50, 40}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Capacitor C2(C = 30e-9) annotation(
      Placement(visible = true, transformation(origin = {-50, -20}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Capacitor C3(C = 30e-9) annotation(
      Placement(visible = true, transformation(origin = {-50, -80}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.VariableResistor Ratenuator annotation(
      Placement(visible = true, transformation(origin = {-20, -20}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Interfaces.RealInput atenuator annotation(
      Placement(visible = true, transformation(origin = {0, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90), iconTransformation(origin = {0, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
  equation
  connect(opAmp.out, a) annotation(
      Line(points = {{10, 30}, {100, 30}}, color = {0, 0, 255}));
  connect(opAmp1.out, b) annotation(
      Line(points = {{60, -30}, {100, -30}}, color = {0, 0, 255}));
  connect(constantVoltage.p, opAmp1.VMax) annotation(
      Line(points = {{50, -50}, {50, -10}, {20, -10}, {20, -20}}, color = {255, 0, 0}));
  connect(constantVoltage.n, gnd) annotation(
      Line(points = {{50, -70}, {50, -100}, {0, -100}}));
  connect(L1, R1.p) annotation(
      Line(points = {{-100, 60}, {-80, 60}}, color = {0, 0, 255}));
  connect(L2, R2.p) annotation(
      Line(points = {{-100, 0}, {-80, 0}}, color = {0, 0, 255}));
  connect(R3.p, L3) annotation(
      Line(points = {{-80, -60}, {-100, -60}}, color = {0, 0, 255}));
  connect(constantVoltage.p, opAmp.VMax) annotation(
      Line(points = {{50, -50}, {50, 50}, {30, 50}, {30, 40}}, color = {255, 0, 0}));
  connect(R1.n, opAmp.in_n) annotation(
      Line(points = {{-60, 60}, {-10, 60}, {-10, 36}}, color = {0, 0, 255}));
  connect(C1.p, R1.n) annotation(
      Line(points = {{-50, 50}, {-50, 60}, {-60, 60}}, color = {0, 0, 255}));
  connect(R2.n, opAmp.in_p) annotation(
      Line(points = {{-60, 0}, {-10, 0}, {-10, 24}}, color = {0, 0, 255}));
  connect(R2.n, opAmp1.in_n) annotation(
      Line(points = {{-60, 0}, {40, 0}, {40, -24}}, color = {0, 0, 255}));
  connect(C2.p, R2.n) annotation(
      Line(points = {{-50, -10}, {-50, 0}, {-60, 0}}, color = {0, 0, 255}));
  connect(R3.n, opAmp1.in_p) annotation(
      Line(points = {{-60, -60}, {40, -60}, {40, -36}}, color = {0, 0, 255}));
  connect(C3.p, R3.n) annotation(
      Line(points = {{-50, -70}, {-50, -60}, {-60, -60}}, color = {0, 0, 255}));
  connect(gnd, C1.n) annotation(
      Line(points = {{0, -100}, {-30, -100}, {-30, 20}, {-50, 20}, {-50, 30}}));
  connect(gnd, C2.n) annotation(
      Line(points = {{0, -100}, {-30, -100}, {-30, -40}, {-50, -40}, {-50, -30}}));
  connect(gnd, C3.n) annotation(
      Line(points = {{0, -100}, {-50, -100}, {-50, -90}}));
  connect(opAmp.VMin, gnd) annotation(
      Line(points = {{30, 20}, {30, 10}, {40, 10}, {40, -100}, {0, -100}}));
  connect(opAmp1.VMin, gnd) annotation(
      Line(points = {{20, -40}, {20, -50}, {40, -50}, {40, -100}, {0, -100}}));
  connect(Ratenuator.n, gnd) annotation(
      Line(points = {{-20, -30}, {-20, -40}, {-30, -40}, {-30, -100}, {0, -100}}));
  connect(Ratenuator.p, R2.n) annotation(
      Line(points = {{-20, -10}, {-20, 0}, {-60, 0}}, color = {0, 0, 255}));
  connect(Ratenuator.R, atenuator) annotation(
      Line(points = {{-8, -20}, {0, -20}, {0, 120}}, color = {0, 0, 127}));
  end AOPs;

  model Process
  Modelica.Electrical.Analog.Interfaces.NegativePin a annotation(
      Placement(visible = true, transformation(origin = {-100, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Interfaces.NegativePin b annotation(
      Placement(visible = true, transformation(origin = {-100, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-98, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Sensors.PotentialSensor potentialSensorA annotation(
      Placement(visible = true, transformation(origin = {-70, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Sensors.PotentialSensor potentialSensorB annotation(
      Placement(visible = true, transformation(origin = {-70, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Logical.GreaterThreshold greaterThresholdA(threshold = 2.5)  annotation(
      Placement(visible = true, transformation(origin = {-40, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Logical.GreaterThreshold greaterThresholdB(threshold = 2.5) annotation(
      Placement(visible = true, transformation(origin = {-40, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Logical.Switch switch1 annotation(
      Placement(visible = true, transformation(origin = {70, 30}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Blocks.Logical.Switch switch2 annotation(
      Placement(visible = true, transformation(origin = {30, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const0(k = 0)  annotation(
      Placement(visible = true, transformation(origin = {30, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const1(k = 1)  annotation(
      Placement(visible = true, transformation(origin = {-10, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant constM1(k = -1)  annotation(
      Placement(visible = true, transformation(origin = {-10, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput y annotation(
      Placement(visible = true, transformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(a, potentialSensorA.p) annotation(
      Line(points = {{-100, 30}, {-80, 30}}, color = {0, 0, 255}));
    connect(b, potentialSensorB.p) annotation(
      Line(points = {{-100, -30}, {-80, -30}}, color = {0, 0, 255}));
    connect(potentialSensorA.phi, greaterThresholdA.u) annotation(
      Line(points = {{-58, 30}, {-52, 30}}, color = {0, 0, 127}));
    connect(potentialSensorB.phi, greaterThresholdB.u) annotation(
      Line(points = {{-58, -30}, {-52, -30}}, color = {0, 0, 127}));
    connect(const1.y, switch2.u1) annotation(
      Line(points = {{2, -10}, {10, -10}, {10, -22}, {18, -22}}, color = {0, 0, 127}));
    connect(constM1.y, switch2.u3) annotation(
      Line(points = {{2, -50}, {10, -50}, {10, -38}, {18, -38}}, color = {0, 0, 127}));
    connect(greaterThresholdB.y, switch2.u2) annotation(
      Line(points = {{-28, -30}, {18, -30}}, color = {255, 0, 255}));
    connect(switch2.y, switch1.u1) annotation(
      Line(points = {{42, -30}, {50, -30}, {50, 22}, {58, 22}}, color = {0, 0, 127}));
    connect(const0.y, switch1.u3) annotation(
      Line(points = {{42, 50}, {50, 50}, {50, 38}, {58, 38}}, color = {0, 0, 127}));
    connect(switch1.y, y) annotation(
      Line(points = {{82, 30}, {90, 30}, {90, 0}, {110, 0}}, color = {0, 0, 127}));
  connect(greaterThresholdA.y, switch1.u2) annotation(
      Line(points = {{-28, 30}, {58, 30}}, color = {255, 0, 255}));
  end Process;

  model Complete
  Test_BLDC.Source source annotation(
      Placement(visible = true, transformation(origin = {-30, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Test_BLDC.AOPs aOPs annotation(
      Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Test_BLDC.Process process annotation(
      Placement(visible = true, transformation(origin = {30, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground annotation(
      Placement(visible = true, transformation(origin = {0, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp(duration = 2, height = (-100e3) + 1, offset = 100e3)  annotation(
      Placement(visible = true, transformation(origin = {-30, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
  connect(source.L1, aOPs.L1) annotation(
      Line(points = {{-20, 6}, {-10, 6}}, color = {0, 0, 255}));
  connect(aOPs.L2, source.L2) annotation(
      Line(points = {{-10, 0}, {-20, 0}}, color = {0, 0, 255}));
  connect(source.L3, aOPs.L3) annotation(
      Line(points = {{-20, -6}, {-10, -6}}, color = {0, 0, 255}));
  connect(process.a, aOPs.a) annotation(
      Line(points = {{20, 4}, {10, 4}}, color = {0, 0, 255}));
  connect(process.b, aOPs.b) annotation(
      Line(points = {{20, -4}, {10, -4}}, color = {0, 0, 255}));
  connect(source.gnd, ground.p) annotation(
      Line(points = {{-30, -10}, {-30, -20}, {0, -20}, {0, -30}}, color = {0, 0, 255}));
  connect(aOPs.gnd, ground.p) annotation(
      Line(points = {{0, -10}, {0, -30}}, color = {0, 0, 255}));
  connect(ramp.y, aOPs.atenuator) annotation(
      Line(points = {{-18, 30}, {0, 30}, {0, 12}}, color = {0, 0, 127}));
  annotation(
      experiment(StartTime = 0, StopTime = 2, Tolerance = 1e-6, Interval = 0.001));end Complete;

annotation(
    uses(Modelica(version = "3.2.3")));

end Test_BLDC;
