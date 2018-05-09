Linear configuration
--------------------

5 nodes, each running one qdrouterd process.
Routers are:

QPD.A on (10.19.110.15)
QPD.B on (10.19.110.11)
QPD.X on (10.19.110.15)
QPD.Y on (10.19.110.17)

Routers QPD.A and QPD.B are connected, QPD.A connects to port 20002 on QPD.B
Routers QPD.B and QPD.C are connected, QPD.B connects to port 20003 on QPD.C
Routers QPD.X and QPD.Y have connections to QPD.A, QPD.B, and QPD.C
QPD.X and QPD.Y are NOT directly connected.


  QPD.A<----->QPD.B<----->QPD.C
    ^           ^           ^
    |           |           |
    +----+------+-----+-----+
         |            |
         V            V
       QPD.X        QPD.Y


QPD.X is listening for clients on 10.19.110.15:5672.
QPD.Y is listening for clients on 10.19.110.17:5672.


  QPD.A<----->QPD.B<----->QPD.C
    ^           ^           ^
    |           |           |
    +----+------+-----+-----+
         |            |
         V            V
       QPD.X        QPD.Y
         ^            ^
         |            |
         |            |
      clients      clients
