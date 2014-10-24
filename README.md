### Introduction

Matrix inversion is usually a costly computation and there may be some
benefit to caching the inverse of a matrix rather than computing it
repeatedly.

This is my result for the second programming assignment of the 
[R Programming course on Coursera](https://class.coursera.org/rprog-008).

My repository is based on a fork of 
[the initial repository](https://github.com/rdpeng/ProgrammingAssignment2).

The `cachematrix.R` file contains 2 to make repeated calculation of the 
inverse of a matrix more efficient:

1. `makeCacheMatrix` creates a special "matrix" object with an internal cache.
2. `cacheSolve` returns the inverse of a matrix object created by makeCacheMatrix.

### Simple test scenario

    # Define a simple matrix
    x <- matrix(c(1, 2, 3, 4), nrow=2, ncol=2)

    # Create a wrapper
    m <- makeCacheMatrix(x)

    # Calculate the inverse
    cacheSolve(m)
           [,1] [,2]
      [1,]   -2  1.5
      [2,]    1 -0.5
  
    # Calculate the inverse again
    cacheSolve(m)
    getting cached data
           [,1] [,2]
      [1,]   -2  1.5
      [2,]    1 -0.5
    
    # Compare with the result of the raw solve function
    solve(x)
           [,1] [,2]
      [1,]   -2  1.5
      [2,]    1 -0.5


### Coding guideline

I'm following 
  [the Google R coding guideline](https://google-styleguide.googlecode.com/svn/trunk/Rguide.xml).
