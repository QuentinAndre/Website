---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "How Not To Deal with Outliers"
subtitle: "or 'A Curious Case of Convenient Outliers'"
summary: "A short case study showing how NOT to deal with your outliers, featuring a recent paper published in psychology."
authors: [Quentin André]
tags: [Data Forensics, Error Detection, Tutorial]
categories: []
date: 2020-08-13
lastmod: 2020-08-13
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

links:
  - icon_pack: fas
    icon: book
    name: Notebook
    url: 'files/notebook.ipynb'
  - icon_pack: fas
    icon: database
    name: Data
    url: 'files/data.csv'

---

<script src="https://code.jquery.com/jquery-3.4.1.min.js"
	integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
	crossorigin="anonymous"></script>

<script>
$(document).ready(function() {
    $('.code_shower').on('click',function(){
	var header = $(this);
	var codecell = $(this).next();
        codecell.slideToggle(0, function() {
		if (codecell.is(':hidden')) {
			header.text("Show Code");
			header.css("border-radius", "2px 2px 2px 2px");
		} else {
			header.text("Hide Code");
			header.css("border-radius", "2px 2px 0px 0px")
		}
	});
    });
    $('.hidden_default').next().hide();
});
</script>

<style>
div.input {
	flex-direction: column !important;
}

div.input_area {
	border-radius: 0px 0px 2px 2px;
}

div.code_shower {
	background: lightgray;
	padding: 5px 10px;
	cursor: pointer;
	border-radius: 2px 2px 0px 0px;
}

</style>

<div class="input-code">
<div class="code_shower hidden_default">Show Code</div>
<div class="code_content">

```
# Imports
import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
import pingouin as pg
import scipy.stats as stats
import seaborn as sns
from IPython.display import HTML, display

# Reading the original data
df_all = pd.read_csv("Data_Blind.csv")
df_no_outliers = df_all.query("Excluded_Outliers == 'No'")
```

</div>
</div>

A recent paper in a leading psychology journal reports a pre-registered experiment with significant results: Participants in the "Predicted High" condition have higher scores than participants in the "Predicted Low" condition.


<div class="input-code">
<div class="code_shower hidden_default">Show Code</div>
<div class="code_content">

```
h = df_no_outliers.query("Condition == 'Predicted High'").Score
l1 = df_no_outliers.query("Condition == 'Predicted Low 1'").Score
l2 = df_no_outliers.query("Condition == 'Predicted Low 2'").Score
p1 = stats.ttest_ind(h, l1, equal_var=False).pvalue
p2 = stats.ttest_ind(h, l2, equal_var=False).pvalue
g = sns.catplot(
    y="Score",
    x="Condition",
    data=df_no_outliers,
    height=6.38,
    order=["Predicted Low 1", "Predicted Low 2", "Predicted High"],
    kind="point",
)
g.set_ylabels("Score")
g.set_xlabels("")
g.ax.annotate(f"'Low 1' vs. 'High'\np = {p1:-1.3f}", 
              (0, 995), ha="center", va="center")
g.ax.annotate(f"'Low 2' vs. 'High'\np = {p2:.3f}", 
              (1, 995), ha="center", va="center");
fig = plt.gcf()
plt.close()
display(fig, metadata=dict(filename="Fig1"))
```

</div>
</div>


![png](files/Fig1.png)


Those results are obtained after a serie of (pre-registered) exclusions. In particular, the authors write in the pre-registration that they will exclude participants whose scores are **'extreme outliers, as identified by Boxplot'**.

This description is a bit vague, but those exclusions were visibly helpful: This is what the results look like before excluding the outliers.


<div class="input-code">
<div class="code_shower hidden_default">Show Code</div>
<div class="code_content">

```
h = df_all.query("Condition == 'Predicted High'").Score
l1 = df_all.query("Condition == 'Predicted Low 1'").Score
l2 = df_all.query("Condition == 'Predicted Low 2'").Score
p1 = stats.ttest_ind(h, l1, equal_var=False).pvalue
p2 = stats.ttest_ind(h, l2, equal_var=False).pvalue


g = sns.catplot(
    y="Score",
    x="Condition",
    data=df_all,
    height=6.38,
    order=["Predicted Low 1", "Predicted Low 2", "Predicted High"],
    kind="point",
)
g.set_xlabels("")
g.ax.annotate(f"'Low 1' vs. 'High'\np = {p1:-1.3f}", 
              (0, 985), ha="center", va="center")
g.ax.annotate(f"'Low 2' vs. 'High'\np = {p2:.3f}", 
              (1, 985), ha="center", va="center")
fig = plt.gcf()
plt.close()
display(fig, metadata=dict(filename="Fig2"))
```

