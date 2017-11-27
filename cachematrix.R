## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

## This function will cache an inverse matrix
## this is being completed to save compute time
## on a time-consuming task.
makeCacheMatrix <- function(x = matrix()) {
    
    i <- NULL                   ## initilizing i as NULL to hold the inverse matrix value
    set <- function(y) {        ## creating a new function, set; will hold matrix value 
        x <<- y                 ## in the parent environment
        i <<- NULL              ## setting i as NULL
    }
      
    ## get function will return the matrix value 
    get <- function() x     
    
    ## assigning the inverse value
    setIn <- function(inverse) i <<- inverse 
    ## this function will get the inverse matrix
    getIn <- function() i
    ## initializing list to allow use of the $ operator for functions
    list(set=set, get=get, setIn=setIn, getIn=getIn)
}


## Write a short comment describing this function

## This function will compute the matrix that is created
## with makeCacheMatrix if the inverse has not been calculated.
## If the inverse has been calculaed, then the inverse matrix
## will be returned.
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    
    i <- x$getin()          ## calling getIn from makeCacheMatrix
    ## this if statement determins if the matrix has been inversed
    if(!is.null(i)){        
        message("Getting cached data ...")
        return(i)
    }
    
    z <- x$get()            
    i <- solve(z, ...)      
    x$setIn(i)             
    
    i ## calling the inverse matrix
}
