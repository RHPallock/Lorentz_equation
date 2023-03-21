# Lorentz_equation
This repo contains code for find stable and unstable PO using newton raphson

TD : Time dependent simulation of lorentz equation       
F_ : lorentz equation, RHS as function. X_dot(t) = F_ = RHS
Phi(T0,X0) : function for integrating F_, X0 as inital condition and T0 is the integration time.
STM_Vectorized : Calculates state transition matrix. Vectorized ODE45 is used to do faster calculation
STM_Jacobian_Lorentz : Jacobian of the lorentz equations. 
