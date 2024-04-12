---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "Four Lessons from Reproducing JCR Studies"
subtitle: "What happens when two researchers attempt to reproduce all the pre-registered studies with open data published in JCR?"
summary: "What happens when two researchers attempt to reproduce all the pre-registered studies with open data published in JCR?"
authors: [Quentin André]
tags: [Tutorial]
categories: []
date: 2024-03-23
lastmod: 2024-03-23
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

* NOTE: Due to a mistake I made when searching for pre-registered studies with open data in JCR, the numbers mentioned in a previous version of this post were incorrect. This post was updated on April 11th 2024 to reflect the updated (and now correct) numbers. I apologize for this error. If you want to learn more, [check out this other blog post]({{< ref "/post/tifu" >}}). * 

My co-author Nick Reinholtz and I have recently attempted ([as part of an effort to validate the cost-effectiveness of method we are writing a paper on](https://papers.ssrn.com/sol3/papers.cfm?abstract_id=4561485)) to reproduce the results of all pre-registered studies with open data we could find in the Journal of Consumer Research. What did we learn? A few interesting things!

## Lesson 1: The Data Can Be Available... Just Not to You
We searched for all articles published in JCR which contain at least one of the keywords “osf”, “Open Science Framework” or “researchbox” (to identify posted datasets) and at least one of the keywords “pre-registration”, “preregistration”, "pre-registered", "preregistered", or “aspredicted” (to identify pre-registrations). This search returned 107 papers: Exciting!

When we took a closer look at this set however, we found out that a few papers mentioned that the data was available on an OSF/ResearchBox repository... but did not share a link. A mistake? No, a literal interpretation of the [JCR Data Policy](https://consumerresearcher.com/jcrs-data-policy-in-practice), which requires that the data is made accessible to the Editor and Associate Editor... but not to the readers of the journal.

I must admit I was a bit surprised: To me, the main barrier to sharing data is that it takes time and effort to gather your data files, generate codebooks, and upload them somewhere. But once you've done it for one person, what's the cost of making it accessible to the public?

In the end, we had 51 papers with data. Bummer... but less work for us I guess?

## Lesson 2: Many Pre-Registrations Are Under-Specified, And Deviations Are Rarely Acknowledged

Next, we needed to look at the pre-registrations (to identify the primary hypothesis of each study), and contrast them with the analyses reported in the paper. We found two things:

* Researchers occasionally deviate from their pre-registrations ([which can be done for perfectly good reasons](https://osf.io/preprints/psyarxiv/ha29k)), but very rarely mention it. This isn't great, as it suggests that 1) reviewers might not have taken a close look at the pre-registration and 2) the pre-registered analysis might not have been significant (otherwise why deviate without mentioning it?).
* A good pre-registration should leave no degrees of freedom to the researcher, and should thus cover data exclusions, data transformations, dependent measures, statistical tests, contrasts of interest, etc. Few of them had this level of details. While a [bad pre-registration is still  better than no pre-registration]({{< ref "/post/bad-prereg-better-than-no-prereg" >}}), this lack of clarity made it difficult to tell if the analyses matched the researchers' original intentions.

Which brings me to the next lesson we learned...

## Lesson 3: Results Are Very Hard to Reproduce From The Text of The Manuscript Alone

A few papers included their code along with their data. For these papers, reproducing their results was generally a breeze. Most papers, however, did not include their code: We had to rely on the description of the analysis in the paper and in the pre-registration to process the data.

Descriptions of analyses are, as it turns out, highly imprecise: In many cases, it took many trials-and-errors to find out exactly what the authors had done. In a few rare cases, we were completely unable to reproduce the analyses. So please, post your code! Even SPSS syntax helps!

## Lesson 4: Things Are Getting Better

As an open-science enthusiast, I was honestly a bit bummed to find out that out of all the research ever published in JCR, we could "only" find 51 papers with at least one pre-registered study and open data. 

The silver lining is that things are improving. The first paper with at least one pre-registered sutdy with open data was published in 2019. In 2023, there were 25 such papers. Progress!
