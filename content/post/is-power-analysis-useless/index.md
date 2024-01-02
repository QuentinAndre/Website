---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "Power Analysis in Consumer Research: A Fool’s Errand?"
subtitle: "Why power analysis, as traditionally performed, isn't a good tool for choosing sample size."
summary: "Why power analysis, as traditionally performed, isn't a good tool for choosing sample size."
authors: [Quentin André]
tags: [Tutorial]
categories: []
date: 2024-01-02
lastmod: 2024-01-02
featured: false
draft: false
toc: false

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

## How Many Observations Should a Researcher Collect?
This question is a crucial aspect of any confirmatory hypothesis test. On the one hand (all else being equal), the more observations are collected, the more power researchers will have to detect an effect of a given size, and the more likely they are to detect increasingly small effects. On the other hand, larger samples obviously require more money and time to compensate participants, acquire experimental materials, pay research assistants, set up the lab space, monitor data collection, interact with research assistants, and handle data quality issues.

Choosing a sample size thus reflects a difficult balancing act. If researchers collect “too many” observations (i.e., more than what they needed to detect their effect with a reasonable amount of power), they have effectively wasted time and money that they could have used for something else (e.g., a follow up study, or another research project). If they collect “too few” observations (i.e., less than they needed to achieve an acceptable level of statistical power), they have also wasted time and money running a study that gives them an uninformative answer.

## Power Analysis, as Usually Performed, is Unlikely to Help
The oft-suggested solution to this problem is to run a power analysis. In its most common form, researcher computes (for a pre-specified statistical test and alpha level) the number of observations they need to detect a given effect size with a desired level of statistical power. Through power analysis, a researcher running a two-sample t-test with α = .05 would learn that they need 128 observations (total) to have an 80% chance of detecting an effect size of d = .5.

A key issue with power analysis, however, is that it is replacing one problem by another: Instead of asking the researcher to precisely determine how many participants they would need, it is asking them to precisely determine the effect size that they expect to find. Unless researchers can accurately predict this effect size, they again risk being wasteful. If they underestimate it, they will be again collecting “too many” observations; if they underestimate it, they will be collecting “too few”. 

## The Difficulty of Guessing Effect Sizes
Unfortunately, effect sizes are hard to intuit. Consider for instance a simple two-cell study testing a straightforward prediction: More expensive items are less preferred by consumers. What would be the size of this effect? The answer depends on innumerable factors, including but not limited to, the magnitude of the treatment (how big of a difference in price?), the sensitivity of the dependent measure (e.g., forced choices versus a Likert scale), the design of the experiment (e.g., between vs. within-subjects), the experimenter’s ability to control for extraneous sources of variance (e.g., how similar are the items beyond their difference in price?), the characteristics of the population (e.g., the price-sensitivity, attentiveness, or naivete of the participants)…

## What About Pilot Studies or Meta-Analysis?
Given these difficulties, researchers occasionally conduct a “pilot study” (i.e., to run a study identical in design to the planned study, but with a small number of participants), and base their power analysis on the effect size revealed by this pilot. Unfortunately, this superficially attractive solution does not work in practice: [The sample size required to obtain a precise estimate of an effect size is orders of magnitude larger than the effect size required to detect an effect](http://datacolada.org/20). 

Here’s a thought experiment to illustrate this problem. Consider a researcher studying, unbeknownst to them, an effect of d = .5. They decide to run a pilot study with N = 128. This study will, in expectation, yield a point estimate of d = .5 for the effect size, with a 95% confidence interval spanning between d = .15 and d = .85. 

This confidence interval is so large that it cannot be used to decide on the sample size of a follow-up study. On the one hand, they will need only 44 participants to be able to detect d = .85 (the upper bound of the 95% confidence interval) with 80% power. On the other hand, the researcher will need to collect 1398 participants to be be able to detect d = .15 (the lower bound of the 95% confidence interval) 80% of the time. In general, if a pilot study has enough observations to yield a sufficiently precise estimate of the effect size, it will have more than enough power to confidently ascertain the effect is significant (i.e., d ≠ 0, p < .05).

Could meta-analyses offer the solution then? Unfortunately, this is also unlikely: Beyond the well-documented issue of publication bias (which distorts and inflates the meta-analytical effect size) and follow-up bias (which inflates the effect size measured in pilot studies; Albers and Lakens 2018), using prior studies for effect size prediction requires researchers to identify a set of studies that are sufficiently similar to the planned study. To the extent that researchers are often interested in theoretically novel effects, this set of studies (if it exists) is likely to be too small to give researchers the precision they need.

## Is Power Analysis Useless Then? 
If it is extremely difficult to predict the effect size an experiment will produce, does this make power analysis useless? Does this mean that researchers should choose arbitrary sample sizes when running their experiments, or rely on the equally arbitrary “small” (d = .2), “medium” (d = .5) or “large” (d = .8) effect sizes offered by Cohen (1988)? Not necessarily. We will see why and how in a next blog post…
