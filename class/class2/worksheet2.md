# Worksheet 2: Functions

1. Overload the addition and multiplication operators to do element-wise addition and multiplication on cme257OrderedPair.

2. Overload addition and multiplication to work with cme257ff{N,T} for N any positive integer (don't worry about checking positivity), where the operations are defined mod N:

(a +/* b).val = a.val +/* b.val mod N

This gives this type the structure of a ring (in the mathematical sense).  If N is prime, the type has the structure of a field (in the mathematical sense).

3. Modify ```yell_my_type``` to yell all types correctly.


