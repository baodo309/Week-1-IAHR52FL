library(tidyverse)
library(haven)

#Load the dataset
nfhs <- read_dta("IAHR52FL.dta")

#Subset the dataset
nfhs <- select(nfhs,hhid:shstruc)

#Plot the distribution of the number of listed household members
ggplot(data = nfhs)+
  geom_histogram(mapping = aes(x = hv009), binwidth =1)

#Create a new data frame that contains only urban households
urban_df <- filter(nfhs,hv025 == 1)

#Convert 'hv025 - type of place of residence' from a continuous variable to a categorical variable
hv026_fct <- as.factor(urban_df$hv026)

#Rename factor levels for 'hv026 - place of residence'
levels(hv026_fct) <- c("Capital, Large city","Small city","Town","Countryside","Missing")

#Create a boxplot
ggplot(data = urban_df, mapping = aes(x = hv026_fct, y = hv009))+
  geom_boxplot()+
  coord_flip()+
  xlab('Type of Urban Areas') + ylab('Household Numbers')

#Group and summarize to find means and medians of the number of household members by type of urban area
urban_df %>%
  group_by(hv026) %>%
  summarise(
    mean = mean(hv009), median = median(hv009)
  )