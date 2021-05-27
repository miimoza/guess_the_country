#!/bin/python

import numpy

with open("countries") as f:
    countries = f.read().splitlines()

with open("pop") as f:
    pop = f.read().splitlines()

total_pop = 0
for p in pop:
    total_pop += int(p)

countries_odd = []
for p in pop:
    countries_odd.append(int(p) / total_pop)

country = numpy.random.choice(countries, p=countries_odd)

print(country)
