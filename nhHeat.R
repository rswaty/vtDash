
# try heat map for cove forests


# libraries
library(readr)
library(ggplot2) # ggplot() for plotting
library(RColorBrewer)
library(scales)


# cove
nh_heat <- read_csv("nh_heat.csv", col_types = cols(percent = col_number()))
View(nhheat)



nhHeatChart <- ggplot(nhheat,aes(x=evc, y=evh, fill = percent)) +
  geom_tile(color ='NA') +
  guides(fill=guide_legend(title="Percent of BpS \nper particular \ncombination")) +
  #scale_x_discrete(labels = function(x) paste0(x, "%")) +
  coord_cartesian(ylim=c(0, 22)) +
  labs(x="Canopy Cover",
       y="Canopy Height (meters)",
       title="Canopy cover and height combinations",
       subtitle = "Vermont Northern Hardwood") +
  scale_fill_distiller(palette = "BuGn", trans = "reverse") +
  theme_dark()
  #theme_bw(base_size=14)



nhHeatChart

ggsave(filename="nhHatChart.png",width=10,height=8,units='in',dpi=300)


