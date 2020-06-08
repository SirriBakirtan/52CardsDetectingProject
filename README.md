
                                            Playing Cards Detecting Project   

                                          İbrahim Anıl Yurtsever, Sırrı Bakırtan
                         Department of Computer Engineering, Eskişehir Technical University, Eskişehir
                                  anil131@eskisehir.edu.tr, sirribakirtan@eskisehir.edu.tr
<p align="center">
Abstract <br> 
  This project aims to create a card recognition system using image recognition techniques with Matlab.
              <br> Keywords-component; image recognition; matlab;
  </p>
<p align="center">
I.Introduction
  <br>
  With this project, we created a card recognition system that takes rotated, angled, with differerent backgrounds, non overlapping   <br>card images and defined the cards in the image. We defined an algorithm to process the image, define the card areas, and       <br>recognize them individually.
<p/>
<p align="center">
II.Algorithm
</p>
<ol>
<li> Create an array for segmented images, define each card in the image, segment the card and add it to the array.</li>
<li> Apply quadrilateral transformation the segmented image to convert the card image to a vertical format.</li>
<li> Crop the top left part, segment number and type, subtract type from each defined type template, return the one with least value, apply the same technique to number segment.</li>
</ol>
<p align="center">
  II.a Algorithm Flow Chart
</p>
<p align="center">
  <br><img width="460" height="500" src="results/ChartAlgorithm.jpg">
</p>

<p align="center">
III.	Example
  <br>
</p>
<p align="center">
1.	Segmenting the cards
 <br>
  <img width="260" height="200" src="results/SegmentCard.png">
</p>

<p align="center">
2.	Quadrilateral transformation
<br>
  <img width="260" height="250" src="results/QuadliteralForm.jpg">
</p>

<p align="center">
3.	Crop number and type
<br>
  <img width="150" height="160" src="results/CropNumberType.png">
</p>

<p align="center">
4.	Calculate the differences by subtraction
<br>
  <img width="260" height="100" src="results/CalSubtract.jpg">
</p> 
 
<p align="center">
5.	Select the least calculated difference value
</p>
  
<p align="center">
IV.Conclusion
 <br>
Accuracy = 83.018
</p>
<p align="center">
Results
 <br>
  <img width="300" height="250" src="results/FScorePrecisionRecall.jpg">
</p> 
<p align="center">
(Acquired Confusion Matrix Chart)
 <br>
  <img width="860" height="500" src="results/ConfusionMatrixChart.jpg">
</p> 
 
<p align="center">             
V. Future Work
  <br>
  Some improvements can be made in this project such as classifying using color red and black.Thanks to color,we can improve 
  <br>
  our f1 score.On the other hand,this project can also be done using  neural networks.For example,Darknet - Yolo,using opencv.
</p>
                                                                                  
<p align="center">   
  Thanks to 
  <a href="https://github.com/AnilYurtsever">İbrahim Anil Yurtsever</a>
  </p>
