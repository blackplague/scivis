require("pixmap")
# To run any script (like this one) inside R, just type source("opg14.R"). You can also just copy-paste the code into the R console.

# We need an R-package called pixmap to handle and manipulate images like in this exercise. If it's not installed on your computer, simply type install.packages("pixmap") in the R-console. 

# pixmap only reads pictures in the PNM-format, not the JPG-format. Therefore, images of that format should be provided. If not, you can easily convert from JPG to PNM using this online converter: http://www.pictureresize.org/online-images-converter.html

library(pixmap) # load the package

kande1 = read.pnm("kande1.pnm")

# pixel specifications:
tll = c(150, 328)  # training: lower left
tur = c(330, 264)  # training: upper right

ell1 = c(200, 235) # test1: lower left
eur1 = c(240, 155) # test1: upper right

ell2 = c(200, 530) # test2: lower left
eur2 = c(240, 436) # test2: upper right

## Show image and regions

plot(kande1)
rect(xleft = tll[1], ybottom = 640 - tll[2], xright = tur[1], ytop= 640 - tur[2]) 
text(tll[1] + 25, 640 - tur[2] + 15, labels= "train")

rect(xleft = ell1[1], ybottom = 640 - ell1[2], xright = eur1[1], ytop= 640 - eur1[2],border="green") 
text(ell1[1] + 25, 640 - eur1[2] - 65, labels = "test1", col="green")

rect(xleft = ell2[1], ybottom = 640 - ell2[2], xright = eur2[1], ytop= 640 - eur2[2],border="green") 
text(ell2[1] + 25, 640 - eur2[2] - 75, labels = "test2", col="green")

# we subtract from 640 because the plot has origo at lower left corner, now. Don't worry about the subtractions and additions to the x and y parameters to the text-method. These are only there to position the text labels correctly.

## Extract regions
train.set = kande1[tur[2]:tll[2], tll[1]:tur[1]]

# Training data:
train = NULL
train$red = as.vector(getChannels(train.set,"red"))
train$green = as.vector(getChannels(train.set,"green"))
train$blue = as.vector(getChannels(train.set,"blue"))

train = as.data.frame(train)

# Test1 data:
test1.set = kande1[eur1[2]:ell1[2], ell1[1]:eur1[1]]
test1 = NULL
test1$red = as.vector(getChannels(test1.set,"red"))
test1$green = as.vector(getChannels(test1.set,"green"))
test1$blue = as.vector(getChannels(test1.set,"blue"))

test1 = as.data.frame(test1)

# Test2 data:
test2.set = kande1[eur2[2]:ell2[2], ell2[1]:eur2[1]]
test2 = NULL
test2$red = as.vector(getChannels(test2.set,"red"))
test2$green = as.vector(getChannels(test2.set,"green"))
test2$blue = as.vector(getChannels(test2.set,"blue"))

test2 = as.data.frame(test2)

# Ok, so now you have the data you need. They are arranged in a data frame, because they are easily handled by most commands such as mean and cov etc. At some point however, you probably would like to loop over all the pixels in kande1. The pixmap package works like this: to get the size of the image, just do kande1@size[1] for the x-size. kande1@size[2] for the y-size. As you can see above, we access the RGB-values of a picture using getChannels(). Here's an example on how you handle the object:
# RGB = getChannels(kande1)
# pix = RGB[14,32,] # Get the RGB-value at pixel (14,32) in kande1.


