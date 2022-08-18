---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "Large P-Values Cannot be Explained by Power Analysis"
subtitle: ""
summary: "Can p-values be close to .05 because researchers ran careful power analysis, and collected 'just enough' participants to detect their effect? In this blog post, I evaluate the merits of this argument."
authors: [Quentin André]
tags: [Tutorial]
categories: []
date: 2022-08-18
lastmod: 2022-08-18
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

[As discussed in an earlier blog post](https://quentinandre.net/post/evaluating-statistical-value/), a predominance of "large" p-values (i.e., p-values that are close to .05) in a paper should lead us to take its conclusions with a grain of salt. Indeed, since large p-values are rare under H1, many of them means that the studies were underpowered to capture the phenomenon of interest, or that the phenomenon of interest simply isn't there. This is the logic behind the "p-curve analysis" (Simonsohn, Nelson and Simmons 2014).

I recently heard a question that I think is worth discussing: **Could the p-values in a paper be large because the researchers have conducted a careful power analysis?** 

The argument goes like this:
1. Researchers don't want to be wasteful with their resources, so they do their best to predict the effect size that their experiment will yield.
2. Once they know this effect size, they perform a power analysis to determine how many observations they should collect.
3. Because they run *exactly* the number of participants they need (not more, not less) to detect a significant effect, they will tend to find p-values that are close to .05.

Another flavor of this argument is "small p-values means that researchers were wasteful, collected too many observations, and made their effect *too significant*".

Is there any merit to this argument? Could large p-values be explained by thoughtful researchers collecting *just enough participants* to detect a *carefully-estimated effect size*? Let's dive in!

## Can Researchers Predict the Effect Size They'll Find?

The most common approach to power analysis is to run a small-N study, observe the effect size in this study, and use it as an input for a power analysis.

The problem of this approach is that to [get an effect size estimate that is sufficiently precise to be informative, you need to run many participants...](http://datacolada.org/20)


    
![png](files/Fig1.png)
    


The graph below show the boxplots of observed Cohen's d in simulated pilot studies. We can see that, to reliably distinguish "small", "medium", and "large" effects, you need sample sizes in excess of 400. 

And with such sample sizes, most pilot studies would already give you significant results... which negates the point of running the pilot study!

So that's already a threat to the argument: **It is very unlikely that researchers can "bull's-eye" their effect size prediction.**

## Will A Careful Power Analysis Lead to Larger P-Values?

But let's set this concern aside, and assume that a researcher was able, through some combination of pilot studies, meta-analysis of existing studies, and lucky guesswork, to obtain a perfectly accurate estimate of the effect size that they want to study. For the sake of illustration, let's assume that this effect size is d = 0.5.

Now, the researcher can use this perfectly-estimated effect size to run a power analysis: How many participants will they need to detect this effect X% of the time? 

The graph below shows the relationship between target power and number of participants needed:


    
![png](files/Fig2.png)
    


The level of power the researcher will chose depends on their tolerance for false-negative findings, but it is not unreasonable to assume that they will want to detect the effect at least half of the time.

Now, with a sample size giving them at least 50% power to detect their perfectly-predicted effect size, how often would the researcher obtain p-values close to .05?


    
![png](files/Fig3.png)
    


The graph shows that, under all reasonable levels of power, "large" p-values will be rare: Even at 50% power (a very low target power, that I've never seen used in any power analysis), more than 50% of the significant p-values will be lower than .01.

## Conclusion

**Researchers cannot "aim" for p = .05, not even with a careful, perfectly accurate, power analysis.**

In fact, the opposite is true: If their power analysis is accurate (i.e., gives them a good chance to detect their effect), they should get p-values that are much smaller, rather than close, to .05.

The most likely explanation for a set of multiple p-values hugging .05 is low statistical power, and/or p-hacking.
