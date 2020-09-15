---

title: "distBuilder"
image_as_title: true
subtitle: "Probability elicitation made easy"
summary: "Are you studying people's perceptions of probabilities or other numerical quantities? 
distBuilder allows you to add distribution builders to your experiments with minimal programming knowledge."

links:
  - icon_pack: fab
    icon: github
    name: See on GitHub
    url: 'https://github.com/QuentinAndre/DistributionBuilder'
  - icon_pack: fas
    icon: file
    name: Documentation
    url: 'https://quentinandre.github.io/DistributionBuilder/'
  - icon_pack: fas
    icon: paperclip
    name: Download
    url: 'https://github.com/QuentinAndre/DistributionBuilder/raw/master/distributionbuilder.zip'
---

In [**'Lay understanding of probability distributions'**](http://journal.sjdm.org/13/131029/jdm131029.pdf)
Daniel Goldstein and David Rothschild (2014) have highlighted the benefits of
using graphical interfaces called **distribution builders** to study
subjective probabilities, perceptions of frequency, and confidence
judgements.

However, such distribution builders are not available on common survey platforms (e.g., Qualtrics). distBuilder was 
created to bridge this gap, and to allow researchers to add fully functional distribution builders to their 
experiment with minimal effort. 

In just three lines of code, you can add a distribution builder to any experiment:

```javascript
var distbuilder = new DistributionBuilder();
distbuilder.render('targetdiv');
distbuilder.labelize({
    labels: [10, 20, 30, 40, 50, 60, 70, 80, 90, 100],
    prefix: "$"
});
```

Here is one distBuilder in action:

{{< codepen id="XWXxeVB" >}}
<br>
To learn more about distBuilder, visit the [documentation page of the library](https://quentinandre.github.io/DistributionBuilder/)!
