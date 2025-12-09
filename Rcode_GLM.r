R SCRIPT
# Load up data
data <-read.csv(file.choose(),header=F)
data <- as.matrix(data)
data
# Prepare data in correct form
claims <- as.vector(data)
n.origin <- nrow(data)
n.dev <- ncol(data)
origin <- factor(row <- rep(1 :n.origin, n.dev))
dev <- factor(col <- rep(1 :n.dev, each=n.origin))
# Put into a data frame (no need, but easier to visualise)
research <- data.frame(claims=claims, origin=origin, dev=dev)
research <- research[!(is.na(research$claims) | research$claims==""), ]
model <- glm(claims ~ origin + dev, family = quasipoisson(), subset=!is.na(claims),data=research)