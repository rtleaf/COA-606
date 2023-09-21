
load("chatgpt.biometry.bookdown.RData")

prefix. <- "Provide code in R (using base R functionality)" 

input.content.cand <- c("to plot a frequency histogram using simulated data from a continuous distribution.",
                        "to create a data frame with three colums, composed of binary variables, nominal variables, and ordinal variables (e.g. “low income”,”middle income”,”high income”). One for each column in a data frame.",
                        "to create a Box and Whisker Plot of a Continuous Variable.",
                        "to create a violin plot in R plotting using the mtcars dataset using package vioplot.",
                        "to sample a simulated distribution using simple random sampling.",
                        "to report the mean, median, and mode of a sample.",
                        "to create and plot skewed distributions (posititve and negative).",
                        "to report the range, minimum, and maximum of a set of values.",
                        "to report values of the interquartile range from a simulated set of values.",
                        "to report values of the quantiles from a simulated set of values.",
                        "to calculated the Sum of Squared Errors from a simulated set of values.",
                        "to calculated the variance from a simulated set of values.",
                        "to calculated the standard deviation from a simulated set of values.",
                        "to calculated the coefficient of variation from a simulated set of values.",
                        "to calculate the Kolmogorov-Smirnoff test of nomality from a simulated set of values.", 
                        "to make a quantile-quantile plot to perform a qualitative test of nomality from a simulated set of values.",
                        "to determine the integral (area under the curve) from normal distributions using the function pnorm.",
                        "to determine the quantile for a given area under the curve from a normal distribution using the qnorm function.",
                        "to illustrate and show the calculations for the Z-score.",
                        "to test that a set of data is normally distributed using the Shapiro-Wilk test",
                        "to determine how many standard deviations away from the mean a given data point is and if this is statistically significant.",
                        "to plot ordinal, binary, and nominal variables using a barplot") 

for (j in 1:length(input.content)) {
  if (j > 1) {Sys.sleep(60)}
  code.out <- chatgpt::complete_code(paste(prefix., input.content[j])) %>% unlist
  code.out <- substr(code.out, stringr::str_locate(code.out,"\\n")[1],nchar(code.out))
  Sys.sleep(60)
  responses.gpt[j] <- chatgpt::comment_code(code.out)
  print(code.out)
  rm(code.out)
  
  save(responses.gpt, prefix., input.content, file = "chatgpt.biometry.bookdown.RData")
}


