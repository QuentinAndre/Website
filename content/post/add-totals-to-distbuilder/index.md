---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "Adding Totals to distBuilder"
subtitle: ""
summary: 'A short tutorial on adding "totals" to distBuilder, keeping track of how many balls are allocated in each bucket'
authors: [Quentin André]
tags: [Javascript, distBuilder, Tutorial]
categories: []
date: 2021-03-25
lastmod: 2021-03-25
featured: false
draft: false
toc: true

# Featured image
# To use, add an image named `featured.jpg/png` to your page's folder.
# Focal points: Smart, Center, TopLeft, Top, TopRight, Left, Right, BottomLeft, Bottom, BottomRight.
image:
  caption: ""
  focal_point: ""
  preview_only: false

# Projects (optional).
#   Associate this post with one or more of your projects.
#   Simply enter your project's folder or file name without extension.
#   E.g. `projects = ["internal-project"]` references `content/project/deep-learning/index.md`.
#   Otherwise, set `projects = []`.
projects: []
---

A researcher recently emailed me to ask if there is an easy way to add "totals" to the distBuilder. This is particularly
helpful when participants can allocate many balls to each bucket, and you want to help them keep track of how many they
have allocated.

This is a functionality I will probably add soon. In the meantime, here's an easy fix. Click the CSS and the JS 
buttons to see the code.

{{< codepen id="PoWPqOG" >}}

And voilà! Your participants can now see how many balls they have allocated to each bucket.
