# BehaviorAnalysis
This project will help to do analysis for behavior tests
## Introduction
Light plays a crucial role in the survival and well-being of various species, including humans. Apart from its obvious function in vision, light also influences numerous physiological processes, including biological rhythms, sleep, cognition, and mood. Understanding the impact of light on mood can potentially lead to the development of effective, non-invasive therapies for mood disorders.

In Dr. Shai Sabbah's lab, our research focuses on investigating the relationship between light, brain activity, and mood. To induce a depressive state in mice, we manipulate their light environment by altering the light cycle. We utilize the concept of zeitgeber time (ZT), which is a standardized notation representing different phases in a circadian cycle. For instance, ZT 0 signifies the beginning of the day or light phase, while ZT 12 marks the start of the night or dark phase.

To assess the behavioural effects of nighttime light exposure, we have established a murine LAN (light at night) paradigm. This involves subjecting the mice to 2 hours of blue light (~400 lux) between ZT 13 and ZT 15 (we are trying to mimic blue tv light at night). Control animals, on the other hand, experience a regular 12-hour light and 12-hour dark cycle. Following the manipulation of the light cycle without affecting the mice's circadian rhythm, we conduct a series of behavioural tests to evaluate their anxiety and depressive states. These tests include the sucrose preference test, elevated plus maze, open field test, and force swimming test.

#### The objective of this project is to analyze and plot the results of the behavior tests and the activity of mice under specific light cycles. 
Key features that are required for this analysis and plotting include:

1-The ability to select the desired light cycle for each light cabin and type of light (color) in cabin 2 (the only cabin that we have different light), as we continually utilize different cycles and type of light.

2-Generating a general distinct plot for each behaviour test, enabling clear visualization and comparison of the data. The most powerful aspect of this part lies in its ability to adapt to diverse data structures without requiring major modifications. As long as the data is structured correctly, the apps functions can be used, making it a versatile and general tool for data analysis and comparison. Because we continually utilize different types of groups, we want to compare their behavior tests (light cycles, effect of drugs etc.).

By effectively analysing and visualizing the behaviour test results and mouse activity in response to different light cycles, I aim to gain valuable insights into the connection between light, behaviour, and mood. To achieve this aim, I created a GUI for easy interaction with the codes I created.



## Methods
### step 1: Infrared
The GUI efficiently processes the infrared data through its dedicated 'InfraRed' section (Figure 2.A). This data, obtained from infrared sensors placed in each cage, quantifies the minute-by-minute activity. The data is then stored in a CSV database, with time represented as rows and cages as columns (Figure 2.B). Given the frequent changes in light cycles and types, the GUI provides the user with the flexibility to select the desired light cycle for each cabin, even offering an option for blue light in cabin 2—the only cabin with this feature. Another valuable feature is the 'baseline days,' where users input the number of days the mice in a particular cabinet experienced a normal light cycle. For plotting the activity and color-coded periods based on the light cycle, the GUI requires the CSV file, light cycle information for each cabin, the number of baseline days, and the color of light. Users can choose to visualize this information for one consecutive day (covering 24 hours in a row) (Figure 2.C-D) or two consecutive days (spanning 48 hours in a row) (Figure 2.E-F), allowing for tailored representations. Additionally, the GUI offers two more insightful plots (Figure 2.G-H). The first plot shows the mean activity for each cage across all days, providing an overview of cage-specific trends. The second plot displays the mean activity along with error shades, allowing users to analyze variations across all days for each light cycle. Overall, the GUI presents a user-friendly interface for processing infrared data, enabling comprehensive plotting options to visualize activity patterns and explore trends based on light cycles. 
For this part I mainly use these functions:
=>function [thelist] = getFileList(varargin)
=>function [] = PlotTaVSTbn24(data,Ta,Tb,beginT24)
=>function [] = PlotTaVSTbn48(data,Ta,Tb,beginT24)
=> function [] = more_plots(data, Ta, Tb)
=>function [] = EstimateActivity(dataT)
=>function [] = differencesInActivity(dataT)
=>function varargout=shadedErrorBar(x,y,errBar,lineProps,transparent)

