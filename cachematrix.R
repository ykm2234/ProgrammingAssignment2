## Put comments here that give an overall description of what your
## functions do

## The function makeCacheMatrix takes a matrix x, and returns
## a list, containing the matrix as the first/"matrix" element,
## and a spot for its inverse in the "inverse" label

makeCacheMatrix <- function(x = matrix()) {
  inverse<-NULL
  setInverse<-function(inv) inverse<<-inv
  getInverse<-function() inverse
  list(matrix=x, setInverse=setInverse, getInverse=getInverse)
}


## The cacheSolve function takes a special matrix type x as input,
## checks if its inverse has been cached and if so returns the inverse,
## otherwise it computes the inverse and returns it

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m<-x$matrix
  inv<-x$getInverse()
  if (!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }
  inv<-solve(m)
  x$setInverse(inv)
  inv
}
