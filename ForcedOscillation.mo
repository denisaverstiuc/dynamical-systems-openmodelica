model ForcedOscillation
  import Modelica.Constants.pi;

  parameter Real x0 = 5;
  parameter Real F0 = 440;
  parameter Real alpha = F0/10;
  parameter Real omega0 = 2*pi*F0;
  parameter Real k0 = alpha^2 + omega0^2;
  parameter Real f0 = 2*alpha;

  parameter Real A = 1e6;
  parameter Real Fe = 420;

  Real u1(start = 2*alpha*x0);
  Real u2(start = x0);
  Real x;
  Real e;

equation
  x = u2;
  der(u1) = -k0*x + e;
  der(u2) = -f0*x + u1;
  e = A*sin(2*pi*Fe*time);

  annotation(
    experiment(
      StartTime = 0,
      StopTime = 0.15,
      Interval = 0.001
    ),
    uses(Modelica(version = "4.0.0"))
  );
end ForcedOscillation;
