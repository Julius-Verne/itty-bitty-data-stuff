#Create Data Grid with 
db_subset <- subset(scab.data, select = 
                      c(gdp.capita, land.area.km2, world.happiness.index, hdi,
                        health.expenditure.capita, education.expenditure.capita))

names(db_subset)
ggpairs(db_subset[,1:6])




#Highlighting and Filtering by hand
ggplot(scab.data, aes(x=health.expenditure.capita, y=education.expenditure.capita,
                      label = ifelse(country.name == "Norway" , "Norway" , ""),
                      color = ifelse(country.name == "Norway", "a", "b"))) +
  scale_color_manual(values=c("#6622cc", "#a8b5ae", "#56B4E9"))+
  geom_point()+
  geom_text_repel()+
  theme_minimal()+
  theme(legend.position="none")


#Rearrange Bar by value, pick top and bottom values
head(arrange(scab.data, desc(world.happiness.index)), n = 10) %>% 
  ggplot(aes(x = reorder(country.name, -world.happiness.index), 
             y=world.happiness.index))+
  geom_bar(stat = "identity")+
  ylim(0,10)+
  labs(x="Countries", y="World Happiness Index", 
       title = "Top 10 Happiest Small Countries",
       subtitle = "with 5 million pop or less") 