</div>
</div>


![png](files/Fig2.png)


Is the paper a bit more precise about those exclusions? Yes! Another study in the paper defines the *extreme outliers* cutoff as *three times the interquartile range below the lower quartile".

$$ x < Q_1 - 3\times IQR$$

The paper also specifies that this threshold will be applied *within each condition* (more on this later). Does the data match this definition?


<div class="input-code">
<div class="code_shower hidden_default">Show Code</div>
<div class="code_content">

```
g = sns.catplot(
    y="Score",
    x="Condition",
    hue="Excluded_Outliers",
    order=["Predicted Low 1", "Predicted Low 2", "Predicted High"],
    data=df_all,
    height=6.38,
    legend=False,
)

for c, x in zip(
    ["Predicted Low 1", "Predicted Low 2", "Predicted High"], 
    [0, 1, 2]
):
    scores = df_all.query("Condition == @c").Score
    cutoff = scores.quantile(0.25) - 3 * stats.iqr(scores)
    plt.plot([x - 0.5, x + 0.5], [cutoff, cutoff], color="black")
    g.ax.annotate(
        f"{cutoff:.2f}",
        (x, cutoff),
        ha="center",
        va="center",
        bbox=dict(fc="white", ec="white"),
    )
g.add_legend(title="Tagged as Outlier")
g.set_xlabels("")
fig = plt.gcf()
plt.close()
display(fig, metadata=dict(filename="Fig3"))
```

</div>
</div>


![png](files/Fig3.png)


This graph shows a clear anomaly: Two observations are above the cutoffs defined by the authors, and are still tagged as "outliers" (and therefore excluded from the analysis). Those two observations are the observations in the "Predicted High" condition with the **lowest** score.

Since this condition is predicted to have a higher score than the other two conditions, this might drive the pattern of results. What happens if we properly apply the cutoff instead, and include those two data points back in the sample?


<div class="input-code">
<div class="code_shower hidden_default">Show Code</div>
<div class="code_content">

```
df_correct = df_all.query("Score > 909.31")

h = df_correct.query("Condition == 'Predicted High'").Score
l1 = df_correct.query("Condition == 'Predicted Low 1'").Score
l2 = df_correct.query("Condition == 'Predicted Low 2'").Score
p1 = stats.ttest_ind(h, l1, equal_var=False).pvalue
p2 = stats.ttest_ind(h, l2, equal_var=False).pvalue


g = sns.catplot(
    y="Score",
    x="Condition",
    data=df_correct,
    height=6.38,
    order=["Predicted Low 1", "Predicted Low 2", "Predicted High"],
    kind="point",
)
g.set_xlabels("")
g.ax.annotate(f"'Low 1' vs. 'High'\np = {p1:-1.3f}", 
              (0, 993), ha="center", va="center")
g.ax.annotate(f"'Low 2' vs. 'High'\np = {p2:.3f}", 
              (1, 993), ha="center", va="center")
fig = plt.gcf()
plt.close()
display(fig, metadata=dict(filename="Fig4"))
```

</div>
</div>


![png](files/Fig4.png)


After correctly applying the cutoff, we no longer observe significant differences between conditions.

t appears that data points that should not have been considered as outliers were excluded from the analysis. Unfortunately, this anomalous exclusion was responsible for the authors' pattern of results.

# But Wait, There's More!

But what if the authors had not made this mistake, and correctly included the two "anomalous outliers"?

Unfortunately, **their analysis would still be invalid, because they do not apply a consistent cutoff across conditions to exclude their outliers.** 

When people apply a different cutoffs for different conditions, they are implicitly rejecting the null that the conditions are drawn from a common distribution. How can we interpret the results of null-hypothesis tests if we have already assumed that the null was not true when pre-processing the data?

