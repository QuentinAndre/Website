---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "Making Discussions of Evidential Value Less Awkward and More Constructive"
subtitle: ""
summary: "A different framing on false-positive results and researchers' degrees of freedom."
authors: [Quentin André]
tags: [Tutorial]
categories: []
date: 2021-03-28
lastmod: 2021-03-28
featured: false
draft: true
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

## The Awkward Question in the Room
When presenting results in conferences, or submitting papers to journals, we very often have to answer questions about
"alternative explanations." Isn't there a confound in your manipulation? Isn't it possible that participants misinterpreted 
your instructions? What if your measure is capturing some other construct? Wouldn't this other theory better explain 
your effect? 

While these questions can sometimes be a bit grating (and occasionally unfair to your paper), editors, reviewers and authors in 
our field all recognize that discussions of alternative explanations serve an essential function in the review process. 
They ensure that the evidence presented in the experiments is adequate and proportionate to the theoretical claims that the paper makes.

In contrast, another type of question is, in my experience, rarely asked: Questions regarding the amount of evidential 
value contained in the paper. On the rare occasions I have heard these questions asked at conferences, they were met with 
side-eye and awkward silence, as if the person had said something rude. In fact, these questions are so rare that the few people
I talked with are not be sure how they should be asked. "The evidence against the null is weak" sounds kind of rude. 
"Why are all the p-values very close to .05?" sounds even worse. "Your p-curve is flat" sounds downright vindictive.

I also think that these questions are not often asked in the peer-review process. When I read papers in the top journals of 
our field, I very rarely see confounds in measures or manipulations: I conclude that such "alternative explanations" 
are almost always identified and addressed in the different rounds of peer-review. In contrast, I often see papers 
presenting an inadequate amount of evidence against the null, with flat (or even left-skewed) p-curves: I conclude that
the issue was not discussed (and therefore not addressed) during the peer-review process. In addition, [multiple](http://datacolada.org/82) 
[failure](http://datacolada.org/83) [to](http://datacolada.org/84) [replicate](http://datacolada.org/87) 
[marketing papers](http://datacolada.org/90) suggest that false-positive results creep into the literature more 
often than they should.

## Why So Awkward? "Because of the Implication"

Why do we tip-toe so much around these issues? Why can't we simply point out a lack of evidential value when we see one? 
In my view, it is because "lack of evidential value" rhymes, in a lot of people's mind, with "questionable research practices." 

Regardless of the truth of this association, it is unhelpful because it turns any comment on the evidential value of studies 
into a personal attack on the researcher. As a consequence, when Reviewer 2 says "I don't think that the paper presents 
adequate evidential value," what the author might hear is "Reviewer 2 is calling me an incompetent or a fraud." If R2 is 
concerned that they might sound like a bully, they might choose not to make the comment. If R2 makes the comment anyway, it
is instead the AE and/or the editor who might push back against the "offensive" comment. In the end, it is unlikely that the comment 
will be seen as a scientific concern, and lead to a constructive discussion.

## Why Not Discuss Evidential Value As We Discuss Alternative Explanations?

How do we get past this unhelpful association, and allow ourselves to discuss it in conferences and reviews? 
I believe that we should discuss "lack of evidential value" in the same way that we discuss "alternative explanations."

When we point to "alternative explanations", we highlight that the current features of the experiments **do not provide 
sufficient control** over other factors that might **reasonably drive the results**. For instance, if an experiment manipulates 
"product complexity," a reviewer might be concerned that it also affects the "perceived cost of the product," particularly 
if the experiment did not provide the cost of the product in the instructions. This alternative explanation is reasonable, 
and the current features of the experiment provide insufficient control over it.

In my view, discussions of evidential value should follow the same principles: They should take place when the current 
features of the experiment **do not provide sufficient control** over false-positives, particularly when an accumulation of 
false-positive might **reasonably drive the results**.

Assessing whether an accumulation of **false-positives might reasonably drive the results** means asking the following questions:
* How strong is the evidence against the null in any given study? p = .O5 is weaker evidence than p = .001, and 
therefore more consistent with a false-positive.
* Across all studies, how much evidence is there against the null? Single-paper meta analysis are 
[not an appropriate tool](https://doi.org/10.1037/xge0000663) to answer this question, and it is instead better to rely
on the [p-curve](http://p-curve.com/). The flatter the p-curve, the weaker the amount of evidence against the null, and 
the more reasonable it is the results reflect false-positive.

Assessing **sufficient control over false-positive** means asking the following questions:
* Is the experiment [properly pre-registered](http://datacolada.org/64), and does the experiment match the pre-registration?
* If it is improperly pre-registered, how many degrees of freedom are left to the researcher? 
* If the experiment does not match the pre-registration, how many deviations are present?
* Is the experiment relying on methods that are known to inflate false-positive rates (e.g., 
[excluding outliers by condition](https://psyarxiv.com/fqxs6/), or a [Poisson regression](https://psyarxiv.com/cyv6d/))
* If multiple hypothesis are tested, are corrections for multiple comparisons properly applied?

## Why Would This Framing Help?

I see multiple benefits to this framing.

1. It is evidence-based

In my view, one of the reasons people dislike talking about evidential value is that this criticism can feel arbitrary,
with a flavor of "this has been shown before" (without providing a citation or reference) or "something else is driving 
the effect" (without mentioning a single probable cause).

In the framing I propose, the criticism must be grounded in factual elements: How likely it is that the results reflect 
an accumulation of false-positive, given the level of control over false-positives that exists in the paper?

2. It is something that authors and editors can work with

A direct consequence of the criticism being grounded in factual elements is that the editors can provide actionnable
recommendations based on them, and that the authors can try to answer them. In my view, the best answer to questions 
about evidential value will be a well-powered pre-registered replication of the main effect.

3. It moves the conversation away from personal or ethical considerations

When you suggest an alternative explanation, there is no suspicion that you are blaming the researcher of anything. The
same would be true in this framing: You point out a possible alternative explanation for the data (false-positives). If 
the researchers have insufficiently ruled out false-positives as an alternative explanation, it does not make them incompetent 
or immoral people.
