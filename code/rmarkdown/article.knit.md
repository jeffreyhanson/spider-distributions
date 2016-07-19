---
title: "Distribution of funnel web spiders along a walking track"
author: |
  | Jeffrey O. Hanson$^1$
  | $^1$ Correspondance should be addressed to jeffrey.hanson@uqconnect.edu.au
date: "19 July 2016"
abstract: "Funnel web spiders are ferocious beasts that terrorise tourists near Lake Boomanjin. Here we aimed to map their distribution along the walking path to Lake Boomanjin. We split up the path into 8 transects and surveyed each transect 8 times over 8 days, and used open n-mixture models to estimate their population size. We estimated that over 800 spiders inhabit the walking path along the track. This dense infestation of spiders poses a serious threat to the safety of tourists."
output:
  rmarkdown::pdf_document:
    toc: false
    keep_tex: no
    fig_caption: yes
    includes:
      in_header: [preamble.tex]
fontsize: 11pt
documentclass: article
bibliography: references.bib
csl: reference-style.csl
---



# Introduction
Fraser island is a popular tourist attraction. It is home to a great many interesting flora and fauna. In addition, it has several famous sites. The most famous site, perhaps, is Lake Boomanjin. This magnificent water feature is visited by scores of individuals throughout the year. However, the walking track to Lake Boomanjin is lurking by a population of funnel web spiders. This population may pose a serious safety risk to tourists.

We aimed to map the distribution of these hairy beasts along the walking track. Additionally, we aimed to understand the size of the spiders using the size of their holes as a proxy.

# Methods
The Boomanjin Walking track was divided into 16 transects (each approximately 370 m in length; Figure 1). Each transect was surveyed for spider holes once a day over eight days (11--14/07/2016, 16--20/07/2016). These surveys were conducted by a team consisting of two to three expert spider hunters. The size of each hole was measured to the nearest millimeter. The start and end times for each survey was recorded to assess search effort. 

\begin{figure}

{\centering \includegraphics{article_files/figure-latex/unnamed-chunk-2-1} 

}

\caption{\textit{Map of the study area. The line shows the location of the walking track. Points mark the start and end of the transects along the track.}}\label{fig:unnamed-chunk-2}
\end{figure}

Open $n$-mixture models were used to estimate the population size [@r1]. These models estimate the probability of detecting a spider in a given transect independent of the total number of spiders in the transect. Models were fit using the _R2jags_ _R_ package [@r2] (200000 total iterations; 100000 burnin iterations; thinned by 5 iterations; 4). Model convergence was assessed using $\hat{R}$ values. All statistical analyses were conducted in _R_ [version 3.3.0; @r3]. 

# Results
The total number of holes found in all visits was 1422. An average of 19.94 $\pm$ 33.51 SD pider holes were found in each visit to a given transect. Typically, transects were surveyed for 28.32 minutes $\pm$ 17.98 SD. Based on the open $n$-mixture models, the probability of detecting a spider hole in a given transect was estimated to be 0.24 $\pm$ 0.01 SD. The total population size along the track was estimated to be 1336.52 $\pm$ 19.23 SD.

The size of the spider holes were bimodally distributed (Figure 2). The spider holes tended to range between 0--10 mm and 20--35 mm. These results suggest that most of the spiders surveyed were either juveniles or adults.

\begin{figure}

{\centering \includegraphics{article_files/figure-latex/unnamed-chunk-3-1} 

}

\caption{\textit{Histogram showing the size distribution of spider holes.}}\label{fig:unnamed-chunk-3}
\end{figure}

The spider holes were mostly found in a single transect (transect 11 contained 17.65 % of the population; Figure 3). 

\begin{figure}

{\centering \includegraphics{article_files/figure-latex/unnamed-chunk-4-1} 

}

\caption{\textit{Distribution of spider holes along the walking track. Lines show the transects used to sample the distribution of spiders along the walk. The color of each transect corresponds to their estimated number of spider holes using the open $n$-mixture model.}}\label{fig:unnamed-chunk-4}
\end{figure}

# Discussion
The results speak for themselves--no further discussion is necessary.

# Data Accessibility
All data, code, and results are available at \url{www.github.com/paleo13/spider-distributions} to replicate and validate this study. [Table S1](https://raw.githubusercontent.com/paleo13/spider-distributions/master/article/Table_S1.csv) contains data for the location and size of each spider hole. [Table S2](https://raw.githubusercontent.com/paleo13/spider-distributions/master/article/Table_S2.csv) contains data summarised for each transect.



# References