In particular, when the data has small N per condition and overdispersion (which is true of the authors'), ignoring this fact has extremely severe consequences on the false-positive rate.

To illustrate this, I ran the following simulation:

1. I created two simulated "conditions" by draw participants at random, without replacement, from the authors' data. I draw 32  observations in each condition (i.e., the average number of participants in the authors' conditions).
2. I run three different t-tests on this simulated data (as the authors did, I apply Welch's t-test, but the same results are observed with standards t-tests):
    * A first t-test using the authors' method: I exclude the outliers within each of the two conditions, applying **different cutoffs** to each of the two conditions
    * A second t-test after excluding the outliers, identified by a **common cutoff** across the two conditions (the "Common Cutoff" t-test)
    * A third t-test with **no exclusion** of outliers.
3. I write down the p-value of each of the three t-tests, and repeat this experiment a very large of time (~10,000 times).


<div class="input-code">
<div class="code_shower hidden_default">Show Code</div>
<div class="code_content">

```
# A few useful functions first

def exclude_extreme_outliers(x):
    """
    A small utility function to exclude *extreme outliers**
    from a vector: Values that are below Q1 - 3*IQR
    """
    iqr = stats.iqr(x)
    low_cutoff = np.percentile(x, 25) - 3 * iqr
    return x[(x > low_cutoff)]


def exclude_extreme_outliers_common(x, y):
    """
    Same function, but applies a common cutoff to two vectors.
    """
    xy = np.concatenate([x, y])
    iqr = stats.iqr(xy)
    low_cutoff = np.percentile(xy, 25) - 3 * iqr
    return (
        x[(x > low_cutoff)],
        y[(y > low_cutoff)],
    )

# The simulated experiment
def compare_data_under_null(data, n=32):
    """
    Compare two vectors of data sampled at random from the authors' data,
    and return the p-values when (1) No outliers are excluded, (2) Outliers
    are excluded based on a common cutoff, and (3) Outliers are excluded using
    a condition-specific cutoff
    """
    xy = np.random.choice(data, n*2, replace=False)
    x, y = xy[:n], xy[n:]
    p = stats.ttest_ind(x, y, equal_var=False).pvalue

    x_common, y_common = exclude_extreme_outliers_common(x, y)
    p_common = stats.ttest_ind(x_common, y_common, equal_var=False).pvalue

    x_diff = exclude_extreme_outliers(x)
    y_diff = exclude_extreme_outliers(y)
    p_diff = stats.ttest_ind(x_diff, y_diff, equal_var=False).pvalue
    return p, p_common, p_diff



# Let's repeat this experiment 10,000 times:
N = 10000
pvals = np.empty(shape=(3, N))
for i in range(N):
    pvals[:, i] = compare_data_under_null(df_all.Score)
pvals_no_excl, pvals_common_cutoff, pvals_diff_cutoffs = pvals

# Now let's visualize the p-values and false-positive rates:
hist_kws = dict(
    bins=np.arange(0, 1.025, 0.025), 
    align="mid", density=True, 
    histtype="step", lw=1.5
)
alpha_no_excl = (pvals_no_excl < 0.05).mean()
alpha_common = (pvals_common_cutoff < 0.05).mean()
alpha_diff = (pvals_diff_cutoffs < 0.05).mean()
fig, ax = plt.subplots(1)
ax.hist(
    pvals_no_excl, 
    **hist_kws, 
    label=f"No Exclusion ($\\alpha= {alpha_no_excl:.3f}$)"
)
ax.hist(
    pvals_common_cutoff,
    **hist_kws,
    label=f"Common Cutoff ($\\alpha= {alpha_common:.3f}$)",
)
ax.hist(
    pvals_diff_cutoffs,
    **hist_kws,
    label=f"Different Cutoff ($\\alpha= {alpha_diff:.3f}$)",
)
ax.legend(frameon=False)
ax.set_xlabel("p-value")
ax.set_ylabel("Density")
sns.despine()
plt.close()
display(fig, metadata=dict(filename="Fig5"))
```

</div>
</div>


![png](files/Fig5.png)


Since the two "conditions" are formed by drawing at random from the pooled data, they should on average do not differ from each other: The p-values reported by the t-tests should be uniformly spread on the interval [0, 1], and should be lower than .05 only 5% of the time. 

This is indeed what we see in the "No Exclusion" and "Common Cutoff" conditions, with a nominal $\alpha$ close to .05.

What about the "Different Cutoffs" condition? The distribution of p-values is so right-skewed that the false positive rate is multiplied by **four**. 

Why does this happen? Intuitively, it is because applying different cutoffs to different conditions will **amplify** the small differences that are found under the null, and make those differences more extreme. This leads to a massive inflation in Type 1 error.

[Stephen Spiller](https://www.anderson.ucla.edu/faculty-and-research/marketing/faculty/spiller) pointed out on Twitter that this Type I error inflation will also happen if your data is normal: You will underestimate the variance, and therefore overestimate the magnitude of your differences.

The take-away is simple: **Do not apply different cutoffs to different conditions when excluding outliers.**
