library(tidyverse)

# make the my_colors data frame for fixation stimuli
v = 1:20 * 5
v = c(1,v) 
v = rep(v, 30)
df = data.frame(Red = v, Green = 0)
df = mutate(df, Blue = 255 - df$Red)

purp = df %>%
  filter(Red > 50)
purp$Target.Color = "Purple"

blue = df %>%
  filter(Red < 51)
blue$Target.Color = "Blue"

my_colors = rbind(purp, blue)

# join the target stimuli colors
my_colors = mutate(my_colors, Target.stim = paste0(Red,",",Green,",",Blue))
my_colors = my_colors[,-c(1:3)]


var = c(
  rep(c("Low.1", "Low.2", "Low.3", "Low.4", "Low.5", "Low.6", "Low.7"), 2), 
  rep(c("Mid.1", "Mid.2", "Mid.3", "Mid.4", "Mid.5"), 2),
  rep(c("High.1", "High.2", "High.3"), 2)
  )
var = rep(var, 21)

my_colors$Condition = var

# determine coordinates to set ranges for low variability ####
k = c()
for(i in 0:7) {
  k = c(k,i*(99/7) + 155)
}
k
k = round(k, 0)
k[1:7]
# determine the ranges of blue values for the low variability 
low.v.blue.val = data.frame(Min = k[1:7], Max = k[2:8])
low.v.blue.val = mutate(low.v.blue.val, int.range = (Max - Min)/6)
# make min and max columns one and two
colnames(low.v.blue.val)[1] = "B1"
colnames(low.v.blue.val)[2] = "B6"
# add in outer stimuli columns 
low.v.blue.val$B2 = low.v.blue.val$B1 + low.v.blue.val$int.range
low.v.blue.val$B3 = low.v.blue.val$B2 + low.v.blue.val$int.range
low.v.blue.val$B4 = low.v.blue.val$B3 + low.v.blue.val$int.range  
low.v.blue.val$B5 = low.v.blue.val$B4 + low.v.blue.val$int.range

# re-order the data set
low.v.blue.val = low.v.blue.val[,-3]
low.v.blue.val = low.v.blue.val[c(1,3:6,2)]
colnames(low.v.blue.val)

# round the values
low.v.blue.val = round(low.v.blue.val, 0)

low.v.blue.val$Condition = c("Low.1", "Low.2", "Low.3", "Low.4", "Low.5", "Low.6", "Low.7")
low.v.blue.val$Outer.Color = c(rep("Purple", 3), "Mixed", rep("Blue", 3))


# same thing with mid ####
m = c()
for(i in 0:5) {
  m = c(m,i*(99/5) + 155)
}
m
m = round(m, 0)
# determine the ranges of blue values for the low variability 
mid.v.blue.val = data.frame(Min = m[1:5], Max = m[2:6])
mid.v.blue.val = mutate(mid.v.blue.val, int.range = (Max - Min)/6)
# make Min -> B1
colnames(mid.v.blue.val)[1] = "B1"
# add in outer stimuli columns 
mid.v.blue.val$B2 = mid.v.blue.val$B1 + mid.v.blue.val$int.range
mid.v.blue.val$B3 = mid.v.blue.val$B2 + mid.v.blue.val$int.range
mid.v.blue.val$B4 = mid.v.blue.val$B3 + mid.v.blue.val$int.range  
mid.v.blue.val$B5 = mid.v.blue.val$B4 + mid.v.blue.val$int.range 
# make min and max columns one and two
colnames(mid.v.blue.val)[2] = "B6"
# re-order the data set
mid.v.blue.val = mid.v.blue.val[,-3]
mid.v.blue.val = mid.v.blue.val[c(1,3:6,2)]
colnames(mid.v.blue.val)
mid.v.blue.val = round(mid.v.blue.val, 0)

mid.v.blue.val$Condition = c("Mid.1", "Mid.2", "Mid.3", "Mid.4", "Mid.5")
mid.v.blue.val$Outer.Color = c(rep("Purple", 2), "Mixed", rep("Blue", 2))
# set high variability blue values ####
B1min = 155
B1max = 155 + .5*99
B2min = 155 + .25*99
B2max = 155 + .75*99
B3min = 155 + .5*99
B3max = 254

high.v.blue.val = data.frame(B1 = c(B1min, B2min, B3min), B6 = c(B1max, B2max, B3max))
high.v.blue.val = mutate(high.v.blue.val, int.range = (B6 - B1)/6)
# add in outer stimuli columns 
high.v.blue.val$B2 = high.v.blue.val$B1 + high.v.blue.val$int.range
high.v.blue.val$B3 = high.v.blue.val$B2 + high.v.blue.val$int.range
high.v.blue.val$B4 = high.v.blue.val$B3 + high.v.blue.val$int.range  
high.v.blue.val$B5 = high.v.blue.val$B4 + high.v.blue.val$int.range

# re-order the data set
high.v.blue.val = high.v.blue.val[,-3]
high.v.blue.val = high.v.blue.val[c(1,3:6,2)]
colnames(high.v.blue.val)
high.v.blue.val = round(high.v.blue.val, 0)
high.v.blue.val$Condition = c("High.1", "High.2", "High.3")
high.v.blue.val$Outer.Color = c(rep("Mixed", 3))

df = full_join(low.v.blue.val, mid.v.blue.val)
outer.stim = full_join(df, high.v.blue.val)
# Join the outer.stim data set and the my_colors data frame
my_colors = full_join(my_colors, outer.stim)

# add in red and green colors

my_colors = mutate(my_colors, C1 = paste0((255 - B1),",0,",B1))
my_colors = mutate(my_colors, C2 = paste0((255 - B2),",0,",B2))
my_colors = mutate(my_colors, C3 = paste0((255 - B3),",0,",B3))
my_colors = mutate(my_colors, C4 = paste0((255 - B4),",0,",B4))
my_colors = mutate(my_colors, C5 = paste0((255 - B5),",0,",B5))
my_colors = mutate(my_colors, C6 = paste0((255 - B6),",0,",B6))

# Temporary new color values
my_colors = mutate(my_colors, C1 = paste0((255 - B1),",0,",B1,255))
my_colors = mutate(my_colors, C2 = paste0((255 - B2),",0,",B2,255))
my_colors = mutate(my_colors, C3 = paste0((255 - B3),",0,",B3,255))
my_colors = mutate(my_colors, C4 = paste0((255 - B4),",0,",B4,255))
my_colors = mutate(my_colors, C5 = paste0((255 - B5),",0,",B5,255))
my_colors = mutate(my_colors, C6 = paste0((255 - B6),",0,",B6,255))

# remove the b columns
Bcols = c(4:9)
my_colors = my_colors[, -Bcols]

# adding the congruent columns
my_colors = mutate(my_colors, Congruency = paste(Target.Color, Outer.Color))
my_colors$Congruency = plyr::mapvalues(my_colors$Congruency, 
                from = unique(my_colors$Congruency), 
                to = c("congruent", "mixed", "incongruent", "incongruent", "mixed", "congruent"))


random = 1:length(my_colors$Target.Color)
my_colors$random = sample(random)

my_colors = my_colors %>%
  arrange(random)


# write the csv
write.csv(my_colors, "./my_colors_random.csv", row.names = FALSE)

