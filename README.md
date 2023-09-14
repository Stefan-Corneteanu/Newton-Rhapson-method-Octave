# Newton-Rhapson method Octave
A college project aiming to apply the Newton-Rhapson numerical method in the context of a real engineering application

Problem:

Consider a simple electric circuit having an input voltage V=2V, a resistance R=1kΩ, and a diode. It can be shown that the voltage across the diode can be found as the single zero of the following function:
f(Vd) = 10^(-14) * e ^ (Vd / 0.026) - (2 - Vd) / 1000
Where Vd is the voltage of the diode. Using the Newton-Raphson method with an initial value Vd0 = 0.75, compute Vd with an error less than 0.001%.
