## These functions cache the matrix inverse so that the computation does not need
## run again if the matrix was already inverted. The matrices are assumed to be invertible


## This function generates the object to store the matrix and its inverse
makeCacheMatrix <- function(x = matrix()) {
        inv <- NULL
        
        set <- function(y) {
                x <<- y
                inv <<- NULL
        }
        get <- function() x
        setinv <- function(entry) inv <<- entry
        getinv <- function() inv
        
        list(set=set, get=get, setinv=setinv, getinv=getinv)
}


## This function caches the matrix inverse and receives the makeCacheMatrix object
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        inv <- x$getinv()
        if(!is.null(inv)) {
                message("getting cached data")
                return(inv)
        }
        data <- x$get()
        inv <- solve(data, ...)
        x$setinv(inv)
        inv
}