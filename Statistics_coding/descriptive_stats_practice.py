#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Thu Apr  2 20:33:32 2020

@author: petercw94
"""

li = [1,2,3,2,2]
plist = [9, 2, 5, 4, 12, 7, 8, 11, 9, 3, 7, 4, 12, 5, 4, 10, 9, 6, 9, 4]

# write a function to find the mean of a list
def mean_list(l):
    sum = 0
    mean = 0
    for x in l:
        sum += x
    mean = sum/len(l)
    return mean
    

# mean_list(li)
        
# define the standard deviation function
# Remember, the standard deviation is the average deviation, so 
# you are literally just finding the average of all the deviation scores.
def sd(l):
    y = 0
    sdev = 0
    for i in l:
        y += (abs(i - mean_list(l)))**2
    sdev = (y/len(l))**(1/2)
    #print(sdev)
    return sdev



# sd(plist)


# write a function to convert the data into z-scores
def zScore(l):
    z = ()
    for i in l:
       z = (i-mean_list(l))/sd(l)
       print(z)
 
#zScore(plist)      


# Write a function for flipping a coin for probability
def coin(ht, n):
    from random import randrange
    import numpy as np
    import matplotlib.pyplot as plt
    heads = 0
    tails = 0
    label = ['heads', 'tails']
    for i in range(n):
        if randrange(ht) == 0:
                heads += 1
        else: tails += 1
    values = [heads, tails]
    def plot_bar_x():
    # build the bar graph
        index = np.arange(len(label)) # index gives x axis a quantitative number
        plt.bar(index, values) # this gives our x and y axis
        plt.xlabel('Side of Coin', fontsize=5) # choose the label of the x-axis
        plt.ylabel('Probability of flipping', fontsize=5) # choose the label of the y-axis
        plt.xticks(index, label, fontsize=5, rotation=30) # the angle, wordage, and font size of ticks
        plt.title('Probability graph of a coin flip')
        plt.show()
    plot_bar_x()
    print("Heads = " + str(heads))
    print("Tails = " + str(tails))
    print("Empirical probability heads = " + str(heads/n))
    print("Empirical probability of tails = " + str(tails/n))
    # I can't get the next part of the function to work completely yet
    #percentage = input("Would you like to see the probability as a percentage? (y/n): ")
    #if percentage == "y":
        #print("Empirical probability heads = " + str((heads/n)*100 + "%"))
        #print("Empirical probability of tails = " + str((tails/n) * 100) + "%")
    #else:
        #print("Have a nice day")
        
#coin(2, 10000)
    
    
# Write a function for probability with multiple outcomes
    