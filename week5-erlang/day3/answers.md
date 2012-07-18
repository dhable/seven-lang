Week 5 - Erlang
===============

Day 3
-----

__Find an OTP service that will restart a process if it dies.__

The OTP library defines the Supervisor behaviour (http://www.erlang.org/doc/design_principles/sup_princ.html) as a means of restarting a service. In the problems for this chapter, one question is to change the Doctor so it monitors itself but there is a chicken and egg problem here - how can you be sure the process restarts itself in all conditions? The only way to do this is to ensure that there's something outside the process monitoring your process and this is where you'd use the Supervisor.

__Find documentation for building a simple OTP server.__

http://www.trapexit.org/Building_An_OTP_Application