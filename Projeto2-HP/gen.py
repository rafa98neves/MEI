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
f = open("p_results.in", "w")
f.write("ALGORITHM LLS ERRORS PROBABILITY SIZE\n")
f.close()

#1. State the hypothesis or claim to be tested 
#2. Select the criteria for a decision 
#3. Compute the test statistic 
#4. Make a decision

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
    p = p/0.5


# # Question 3 - Simulate changes on array size eps=1/100, n = [100:max_n]
# eps = 1.0/100
# n = 100
# max_n = 1000
# by = 10
# print("Simulating changes on array size eps=" + str(eps) + ", n = [" + str(n) + " : " + str(max_n) + "]")
# while n <= max_n:
#     writefile()
#     sort()
#     if n == max_n: # end of test
#         write_stats(True)
#     else:
#         write_stats(False)
#     n = n+by

# print("Done!\nData is now available on your folder")

