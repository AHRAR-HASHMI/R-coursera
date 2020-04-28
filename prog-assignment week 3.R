makeCacheMatrix <- function(x = matrix()) {
    inverse <- NULL
    set <- function(y) {
        x <- y
        inverse <<- NULL
    }
    get <- function(){
        x 
    } 
    setinverse <- function(inverse) {
        inverse <- inverse 
    }
    getinverse <- function() {
        inverse 
    }
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)
    
}

cacheSolve <- function(x, ...) {
    inv <- x$getinverse()
    if(is.matrix(inv)) {
        print("getting data")
        return(inv)
    }
    data <- x$get()
    inv <- solve(data, ...)
    x$setinverse(inv)
    inv
}
