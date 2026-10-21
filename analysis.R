# ICA 16 - R Project with Git
# This script demonstrates basic data analysis in R

# Create sample data
set.seed(42)
students <- data.frame(
  name = paste0("Student_", 1:20),
  hours_studied = sample(1:20, 20, replace = TRUE),
  attendance = sample(60:100, 20, replace = TRUE)
)

# Calculate exam scores based on hours studied and attendance
students$score <- with(students, 
  40 + 2.5 * hours_studied + 0.5 * attendance + rnorm(20, mean = 0, sd = 5)
)

# Display summary statistics
cat("=== Summary Statistics ===\n")
print(summary(students))

# Simple linear regression
model <- lm(score ~ hours_studied + attendance, data = students)
cat("\n=== Regression Results ===\n")
print(summary(model))

# Create a scatter plot
png("plot.png", width = 800, height = 600)
plot(students$hours_studied, students$score,
     main = "Study Hours vs Exam Scores",
     xlab = "Hours Studied",
     ylab = "Exam Score",
     pch = 19,
     col = "steelblue")
abline(lm(score ~ hours_studied, data = students), col = "red", lwd = 2)
dev.off()

cat("\nPlot saved to plot.png\n")
