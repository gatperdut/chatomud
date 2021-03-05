nw = Room.first

p1 = Room.find(7)

nw.update(wr: p1)

p1.update(er: nw)

se = Room.fourth

s1 = Room.find(10)

se.update(er: s1)

s1.update(wr: se)
