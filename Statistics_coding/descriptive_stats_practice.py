#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Thu Apr  2 20:33:32 2020

@author: petercw94
"""
# define the sum_list function
def mean_list(l):
    sum = 0
    mean = 0
    for x in l:
        sum += x
    mean = sum/len(l)
    return mean
    
li = [1,2,3,2,2]
# mean_list(li)
        
# define the standard deviation function
# Remember, the standard deviation is the average deviation, so 
# you are literally just finding the average of all the deviation scores.
def sd(l):
    y = 0
    sdev = 0
    for i in l:
        y += (abs(i - mean_list(l)))**2
    sdev = (y/len(l))**1/2
    print(sdev)


sd(li)
