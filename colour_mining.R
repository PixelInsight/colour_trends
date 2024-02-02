# Install the necessary packages
install.packages("imager")
install.packages("colorspace")

# Load the necessary packages
library(imager)
library(colorspace)
library(dplyr)

# Load the image
img <- load.image("/Users/ellibe02/OneDrive - Reed Elsevier Group ICO Reed Elsevier Inc/Pictures/Walking Cheltenham/IMG_20190622_170648.jpg")

# Convert the image to a data frame
img_df <- as.data.frame(img)
glimpse(img_df)

# Calculate the hex, RGB, and HSL colors
img_df$hex <- rgb(img_df$red, img_df$green, img_df$blue, maxColorValue = 255)
img_df$RGB <- paste(img_df$red, img_df$green, img_df$blue, sep = ", ")
img_df$HSL <- with(colorspace::RGB(img_df$red, img_df$green, img_df$blue, maxColorValue = 255), colorspace::hex2HSL(img_df$hex))

# Get the most common colors
common_colors <- sort(table(img_df$hex), decreasing = TRUE)



# schemr ------------------------------------------------------------------

library(imager)
rgb_img <- rgb.imager(img)



rgb_df <- data.frame(
  r = rgb_img[,1],
  g = rgb_img[,2],
  b = rgb_img[,3]
)

library(schemr)
hex_codes <- rgb_to_hex(rgb_df)


schemr_data <- image_to_pallette(image_path = "/Users/ellibe02/OneDrive - Reed Elsevier Group ICO Reed Elsevier Inc/Pictures/Walking Cheltenham/IMG_20190622_170648.jpg", resize_factor = 0.5,
                                 verbose = FALSE, summary_method = median)
schemr_data
image_to_pallette


"#869454"
"#888a60"
"#677a3c"
"#9aa575"
"#76814e"
"#c8caad"
"#4a502d"
"#656646"
"#95937b"
"#586635"
"#3f4024"
"#acb292"
"#15150e"
"#bacae3"
"#c0c1c1"


hex_code <- schemr_data@.xData$palette[1]
rgb_values <- col2rgb(hex_code)
print(rgb_values)

# install.packages("plotwidgets")
library(plotwidgets)

hsl_values <- col2hsl(hex_code)
print(hsl_values)


