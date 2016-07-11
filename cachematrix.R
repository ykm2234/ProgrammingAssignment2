## Put comments here that give an overall description of what your
## functions do

## The function makeCacheMatrix takes a matrix x, and returns a list, containing four functions: 
##  1. setMatrix, which takes a matrix as input and assigns it to the variable x holding the matrix, and clears the inverse
##  2. getMatrix, which recovers the matrix x inside the cached matrix type 
##  3. setInverse which takes a matrix as input and assigns it to the inverse variable, which holds the inverse
##  4. getInverse which returns the matrix stored in the inverse variable

makeCacheMatrix <- function(x = matrix()) {
  inverse<-NULL
  setMatrix<-function(y){
    x<<-y
    inverse<<-NULL
  }
  getMatrix<-function() x
  setInverse<-function(inv) inverse<<-inv
  getInverse<-function() inverse
  list(setMatrix = setMatrix, getMatrix = getMatrix, setInverse=setInverse, getInverse=getInverse)
}


## The cacheSolve function takes a cached matrix type x as input,
## checks if its inverse has been cached and if so returns the inverse,
## otherwise it computes the inverse using solve(-), caches it,  and returns it

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  inv<-x$getInverse() ##inv will be the inverse inside x
  if (!is.null(inv)) {
    message("getting cached inverse")
    return(inv)  ## return cached inverse
  }
  m<-x$getMatrix()  ## get the matrix that x contains
  inv<-solve(m) ## compute inverse of matrix m
  x$setInverse(inv)  ## cache the inverse of m into x
  inv  ## return inverse of m
}
