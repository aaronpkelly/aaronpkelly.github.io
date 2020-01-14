# Overview

I'm currently exploring what options were available to me for classifying images
that I have stored across multiple platforms social media platforms and
services. I want to classify them, tag them, then upload them all to one central
place (like AWS S3).

My main focus at first will be to explore what software exists around facial
recognition, and then maybe I'll proceed to using a deep neural network to
help me classify entire scenes.

I need the software to have the following features:
- good facial recognition
- writing metadata to file

# How my photos are currently stored

I am currently actively storing images on the following services whenever I save
and image to the photo gallery:
- https://photos.google.com/
- https://www.icloud.com/photos/ 

I also have photos exported from various platforms that I'm no longer using:
- https://drive.google.com/drive/
- facebook
- instagram
- imgur

Some of the above services do have facial recognition built-in, like Facebook,
but you are locked-in to the using the service if you wish to benefit from their
facial recognition technology. As far as I'm aware, this metadata is not written
to the file, and it is lost as soon as you take your images off their platform.

In Google's case, they apparently do have a feature to "Group by Face", which I
was not aware of at all, but this is not available for European users so that
may as well not exist at all.

# How I want organise my classified images - by METADATA

Images contain a WEALTH of metadata inside them:

- Exif
- XMP
- IPTC
- GPS
- DICOM

For organisationsal purposes, I don't care about the filename or anything like
that... I want to be able to classify my images using machine learning, and then
and write to the image metadata fields.

This will allow me to search images based on their internal metadata.

# Using image classification software

I wanted to see how far I could get doing my own facial recognition.

There is this article that lists some software packages:
https://en.wikipedia.org/wiki/Image_organizer

## Digikam

I decided that Digikam seemed to be a good choice, and after using it for a few
minutes, and it was clear that it could do the job.

After copying some images to ~/Pictures, I started up Digikam and tried out some
of the features.

### Scanning for faces and tagging them

This is what I really need. With a few sample photos in ~/Pictures, I selected
them all, right click, _Scan for Faces_.

This took a few moments, and the process seemed to finish fine.

I noticed on the left nav bar there was a _People_ button, and I could see
that it had two categories: Unconfirmed and Unknown.

I started tagging, and quickly had everyone tagged. Great!

## Adding lots more photos

After copying >1000 photos, I restarted the application and it took noticibly
longer to start. The _Scan for Faces_ feature also took about 20 minutes to
finish.

# Using deep learning software

https://en.wikipedia.org/wiki/Comparison_of_deep-learning_software

## Tensorflow

Tutorials look heavy, didn't start

## Pytorch

Didn't start

# Using a ML platform (AWS Sagemaker)

Looks pretty easy to get started, I will try this soon


tags: classification, image, tensorflow, digikam, facial recognition, machine, deep, learning