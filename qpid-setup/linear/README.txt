Linear configuration
--------------------

Three nodes, each running one qdrouterd process.
Routers are:

QPD.A on (10.19.110.15)
QPD.B on (10.19.110.11)
QPD.C on (10.19.110.17)

Routers QPD.A and QPD.B are connected, QPD.A connects to port 20002 on QPD.B
Routers QPD.B and QPD.C are connected, QPD.B connects to port 20003 on QPD.C

  QPD.A<----->QPD.B<----->QPD.C


QPD.A is listening for clients on 10.19.110.15:5672.
QPD.C is listening for clients on 10.19.110.17:5672.


     QPD.A<----->QPD.B<----->QPD.C
      ^                       ^
      |                       |
      |                       |
    clients                 clients
