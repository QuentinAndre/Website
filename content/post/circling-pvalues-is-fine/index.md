---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "In Defense of 'Circling p-values'"
subtitle: "You noticed that the p-values in a paper are close to .05. Does this make you a bad person? Can 'circling p-values' ever be a useful heuristics? My two cents on an (apparently?) controversial topic."
summary: "You noticed that the p-values in a paper are close to .05. Does this make you a bad person? Can 'circling p-values' ever be a useful heuristics? My two cents on an (apparently?) controversial topic."
authors: [Quentin André]
tags: [Tutorial]
categories: []
date: 2024-05-30
lastmod: 2024-05-30
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
A few days ago, my Twitter feed erupted after I pointed out that [the p-values in a recent paper discussing the impact of smartphone bans on student outcomes and mental health were all close to the papers' threshold for discovery (p = .1)]. While some thanked me for pointing out this pattern, others strongly objected to my observation, and more generally to the practice of what they call 'circling p-values'. 

I won't rehash the full debate, but one person in particular appeared to view this practice as particularly evil, calling it in a blost post the "polygraph and baton of self-styled stats cops on Twitter." I happen to (strongly) disagree, and will try to make a short two-part case for "circling p-values."

First, can it be a useful heuristic?

## Circling p-values Is a Useful Heuristic

There has never been, in the history of social sciences, such a large number of papers being published. We only have 24 hours in a day, a fraction of which can be realistically devoted to reading papers. So we have to apply heuristics to decide which papers are worth reading (or building upon, or replicating...), and which are not. I'll readily admit that "circling p-values" is one of the heuristics I apply when reading papers testing confirmatory hypothesis... and I think it's a pretty decent one. Why?

### It Contains Valuable Information

As I've repeatedly discussed on this blog, [the p-values presented in a paper contain information about the statistical power the researcher had to study their phenomenon]({{< ref "/post/evaluating-statistical-value" >}}). Large p-values (p > .01) are, under a sufficient amount of statistical power, rare]({{< ref "/post/large-pvalues-and-power-analysis" >}}). So when you see p-values in a paper that are all close to the significance threshold, I think it is fine to update in the direction of "the researchers probably didn't have the statistical power to distinguish small effects from null effects".

### It Is Less Biased than Other Heuristics

Now, it isn't a perfect heuristic. You can even argue it's biased: Not all researchers can afford the sample sizes and designs required to test their hypothesis with sufficient power! I don't deny that, but I think this heuristic is much less biased than other criteria we are using to decide which papers to read (like mostly reading papers from top journals, or from well-published scientists). That's what heuristics are: Imperfect tools for making fast decisions under limited information.

## Circling p-values Isn't Immoral

Next, is it moral? This might sound like a weird question until you realize that the objection to "circling p-values" isn't simply a debate about the usefulness of this practice. It appears that people also object to it [because of the implication](https://www.youtube.com/watch?v=THvCDn8mGwo).

Which implication? The implication that a discussion of p-values necessarily contains an accusation of p-hacking. In fact, this is exactly how some folks reacted to my tweet: ["Why are you trying to imply the study is p-hacked?!"](https://twitter.com/jbakcoleman/status/1783463509084246140). I think this is a misguided view... because p-hacking has nothing to do with morality. 

p-hacking is, in my view, an unavoidable consequence of hypothesis testing under uncontrolled degrees of freedom. If you are emotionally, intellectually, or professionally invested in a hypothesis, and if you have uncontrolled degrees of freedom, you will p-hack your results. Like it or not. No matter how much we try to be objective, motivated reasoning and confirmation bias will always lead us to put our finger on the scale. I've written about this before, and I think it would be very helpful if we could ["de-moralize" our discussions of p-hacking]({{< ref "/post/discussing-statistical-evidence" >}}).

This is why I do not think that there is anything accusatory with "circling p-values", no more than there is anything accusatory when criticizing any other aspect of a paper (samples, measurements, constructs, etc.). If we agree that it is fair game to criticize research, it is counterproductive to draw arbitrary lines in the sand around certain forms of criticism "because of the implications".

