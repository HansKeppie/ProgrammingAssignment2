## This file contains 2 functions to make repeated calculation of the inverse of a matrix more efficient.
## makeCacheMatrix creates a special "matrix" object with an internal cache.
## cacheSolve returns the inverse of a matrix object created by makeCacheMatrix.

## makeCacheMatrix: This function creates a special "matrix" object that can cache the result of the solve function.

makeCacheMatrix <- function(x = matrix()) {
  # Creates a special "matrix" object wrapper that can cache the result of the solve function.
  #
  # Args:
  #   x: the matrix to be wrapped.
  #
  # Returns:
  #   The matrix object wrapper.
  
  # Set the cache to NULL to indicate that it still needs to be calculated.
  cache <- NULL
  
  set <- function(value) {
    # Use a new value for the internal matrix.
    x <<- value
    # Also reset the cache to NULL to indicate that it needs to be (re)calculated.
    cache <<- NULL
  }
  get <- function() x
  setCache <- function(value) cache <<- value
  getCache <- function() cache
  
  # Return a list of "methods" for the matrix object
  list(set = set, get = get,
       setCache = setCache,
       getCache = getCache)
}


## cacheSolve: This function computes the inverse of the special "matrix" returned by makeCacheMatrix function.

cacheSolve <- function(x, ...) {
  # Computes the inverse of the given matrix object.
  #
  # Args:
  #   x:   a matrix object as created by the makeCacheMatrix function.
  #   ...: extra arguments to be passed to the solve function.
  #
  # Returns:
  #   The inverse of the matrix wrapped by the matrix object x.
  #
  # Note:
  #   The extra arguments will not be taken into account if a cached value is returned.
  
  # First, fetch the cached value
  cache <- x$getCache()
  
  # A non-null cached value indicates a valid inverse value, return it!
  if(!is.null(cache)) {
    message("getting cached data")
    return(cache)
  }
  
  # A NULL cached value indicates that the inverse is yet to be calculated. Do so!
  data <- x$get()
  solved <- solve(data, ...)
  x$setCache(solved)
  solved
}
