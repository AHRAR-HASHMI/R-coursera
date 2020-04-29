# The makeCacheMatrix function receives a matrix object as a parameter and builds a special matrix object that can 
# save a matrix and its respective inverse.

makeCacheMatrix <- function(x = matrix()) 
{
    inverse <- NULL
#set(parameter) -> Receives a matrix as a parameter and saves it inside the object.
    set <- function(y) {
        x <- y
        inverse <<- NULL
    }
#get() -> Returns the matrix saved inside the object.
    get <- function(){
        x 
    }
#setinverse(parameter) -> Receives a matrix and saves it inside the object (cache).
 
    setinverse <- function(inverse) {
        inverse <- inverse 
    }
#getinverse() -> Returns a matrix and saved inside the object 

    getinverse <- function() {
        inverse 
    }
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)
    
}
# The cacheSolve function returns the inverse of the special matrix object inside the makeCache function.
cacheSolve <- function(x, ...) {
    inv <- x$getinverse()
# If the inverse of the matrix is already stored in the object as a cache, cacheSolve() prints a message
    if(!is.matrix(inv)) {
        print("getting data")
    }
#however, the inverse of the matrix isn't stored in the object, #the function solve() is utilized to calculate
#the inverse of the matrix inside x,
    mat <- x$get()
    inv <- solve(mat, ...)
    x$setinverse(inv)
    inv
}

#output
#out <- makeCacheMatrix(matrix(1:4,2,2))
#cacheSolve(out)


[1] "getting data"
     [,1] [,2]
[1,]   -2  1.5
[2,]    1 -0.5