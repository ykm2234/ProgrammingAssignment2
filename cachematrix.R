## Put comments here that give an overall description of what your
## functions do

## The following function takes a matrix, and returns
## a list, containing the matrix as the first/"matrix" element,
## and a spot for its inverse in the "inverse" label

makeCacheMatrix <- function(x = matrix()) {
  inverse=NULL
  list(matrix=x, inverse=inverse)
}


## The following function takes a special matrix type as input
## checks if its inverse has been cached and returns it if it has
## otherwise it computes the inverse and returns it

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m<-x$matrix
  inv<-x$inverse
  if (!is.null(inv)) {
    return(inv)
  }
  inv<-solve(m)
  ##x$inverse<-inv
  inv
}
