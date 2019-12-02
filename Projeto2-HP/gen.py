from random import *
import os

data = ['quick', 'bubble', 'insertion', 'merge']
n = 100
maxr = n
eps = 1.0/n
repetitions = 100


def write_stats(name):
    for d in data:
        f = open(d+".out", "r")
        lines = f.readlines()
        f.close()
        f = open((str(name)+"results.in"), "a")
        f.write(d + " " + str(lines[len(lines) - 2][:-1]) + " " + str(lines[len(lines) - 1][:-1]) + " " + str(eps) + " " + str(n) + "\n")
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
f = open("all_results.in", "w")
f.write("ALGORITHM LLS ERRORS PROBABILITY SIZE\n")
f.close()

f = open("p_results.in", "w")
f.write("ALGORITHM LLS ERRORS PROBABILITY SIZE\n")
f.close()

f = open("n_results.in", "w")
f.write("ALGORITHM LLS ERRORS PROBABILITY SIZE\n")
f.close()

print("Simulating all algorithms "+str(repetitions)+" times...")
for e in range(repetitions):
    writefile()
    sort()
    write_stats("all_")
    

repetitions = 50
p = 30.0
n = 100

print("Simulating changes of probability of memory faults "+str(repetitions)+" times...")
for i in range(5):
    eps = p/n
    print("probability= " +str(p)+"/100 ... ")
    for e in range(repetitions):
        writefile()
        sort()
        write_stats("p_")
    p = p/1.8


eps = 1.0/100
n = 100

print("Simulating changes on array size "+str(repetitions)+" times...")
for i in range(5):
    writefile()
    sort()
    print("n= " +str(n)+ " ...")
    for e in range(repetitions):
        write_stats("n_")
    n = n*2

print("Done!\nData is now available on your folder")

