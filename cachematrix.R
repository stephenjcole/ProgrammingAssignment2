## makeCacheMatrix is a function which creates a list of four functions set, get, setinv and getinv
## which respectively set a matrix into a "cached" variable, get the matrix, set the inverse of the
## matrix into a cached variable and get it.

## These functions work in combination with the cacheSolve function which returns the inverse of it
## If the inverse is already cached, it returns the cached matrix
## If the inverse is not cached, it solves for the inverse, stores it in the cache and returns it



## Create a function that contains a list of 4 functions to manage the contents of two variables
## that exist outside the environment of the function 

makeCacheMatrix <- function(x = matrix()) {
        stored_inv <- NULL
        set <- function(y) {
                ## function to move the argument of the set fucntion into x, clear the value of stored_inv
                x <<- y
                stored_inv <<- NULL
        }
        
        ## function to get the stored matrix
        get <- function() x
        
        ## function to set the inverse of the matrix stored in x, called from cacheSolve
        setinv <- function(matrix_inv) stored_inv <<- matrix_inv
        
        ## function to get the inverse; may be NULL if not set
        getinv <- function() stored_inv
        
        ## return the list containing four functions
        list(set = set, get = get,
             setinv = setinv,
             getinv = getinv)
}


## Function returns the inverse of its argument from the cache, if available.
## If not available, calculates the inverse using solve(), stores the result for future use

cacheSolve <- function(x, ...) {
        ## Get the inverse from the cache
        inverse <- x$getinv()
        
        ## if the inverse is not NULL then we're done return inverse (return ends the function)
        if (!is.null(inverse)) {
                message("Getting cached data")
                return(inverse)
        }
        
        ## else get the matrix 
        data <- x$get()
        
        ## find its inverse using solve()
        inverse <- solve(data)
        
        ## store the inverse in the cache for later use
        x$setinv(inverse)
        
        ## return the inverse
        inverse
}
