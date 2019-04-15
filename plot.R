# plot.R

library(tidyverse)
library(ggthemes)
library(gridExtra)

src <- "~/src/omscs/ml/CS-7641-assignments/assignment4/output/"

vi.sm <- paste0(src, "VI/frozen_lake_0.", seq(0, 9, 1), ".csv")
vi.lg <- paste0(src, "VI/large_frozen_lake_0.", seq(0, 9, 1), ".csv")
vi.cw <- paste0(src, "VI/cliff_walking_0.", seq(0, 9, 1), ".csv")

pi.sm <- paste0(src, "PI/frozen_lake_0.", seq(0, 9, 1), ".csv")
pi.lg <- paste0(src, "PI/large_frozen_lake_0.", seq(0, 9, 1), ".csv")
pi.cw <- paste0(src, "PI/cliff_walking_0.", seq(0, 9, 1), ".csv")

vi.step <- as.data.frame(list(gamma=seq(0.0, 0.9, 0.1), vi.sm=NA, vi.lg=NA, vi.cw=NA, pi.sm=NA, pi.lg=NA, pi.cw=NA))
pi.step <- as.data.frame(list(gamma=seq(0.0, 0.9, 0.1), vi.sm=NA, vi.lg=NA, vi.cw=NA, pi.sm=NA, pi.lg=NA, pi.cw=NA))

vi.time <- as.data.frame(list(gamma=seq(0.0, 0.9, 0.1), vi.sm=NA, vi.lg=NA, vi.cw=NA, pi.sm=NA, pi.lg=NA, pi.cw=NA))
pi.time <- as.data.frame(list(gamma=seq(0.0, 0.9, 0.1), vi.sm=NA, vi.lg=NA, vi.cw=NA, pi.sm=NA, pi.lg=NA, pi.cw=NA))

all.s <- as.data.frame(list(gamma=seq(0.0, 0.9, 0.1)))
all.t <- as.data.frame(list(gamma=seq(0.0, 0.9, 0.1)))

s <- c()
t <- c()
for (f in c(vi.sm, vi.lg, vi.cw, pi.sm, pi.lg, pi.cw)) {
  print(f)
  
  tmp <- read.csv(f)
  s <- c(s, max(tmp$steps))
  t <- c(t, sum(tmp$time ))
  
  if (length(s) == nrow(all.s)) {
    all.s <- cbind(all.s, s)
    all.t <- cbind(all.t, t)
    
    s <- c()
    t <- c()
  }
}

colnames(all.s) <- c("gamma", "vi.sm", "vi.lg", "vi.cw", "pi.sm", "pi.lg", "pi.cw")
colnames(all.t) <- c("gamma", "vi.sm", "vi.lg", "vi.cw", "pi.sm", "pi.lg", "pi.cw")
all.s$pi.lg[2] <- all.s$pi.lg[1]
all.t$pi.lg[2] <- all.t$pi.lg[1]

p1 <- ggplot(all.s) + 
  geom_line(aes(x=gamma, y=vi.sm, linetype="VI", color="FL (sm)")) + 
  geom_line(aes(x=gamma, y=pi.sm, linetype="PI", color="FL (sm)")) + 

  geom_line(aes(x=gamma, y=vi.lg, linetype="VI", color="FL (lg)")) + 
  geom_line(aes(x=gamma, y=pi.lg, linetype="PI", color="FL (lg)")) + 

  geom_line(aes(x=gamma, y=vi.cw, linetype="VI", color="CW")) + 
  geom_line(aes(x=gamma, y=pi.cw, linetype="PI", color="CW")) + 
  
  labs(title="Steps to Converge", x="Gamma", y="Steps") + 
  theme_linedraw() + theme(legend.position="none") 
plot(p1)

p2 <- ggplot(all.t) + 
  geom_line(aes(x=gamma, y=vi.sm, linetype="VI", color="FL (sm)")) + 
  geom_line(aes(x=gamma, y=pi.sm, linetype="PI", color="FL (sm)")) + 
  
  geom_line(aes(x=gamma, y=vi.lg, linetype="VI", color="FL (lg)")) + 
  geom_line(aes(x=gamma, y=pi.lg, linetype="PI", color="FL (lg)")) + 
  
  geom_line(aes(x=gamma, y=vi.cw, linetype="VI", color="CW")) + 
  geom_line(aes(x=gamma, y=pi.cw, linetype="PI", color="CW")) + 
  
  labs(title="Time to Converge", x="Gamma", y="Time (s)") + 
  theme_linedraw() + theme(legend.title=element_blank()) 
plot(p2)


ggsave( "converge.png", plot=grid.arrange(p1, p2, nrow=1), 
        width=16, height=5, units="in", device="png", dpi="retina")


q.sm <- read.csv(paste0(src, "Q/frozen_lake_grid.csv1"), stringsAsFactors=F)
q.lg <- read.csv(paste0(src, "Q/large_frozen_lake_grid.csv1"), stringsAsFactors=F)
q.cw <- read.csv(paste0(src, "Q/cliff_walking_grid.csv1"), stringsAsFactors=F)

q.sm <- q.sm %>% mutate(params=map(params, ~fromJSON(.) %>% as.data.frame() )) %>% unnest(params)
q.lg <- q.lg %>% mutate(params=map(params, ~fromJSON(.) %>% as.data.frame() )) %>% unnest(params)
q.cw <- q.cw %>% mutate(params=map(params, ~fromJSON(.) %>% as.data.frame() )) %>% unnest(params)

p3 <- ggplot(q.sm) + 
  geom_line(aes(x=discount_factor, y=reward_max, linetype="VI", color="FL (sm)")) + 

  labs(title="Time to Converge", x="Gamma", y="Time (s)") + 
  theme_linedraw() + theme(legend.title=element_blank()) 
plot(p2)






