model AnalyticalSolution
  import Modelica.Constants.pi;

  parameter Real x0 = 5;
  parameter Real F0 = 440;
  parameter Real alpha = F0/10;
  parameter Real omega0 = 2*pi*F0;

  Real x_analytical;

equation
  x_analytical = exp(-alpha*time) *
    (x0*cos(omega0*time)
    + (alpha*x0/omega0)*sin(omega0*time));

  annotation(
    experiment(
      StartTime = 0,
      StopTime = 0.2,
      Interval = 0.001
    ),
    uses(Modelica(version = "4.0.0"))
  );
end AnalyticalSolution;
