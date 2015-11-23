## Put comments here that give an overall description of what your
## functions do
## There are basically two functions been used in the R code below. one to make cache 
##matrix and the other to compute the inverse of the matrix

## Write a short comment describing this function
##This function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
m <- NULL
        set <- function(y){
          x <<- y  
          m <<- NULL #stores matrix in caches
      }
        get <- function() x #gets matrix
        setInverse <- function(solve) m<<- solve 
        getInverse <- function() m #get inverse matrix
        list(set = set, get = get,
                setInverse = setInverse,
                getInverse = getInverse)  
}

## Write a short comment describing this function
##This function computes the inverse of the special "matrix" returned by makeCacheMatrix above

cacheSolve <- function(x, ...) {
 m <- x$getInverse()                 
            if(!is.null(m)){                    
              message("getting cached data")    
              return(m)    ## Return a matrix that is the inverse of 'x'                     
        }
            data <- x$get()   #get the matrix used by makeCacheMatrix                  
            m <- solve(data, ...)               
            x$setInverse(m) 
       } 
        
}
