1. Generate the input sequence to be sorted with the script gen.py in python by
   changing the values of the following variables: 
  - n : sequence size
  - eps : probability of failure
  - maxr : maximum range used by the function "randint"
  The values in the sequence are integers generated according to a (discrete)
  uniform distribution within the interval [1, maxr]. 

2. Run the python code to generate the input for the sorting code as follows:
 
   python gen.py

3. Run the R script to present the data:

   Rscript DrawPlot.R
 
   (note that to draw the plots, the sizes of the matrixes must match
   the sizes of the generated data - line 77 and 95 of the R script) 

