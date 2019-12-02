from random import *
import os

data = ['quick', 'bubble', 'insertion', 'merge']
n = 100
maxr = n
eps = 1.0/n


def write_stats(ended):
    for d in data:
        f = open(d+".out", "r")
        lines = f.readlines()
        f.close()
        f = open(d+"_results.in", "a")
        if ended:
            f.write(str(lines[len(lines) - 2][:-1]) + "\n")
        else:
            f.write(str(lines[len(lines) - 2][:-1]) + " ")
            f.close()

        f = open(d+"_errors.in", "a")
        if ended:
            f.write(str(lines[len(lines) - 1][:-1]) + "\n")
        else:
            f.write(str(lines[len(lines) - 1][:-1]) + " ")
        f.close()


def writefile():
    f = open("data.in", "w")
    f.write(str(eps) + " " + str(n))
    for i in range(n):
        f.write(" " + str(randint(1, maxr)))
    f.write("\n")
    f.close()


def sort():
    run_quick = './quick < data.in > quick.out'
    run_bubble = './bubble < data.in > bubble.out'
    run_insertion = './insertion < data.in > insertion.out'
    run_merge = './merge < data.in > merge.out'

    os.system(run_quick)
    os.system(run_bubble)
    os.system(run_insertion)
    os.system(run_merge)

# Initialize files
for d in data:
    f = open(d+"_results.in", "w")
    f.close()
    f = open(d+"_errors.in", "w")
    f.close()


# Question 1 - Simulate simple data with eps = 1/n, n = 100
print("Simulating simple data with eps=" + str(eps) + ", n=" + str(n) + " ...")
for e in range(500):
    writefile()
    sort()
    if e == 499: #end of test
        write_stats(True)
    else:
        write_stats(False)


# Question 2 - Simulate changes of probability of memory faults eps=[1/n:p/n], n=100
p = 15.0
n = 100
by = 0.1
print("Simulating changes of probability of memory faults eps=[" + str(eps) + " : " + str(p/n) + "], n=" + str(n) + " ...")
while p >= 1:
    eps = p/n
    writefile()
    sort()
    if p < 1.1: #end of test
        write_stats(True)
    else:
        write_stats(False)
    p = p-by


# Question 3 - Simulate changes on array size eps=1/100, n = [100:max_n]
eps = 1.0/100
n = 100
max_n = 1000
by = 10
print("Simulating changes on array size eps=" + str(eps) + ", n = [" + str(n) + " : " + str(max_n) + "]")
while n <= max_n:
    writefile()
    sort()
    if n == max_n: # end of test
        write_stats(True)
    else:
        write_stats(False)
    n = n+by

print("Done!\nData is now available on your folder")

