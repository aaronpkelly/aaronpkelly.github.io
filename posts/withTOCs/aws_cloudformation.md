
Table of Contents
=================

   * [Recreating all my resources using Cloudformation   CloudFormer](#recreating-all-my-resources-using-cloudformation--cloudformer)
      * [Do I really need this?](#do-i-really-need-this)
      * [Will this template delete anything? Is it destructive? My S3 buckets!!](#will-this-template-delete-anything-is-it-destructive-my-s3-buckets)

Created by [gh-md-toc](https://github.com/ekalinin/github-markdown-toc)



# Recreating all my resources using Cloudformation + CloudFormer

I want to define my entire cloud setup by using a Cloudformation template, but
I already have a lot of configuration in-place and I don't really know how to
write the template file.

However, there is a tool called CloudFormer that will analyse your current
cloud infrastructure and then output a template for you.

## Do I really need this?

This template is probably going to benefit enterprises more, but I just want to
do it because I have tender feelings towards the concepts of reproducability and
immutability.

## Will this template delete anything? Is it destructive? My S3 buckets!!

don't know

