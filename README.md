# BehaviorAnalysis
This project will help to do analysis for behavior tests
## Introduction
Light plays a crucial role in the survival and well-being of various species, including humans. Apart from its obvious function in vision, light also influences numerous physiological processes, including biological rhythms, sleep, cognition, and mood. Understanding the impact of light on mood can potentially lead to the development of effective, non-invasive therapies for mood disorders.
In Dr. Shai Sabbah's lab, our research focuses on investigating the relationship between light, brain activity, and mood. To induce a depressive state in mice, we manipulate their light environment by altering the light cycle. We utilize the concept of zeitgeber time (ZT), which is a standardized notation representing different phases in a circadian cycle. For instance, ZT 0 signifies the beginning of the day or light phase, while ZT 12 marks the start of the night or dark phase.
To assess the behavioral effects of nighttime light exposure, we have established a murine LAN (light at night) paradigm. This involves subjecting the mice to 2 hours of blue light (~400 lux) between ZT 13 and ZT 15 (we are trying to mimic blue tv light at night). Control animals, on the other hand, experience a regular 12-hour light and 12-hour dark cycle. Following the manipulation of the light cycle without affecting the mice's circadian rhythm, we conduct a series of behavioral tests to evaluate their anxiety and depressive states. These tests include the sucrose preference test, elevated plus maze, open field test, and force swimming test.
#### The objective of this project is to analyze and plot the results of the behavior tests and the activity of mice under specific light cycles. Key features that are required for this analysis and plotting include:

1-The ability to select the desired light cycle for each light cabin, as we continually utilize different cycles.

2-Generating distinct plots for each behavior test, enabling clear visualization and comparison of the data.

By effectively analyzing and visualizing the behavior test results and mouse activity in response to different light cycles, we aim to gain valuable insights into the connection between light, behavior, and mood.

## Methods
### Experimental data:
#### Infrared data-
We employ an infrared detector to quantify the activity of each cage based on the heat emitted within the cage. For every cage, we obtain minute-by-minute quantifications of the mice's activity, enabling us to assess their activity patterns during both daytime and nighttime. The primary goal is to manipulate the light cycle without affecting the mice's biological clock, which allows us to study the influence of light on their behavior while maintaining their natural circadian rhythm.

![image](https://github.com/ellahn3/BehaviorAnalysis/assets/73067197/d319bc22-75ee-4c83-8444-4b28dddbe78a)

#### Behavior tests data-
We conduct behaviour tests (including sucrose preference test, elevated plus maze, open field test, and force swimming test) on mice with various characteristics (such as different light cycles and family affiliations). Based on the results of these behaviour tests, we assign scores for each type of test to evaluate their behavioural responses.

![image](https://github.com/ellahn3/BehaviorAnalysis/assets/73067197/153d7981-1d9b-4ae3-bcb7-e44dad33d432)

We have developed a function in MATLAB that facilitates the conversion of this data into a struct. Additionally, we have incorporated a user-friendly feature in the form of a button labeled "Load Data to Convert." With this button, users can conveniently import their data and automatically transform it into the desired struct format. This function simplifies the process of handling and organizing the data for further analysis and interpretation.

![image](https://github.com/ellahn3/BehaviorAnalysis/assets/73067197/e57f1398-8838-42d3-81d9-ca5c433441b5)



