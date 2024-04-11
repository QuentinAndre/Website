---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "Today I F-ed Up: Two Errors I Recently Made In an Almost-Published Paper"
subtitle: "Let's talk about errors in research, using myself as an example."
summary: "Let's talk about errors in research, using myself as an example."
authors: [Quentin André]
tags: [Tutorial]
categories: []
date: 2024-04-10
lastmod: 2024-04-10
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

There's an online community I occasionally enjoy reading: a subreddit called TIFU. TIFU stands for Today I F-ed Up: As the name indicates, it's a place where people share their mistakes and the consequences that ensued. These stories are often hilarious, occasionally profound, and always a good way to lift your spirits up after making mistakes yourself.

Honoring the spirit of this subreddit, I'm going to share the story of how I f-ed up. 

## The Context

As I've shared before, my co-author Nick Reinholtz and I have been working on a paper on group sequential designs: A method that (we argue) can help researchers increase the cost-effectiveness of hypothesis testing. In this paper, we present a re-analysis of all the pre-registered studies with open data we could find in the Journal of Consumer Research. We use this re-analysis to quantify the savings that researchers would have achieved by using group sequential designs.

We learned two weeks ago that our paper, after four rounds of review, was finally accepted at the Journal of Consumer Research. This is an exciting moment in the life of any researcher: You can finally wrap up months (sometimes years!) of hard work, send the final version of the paper to the managing editor, and celebrate while you wait for your research to finally appear on the journal's website.

Less than 24h after sending these final materials, our colleague Alix Barasch reached out to Nick. She told him that she and her co-author Jackie Silverman downloaded the list of papers that we had re-analyzed from our OSF repository, and that they were puzzled not to see one of their papers on this list: After all, this paper contained multiple pre-registered studies with open data, and was published in JCR. Uh oh.

So instead of kicking our feet up and celebrating our paper acceptance with a cold Colorado brew, we frantically wrote an email to the managing editor,  asked them to immediately pump the brakes, and prayed that it would not be too late to stop the publication. The managing editor quickly replied, and told us that they would hold off publishing the paper until we are able to figure out what's going on. Phew.

## F-Up Number 1: We Missed Many Papers

To identify pre-registered studies with open data in JCR, we used a software called Publish or Perish. It allows you to run complex queries on Google Scholar, such as "find all the paper in JCR that contains at least one of the words OSF, open science framework, or ResearchBox, and at least one word that starts with pre-reg, prereg, or aspredicted".

Now, Google Scholar isn't smart enough to process a sentence like this. Instead, you have to type a query that describes these criteria. Based on my experience querying databases and other search engines, I wrote the following query: 

<div style="text-align: center;"><i>source:"Journal of Consumer Research" (OSF | ResearchBox | "Open Science Framework") & (pre-reg* | prereg* | aspredicted* )<i/></div>

If you have never seen some of these symbols before, the pipe symbol ** | ** is the logical operator OR, the ampersand ** & ** is the logical operator AND, and the star symbol at the end of a string XYZ means "a words that start with XYZ, followed by any number of characters". Easy, right? Indeed, all the papers returned by this query mentioned pre-registrations, and mentioned OSF/ResearchBox. We thought the query had succeeded in finding all the papers we wanted to find.

As we would soon discover after our colleague's remark though, [Google Scholar has its own way of processing queries](https://library.uregina.ca/c.php?g=606135&p=4201992). In Google Scholar world, the star symbol doesn't exist... and the *-* symbol (like the one that appears in "pre-reg" for instance) means a negation (i.e., papers that contain "pre" but not "reg"). Long story short, the query that we used definitely did not return all the JCR papers containing pre-registered studies with open data. In fact, it missed approximately half of them.

## F-Up Number 2: My Code Contained a Mistake

After we discovered this mistake, we re-run a more comprehensive set of queries, and decided to add all the papers we had missed to our re-analysis. That was a lot of extra work (we needed to write R code attempting to reproduce the results of more than a hundred additional studies), but it felt like just deserts for the mistake we had made.

After a few days of hard work, we had everything we needed, and I re-ran the code I had originally written to compute the cost-savings of group sequential designs. Ten hours of computing later, the results came in: On this fuller set of papers, we found even larger cost savings than originally reported. Hurray!

... Except something wasn't right. In fact, the results looked too good to be true. And sure enough, when carefully checked my code, I discovered that I had made a small, stupid, but consequential mistake when computing the savings associated with some group sequential designs. A number that should have been placed at the denominator of an equation was placed at the numerator.

After fixing this mistake, and applying the corrected code to all the papers we missed, the total savings that we find are still substantial (between 20% and 29% of the participants cost), but less than originally reported (between 30 and 42%).

## Fixing F-Ups and Learning From Them

Overall, I've been very lucky in many ways. First, we had friendly and helpful researchers who checked our results, and promptly warned us that something was wrong. Second, the editor and managing editor of the journal were both very understanding, and willing to give us time to fix the errors that we discovered. Third, our results didn't change that much: While the savings that we report are less impressive than originally reported, they do not change our conclusion that researchers can use group sequential designs to save resources. All of this has made admitting these mistakes, and fixing them, a lot less painful than it could have been.

There are versions of the world in which things would have been less pretty though. We could have discovered these mistakes much later, which would have forced us and the journal to issue a correction. The mistakes could have been more severe, and might have invalidated our results altogether. Worse, we might not have discovered them at all, and published a paper with incorrect conclusions.

Looking back on these mistakes, I see three valuable lessons for myself (and maybe for other scholars who, like me, sometimes make mistakes):
1) Don't assume things work in a certain way. Because of Google Scholar's superficial similarity with Google and other search engines, I assumed that it would process queries in the same way. It did not
2) When you write code from scratch, write tests. This is what real programmers do when they write code: They use inputs for which they know what the output should be, and check that the functions they have written return the correct outputs when given these inputs. Writing tests would have allowed me to catch the numerator/denominator error.
3) Share as much as possible about your work. These mistakes were discovered because other researchers (i) accessed our OSF repository, (ii) downloaded the list of papers we had compiled and (iii) alerted us that their paper was missing. If we hadn't posted our code and methods, or if we hadn't shared pre-prints of our work, these mistakes would have probably gone unnoticed (or would have been discovered much later).
