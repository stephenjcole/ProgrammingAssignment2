## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
        stored_inv <- NULL
        set <- function(y) {
                x <<- y
                stored_inv <<- NULL
        }
        get <- function() x
        setinv <- function(matrix_inv) stored_inv <<- matrix_inv
        getinv <- function() stored_inv
        list(set = set, get = get,
             setinv = setinv,
             getinv = getinv)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}
