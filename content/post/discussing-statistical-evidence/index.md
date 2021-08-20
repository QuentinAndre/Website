---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "Making Discussions of Statistical Evidence Less Awkward and More Constructive"
subtitle: ""
summary: "How can researchers respectfully and constructively flag inadequate statistical evidence when we they see it
in papers? This post offers some personal reflections on this complex question."
authors: [Quentin André]
tags: [Tutorial]
categories: []
date: 2021-08-18
lastmod: 2021-08-19
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

In a [previous blog post](https://quentinandre.net/post/evaluating-statistical-value), I discussed guidelines to evaluate the
strength of statistical evidence presented in a paper. But how can we respectfully and constructively flag inadequate 
statistical evidence when we see it? This second post offers some personal reflections on this complex question.
  
## The Awkward Question in the Room
When presenting results in conferences, or submitting papers to journals, we very often have to answer questions about
"alternative explanations." Isn't there a confound in your manipulation? Isn't it possible that participants misinterpreted 
your instructions? What if your measure is capturing some other construct? Wouldn't this other theory better explain 
your effect? 

While these questions can sometimes be grating (and occasionally unfair), editors, reviewers and authors in 
our field all recognize that discussions of alternative explanations serve an essential function in the review process. 
They ensure that the evidence presented in the experiments is adequate and proportionate to the theoretical claims that the paper makes.

In contrast, another type of question is, in my experience, rarely asked: Questions regarding the appropriateness of the 
statistical evidence contained in the paper. On the rare occasions I have heard these questions asked at conferences, 
they were met with side-eye and awkward silence, as if the person had said something rude. In fact, these questions are 
rare enough that the few researchers I talked with are not be sure how they should be asked. "The evidence against the null 
is weak" sounds kind of rude. "Why are all the p-values very close to .05?" sounds even worse. "Your p-curve is flat" sounds 
downright vindictive.

I also think that these questions are not systematically asked in the peer-review process. When I read papers in the top journals of 
our field, I rarely see confounds in measures or manipulations: I conclude that such "alternative explanations" 
are almost always identified and addressed in the different rounds of peer-review. In contrast, I often see papers 
presenting an inadequate amount of evidence against the null, with flat (or even left-skewed) p-curves: I conclude that
the issue was not discussed (and therefore not addressed) during the peer-review process. In addition, [multiple](http://datacolada.org/82) 
[failures](http://datacolada.org/83) [to](http://datacolada.org/84) [replicate](http://datacolada.org/87) 
[recent marketing papers](http://datacolada.org/90) suggest that false-positive results creep into the literature more 
often than they should.

## Why So Awkward?

Why don't we simply discuss the strength of statistical evidence as we would discuss other aspects of papers? In my view, 
it is because "weak statistical evidence" rhymes has become associated with "questionable research practices." 

Regardless of the truth of this association, it is unhelpful: it turns any discussion of statistical evidence
into a personal attack on the researcher. As a consequence, when Reviewer 2 writes "I don't think that the paper presents 
adequate statistical evidence," what the author might read is "Reviewer 2 is calling me an incompetent or a fraud." If R2 is 
concerned about this misinterepretation, they might avoid making the comment. If R2 makes the comment anyway, it
is instead the AE and/or the editor who might feel to push back against the "offensive" comment. And even if
the comment makes it to the authors' desk, it is less likely to be interpreted as a fair scientific concern, or to lead to a 
constructive discussion.

## Why Not Discuss Evidential Value As We Discuss Alternative Explanations?

How do we get past this unhelpful association, and allow ourselves to discuss statistical evidence in conferences and reviews? 
I believe that we should discuss it in the same way that we discuss other "alternative explanations."

When we point to "alternative explanations", we highlight that the current features of the experiment **do not provide 
sufficient control** over other factors that might **reasonably drive the results**. For instance, if an experiment manipulates 
"product complexity," a reviewer might be concerned that it also affects the "perceived cost of the product," particularly 
if the instructions to the participants did not mention the cost of the product. This alternative explanation is reasonable, 
and the current features of the experiment provide insufficient control over it.

In my view, discussions of statistical evidence should follow the same principles: They should take place when the current 
features of the experiment **do not provide sufficient control** over false-positives, particularly when an accumulation of 
false-positives might **reasonably drive the results**.

Assessing whether an accumulation of **false-positives might reasonably drive the results** means asking the following questions:
* How strong is the evidence against the null in any given study? p = .O5 is weaker evidence than p = .001, and 
therefore more consistent with a false-positive.
* Across all studies, how much evidence is there against the null? Single-paper meta analysis are 
[not an appropriate tool](https://doi.org/10.1037/xge0000663) to answer this question, but it is a question that the
[p-curve](http://p-curve.com/) can answer. The flatter the p-curve, the weaker the amount of evidence against the null, 
and the more reasonable it is the results reflect false-positive. For a longer discussion of evidential value, 
see this [previous blog post](https://quentinandre.net/post/evaluating-statistical-value).

Assessing **sufficient control over false-positive** means asking the following questions:
* Is the experiment [properly pre-registered](http://datacolada.org/64), and does the experiment match the pre-registration?
* If the pre-registration is insufficiently detailed, how many degrees of freedom were left to the researcher? 
* If the experiment does not match the pre-registration, how many deviations are present?
* Is the experiment relying on methods that are known to inflate false-positive rates (e.g., 
[excluding outliers by condition](https://psyarxiv.com/fqxs6/), or a [Poisson regression](https://psyarxiv.com/cyv6d/))?
* If multiple hypothesis are tested, are corrections for multiple comparisons properly applied?

## Why Would This Framing Help?

I see multiple benefits to this framing.

1. It is grounded in factual elements

In my view, one of the reasons people dislike talking about statistical value is that this criticism can feel arbitrary,
resembling comments such as "this has been shown before" (without providing a citation or reference) or 
"something else is driving the effect" (without mentioning a single probable cause).

In the framing I offer here, the criticism must be grounded in factual elements: How likely it is that the results reflect 
an accumulation of false-positive, given the level of control over false-positives that exists in the paper?

2. It is something that authors and editors can work with

A direct consequence of the criticism being grounded in factual elements is that the editors can provide actionnable
recommendations based on them, and that the authors can try to answer them. In my view, the best answer to questions 
about evidential value will be a well-powered pre-registered replication of the main effect.

3. It moves the conversation away from personal or ethical considerations

When you suggest an alternative mechanism that might drive the effect, there is no suspicion that you are blaming the 
researchers of anything. The same would be true in this framing: You point out a possible alternative explanation for 
the data (false-positives). If the researchers have insufficiently ruled out false-positives as an alternative explanation, 
it does not make them incompetent or immoral, but it is something that should be addressed before the paper can be published.