![image](https://github.com/ellahn3/BehaviorAnalysis/assets/73067197/0308f633-3d6f-4d98-a8cd-e466d132e36d)

#### Figure 2 InfraRed
(A) InfraRed GUI. (B) infrared data. Quantification of the activity in each cage.  Rows is time and columns are cage number (C) 24- hour plot of the mean activity for CT13 light cycle cages. (D) 24-hour plot of the mean activity for T24 light cycle cages. (E) 48- hour plot of the mean activity for CT13 light cycle cages (I couldn’t get the blue line for the second day, I tried everything [I think] and it didn’t work). (F) 48-hour plot of the mean activity for T24 light cycle cages. (G) mean activity for all the days for each cage  (H) mean activity throughout all the days for each light cycle with error range shades.

### step 2: Behaviour Tests
The data obtained from Behavior Tests comes from Noldus EthoVision XT. This data is generated as a CSV file, capturing the results from the lab-conducted behavior tests (Figure 3.B). This data is efficiently processed using the dedicated 'BehaviorTests' section within the GUI (Figure 3.A). To make the data accessible and manipulable in MATLAB, a user-friendly STRUCT representation is created, composed of multiple structures (Supplementary information 1.A). Utilizing this structured database, we perform data analysis and generate plots featuring average values and error bars for each group. Additionally, a permutation t-test is executed to compare the two groups, with the results displayed as a subtitle. Users have the flexibility to plot each test individually (Figure 3.C-F) or consolidate all plots into one comprehensive figure (Figure 3.G). Moreover, users can access more detailed plots for a specific test by selecting 'more plots raw data'—for example, for the EPM test (Figure 3.H). This streamlined approach ensures efficient data processing, accurate statistical analyses, and an easy-to-navigate platform for generating comprehensive visual representations of the behaviour test results. 
For this part I mainly use these functions:
=>function newdata = GenConverter(path, file)
=>function [] = MyPlot(group1Data, group2Data, Groups, variableName, component, ylabelText)
=>function [] = plotGroupComparison(data, variableName, ylabelText)
=>function [] = GenAll_Plots(data,yaxlab)
=> function [myanalyzedData] = analyzingData(data)
=>function [p, observeddifference, effectsize] = permutationTest(sample1, sample2, permutations, varargin)
![image](https://github.com/ellahn3/BehaviorAnalysis/assets/73067197/6d4a94f3-1e1e-48b2-9138-6b249cbe357e)
![image](https://github.com/ellahn3/BehaviorAnalysis/assets/73067197/a30f8989-5101-49ef-9d79-0f5a6c14f711)

#### Figure 3 BehaviorTests 
(A) BehaviorTests GUI. (B) Behavior Tests data. (C) Sucrose Preference Behavior Test plot, plotting data mean according to Sucrose consumed / (Sucrose + Water consumed), when the Sucrose is on the Left and right side of the cage (g). (D) Elevated Plus Maze Behavior Test plot, plotting data mean according to (open arms)/ (open + closed arms), in duration (sec) and in distance (cm). (E) Open Field Behavior Test plot, plotting data mean according to periphery/ periphery + center. (F) Forced Swimming Behavior Test plot, plotting data mean according to inactive/(active + inactive), in duration (sec) and in frequency. (G) All Behavior Tests plotted in one figure. (H) Elevated Plus Maze Behavior Test plot data mean for each cage separately to maybe fined outliers

## Conclusion 
In conclusion, this project represents a significant advancement for our laboratory in analyzing behavior data in a highly flexible and efficient manner. By integrating the data processing through the dedicated 'InfraRed' section in the GUI, we have streamlined the entire workflow, enabling seamless analysis of the minute-by-minute activity data obtained from infrared sensors in each cage. The implementation of the CSV database storage, with time as rows and cages as columns, ensures the data's organization and accessibility, providing a structured foundation for further analysis. Additionally, the GUI's user-friendly features empower researchers to effortlessly select and customize the light cycle settings for each cabin, including the option for blue light in cabin 2, catering to specific experimental requirements. The incorporation of the 'baseline days' feature further enhances the data analysis capabilities, allowing researchers to account for the baseline conditions and accurately interpret the effects of light cycle manipulations on the activity patterns of the mice. The versatility in plotting options, ranging from one consecutive day (covering 24 hours) to two consecutive days (spanning 48 hours), provides a comprehensive view of the activity patterns and variations over time, facilitating a more thorough exploration of the data. Moreover, the GUI offers additional insightful plots, displaying mean activity for each cage throughout all days, as well as mean activity with error shades for each light cycle. These visual representations enable researchers to identify trends, variations, and potential correlations, providing valuable insights into the experimental outcomes. Overall, the successful development and implementation of this project empower our laboratory to extract meaningful insights from the behavior data effortlessly and efficiently. The GUI's flexibility and user-friendly interface contribute to accelerating research progress, making it an invaluable tool for our behavioral studies, and advancing our understanding of light-mood interactions and its implications for mood disorders.







