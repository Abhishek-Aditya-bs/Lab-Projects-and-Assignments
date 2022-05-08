# find the dominant colours in an image
from PIL import Image
import cv2
import numpy as np
import matplotlib.pyplot as plt
import matplotlib.image as mpimg

def DsiplayDominantColours(image_path):
	# load the image
	image = mpimg.imread(image_path)
	# reshape the image to a 2D array of pixels and 3 colour values (RGB)
	pixel_values = image.reshape((-1, 3))
	# convert to float colour values in the range 0 to 1
	pixel_values = np.float32(pixel_values)
	# define stopping criteria
	criteria = (cv2.TERM_CRITERIA_EPS + cv2.TERM_CRITERIA_MAX_ITER, 100, 0.2)
	# apply k-means clustering
	_, labels, (centers) = cv2.kmeans(pixel_values, 3, None, criteria, 10, cv2.KMEANS_RANDOM_CENTERS)
	# convert back to 8 bit values
	centers = np.uint8(centers)
	# flatten the labels array
	labels = labels.flatten()
	# convert all pixels to the colour of the centroid with the lowest label
	segmented_image = centers[labels.flatten()]
	# reshape back to the original image shape
	segmented_image = segmented_image.reshape(image.shape)
	# plot the image
	plt.imshow(segmented_image)
	plt.show()

if __name__ == '__main__':
	DsiplayDominantColours('img.jpg')
