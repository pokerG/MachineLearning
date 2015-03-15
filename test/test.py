# Enter your code here. Read input from STDIN. Print output to STDOUT
import numpy as np
from sklearn import linear_model
from itertools import combinations_with_replacement as comb
from operator import mul
import sys
F,N = map(int,sys.stdin.readline().split(" "))
tmpX = []
y = []
tmptest = []
X = []
test = []
for row in range(N):
    values = map(float,sys.stdin.readline().split(" "))
    tmpX.append(values[0:F])
    y.append(values[F])

def prod(x): return reduce(mul, x)
def poly(x): return map(prod, comb([1.0] + x, F))
X = np.array([poly(row) for row in tmpX])
T = int(raw_input())

for row in range(T):
    tmptest.append([float(t) for t in raw_input().split()])
test = np.array([poly(row) for row in tmptest])
lr = linear_model.LinearRegression()
lr.fit(X,y)
prec = lr.predict(test)
for i in range(T):
    print round(prec[i],2)