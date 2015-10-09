#!/usr/bin/env python
# -*- coding: UTF-8

# Float numbers will consider this many decimal part
TRUNCATE=2
# Upper limit for LCM
LCM_LIMIT=200

from fractions import Fraction
import numpy as np

from utils import almost_equal, lcm
from custom_exceptions import CannotIntegerify

def rationalize(num, max_denom=100):
    num = format(num, '.%dg'%TRUNCATE)
    rational = Fraction(num).limit_denominator(max_denom)
    return rational.numerator, rational.denominator

from utils import lcm, gcd

def make_common_divisor(numerators,denominators):
    if len(numerators) != len(denominators):
        raise Exception("Numerators (%s) must have the same length as "\
                "denominators (%s)"%(len(numerators),len(denominators)))
    this_lcm = lcm(*denominators)
    for idx, den in enumerate(denominators):
        numerators[idx] = (this_lcm / den) * numerators[idx]
    return numerators,[this_lcm]*len(numerators)

def integer_coeff(float_list):
    relations = []
    for fl1 in float_list:
        if almost_equal(fl1, 0.0, tolerance=0.00001):
            # No es un buen candidato para buscar MCM
            continue
        aux = []
        fl1 = '%s'%abs(fl1)
        rat1 = Fraction(fl1)
        for fl2 in float_list:
            if almost_equal(fl2, 0.0, tolerance=0.00001):
                aux.append(0.0)
                continue
            modif2 = -1 if fl2 < 0 else 1
            fl2 = '%s'%(abs(fl2))
            rat2 = Fraction(fl2)
            rel = rat1/rat2
            rel = format(modif2*float(rel), '.%dg'%TRUNCATE)
            rel = float(rel)
            aux.append(rel)
        relations.append(aux)
        mcm = abs(lcm(*[abs(x) for x in aux if x!= 0]))
        if mcm > LCM_LIMIT:
            # Al buscar el múltiplo, a veces obtenemos valores muy grandes
            # Hay que ignorarlos y buscar un futuro mejor
            continue
        integerified = [x and mcm/x or 0.0  for x in aux]
        if all([x.is_integer() for x in integerified]):
            return [int(x) for x in integerified]
    # Mi "peor es nada"
    mcm = abs(float(lcm(*[Fraction(str(x)) for x in aux if x!= 0])))
    # Usar esto para ver que tanto se rompe lo del MCM
    #integerified = [x and mcm/x or 0.0  for x in aux]
    integerified = [int(x) and mcm/x or 0.0  for x in aux]
    return integerified
    raise CannotIntegerify("Arrrgh! Cannot integerify equation"
                "hiperspace (%s). Relations (%s)"%(float_list,relations))

