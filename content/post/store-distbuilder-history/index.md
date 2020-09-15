---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "Recording how Participants Use distBuilder"
subtitle: ""
summary: "Do you wonder how respondents are using distBuilder to construct their final distribution? 
This blog post shows how you can record the history of allocations that participants have constructed in 
 distBuilder."
authors: [Quentin André]
tags: [Numerical Cognition, Javascript, distBuilder, Tutorial]
categories: []
date: 2018-04-14
lastmod: 2018-04-14
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

In this blog post, I will show you how to keep track of the participants' allocation process when they use distBuilder. 
In a few lines of code, we will get better insights in how the participants are constructing their distributions.


## A typical use of DistributionBuilder

A distribution builder is generally used like this:

1. Add it to a survey
2. Let the participant provides her allocation
3. Recover the allocation.

```javascript
// 1. Initialize distBuilder
var distbuilder = new DistributionBuilder()
distbuilder.render("container")
distbuilder.labelize()

// 2. Participants interacting
// Add 3 balls there, remove 2 here, 1 more over here...

// 3. Recover the allocation
console.log(distbuilder.distribution)
```

But what if you want to know what happened in step 2? What if you want
to keep track of all the intermediary steps between the empty distribution
builder, and the final allocation provided by participants?


## Monitoring the changes in the allocation

The distBuilder library provides a very useful property: `onChange`. Any function that
you supply to this `onChange` will be called every time the distribution
changes.

```javascript

function iHaveChanged() {
    // This function just says "I have changed!"
    alert("I have changed!")
}

var distbuilder = new DistributionBuilder({"onChange":iHaveChanged})
distbuilder.render("container")
distbuilder.labelize()
```

The distribution builder will now outputs "I have changed!" to the every time the user makes a change to the allocation.

This is not very useful, but it shows how we can use the `onChange` property to trigger specific actions when the
participants are changing their allocation of balls.


## Recovering and storing the intermediary allocations

Now let's create a better function that will recover the current allocation from the distribution builder, and
stores it in an array.

```javascript
var hist = [] // Empty array that will store the history.

// This function takes a a DistributionBuilder object as argument
function updateHistory(distbuilder) {
    // Make a copy of the current allocation
    var allocation = distbuilder.getDistribution().slice() 
    hist.push(allocation) // Push this copy to the history array.
}

var distbuilder = new DistributionBuilder({
"onChange":() => updateHistory(distbuilder)
})

distbuilder.render("container")
distbuilder.labelize()
```

Now this is more useful! Every time a respondent interacts with the distribution builder, the resulting allocation will
be stored in the `history` array.

A few notes on the code above to better understand what's going on:

* Unlike in the previous example, we did not bind `updateHistory` to `onChange`. Instead, we bind a wrapper function
that calls `updateHistory` with the object `distbuilder` already supplied as argument. This is what
`() => updateHistory(distbuilder)` means.
* The function `updateHistory` makes a copy (with `slice()`) of the allocation before pushing it to the array.
If you do not make a copy, the content of `history` will change every time the allocation changes, and this array will
contain X copies of the current allocation instead of the history. If you have a recent version of the library (> v1.1),
you can omit the `slice()`.

In the example below, you can observe the previous allocations that have been stored.

{{< codepen id="NYJwdq" >}}


## Store the allocation in Qualtrics
Qualtrics' embedded data fields only accept strings. To store the history in Qualtrics, you will therefore have to
convert this array of allocations into one large string.

```javascript
// This function converts the history to a long string.
function historyToString(arr) {
  return arr.map(x => x.join(",")).join("*")
}

Qualtrics.SurveyEngine.setEmbdeddedData(
    "HistoryOfAllocations", historyToString(hist)
)
```

The function above separates the values within each allocation by commas `','` and the different allocations within the
history by stars `'*'`.

Now you are all set! You can observe how participants construct their distributions, and get better insights into their
thinking process. I will discuss results obtained from this paradigm in a future blog post.


