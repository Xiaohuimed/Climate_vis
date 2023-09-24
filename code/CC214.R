# the new files for readmE
# https://www.youtube.com/watch?v=fskblEWSeWU&t=101s

library(tidyverse)
 read_csv("data/GLB.Ts+dSST.csv", skip = 1, na = "***") %>% 
  select(year=Year, t_diff=`J-D`) %>% 
           ggplot(aes(x= year, y=t_diff)) +
  geom_line(aes(color="1") , size=0.5)+
  geom_point(fill="white",color="gray", shape=21, show.legend = F )+
  geom_smooth(se=F, aes(color="2"), size=0.5, span=0.15)+
  scale_x_continuous(breaks = seq(1880, 2023, 20), expand = c(0,0))+
   scale_y_continuous(limits = c(-0.5, 1.5), expand = c(0,0))+
  scale_color_manual(name=NULL,
                      breaks=c(1,2),
                      values = c("gray", "black"),
                      labels=c("Annual mean", "Lowess smoothing"))+
   labs(
     x="Year",
     y="Temperature anomaly (C)",
     title="GLOBAL LAND-OCENA TEMPERATURE INDEX",
     subtitle = "Data source: NASA's Goddard Institute for Space Studies (GISS)."
   )+
  theme_light()+
    theme(axis.ticks = element_blank(),
          plot.title.position = "plot",
          plot.title = element_text(margin = margin(b=10), color="red",face="bold"),
          plot.subtitle = element_text(size=8, margin=margin(b=10)),
          legend.position = c(0.2,0.9))


 ggsave("figures/temperature_index_plot.png", width = 7, height = 5)
 
 
  
             
