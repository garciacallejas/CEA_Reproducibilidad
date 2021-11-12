mi.funcion <- function(argumento){
  # codigo
  return()
}

# -------------------------------------------------------------------------

v1 <- sample(1:100,10,FALSE)
max(v1)
# este es el código que queremos incluir en nuestra función
v2 <- v1/max(v1)
normaliza_vector <- function(v = NULL){
  res <- v/max(v)
  return(res)
}
v3 <- normaliza_vector(v1)
identical(v2,v3)

source("normaliza_vector.R")

# -------------------------------------------------------------------------

prueba.argumentos <- function(arg1 = NULL, arg2, arg3 = 0){
  cat("arg1:",arg1,"\narg2:",arg2,"\narg3:",arg3)
}
prueba.argumentos(arg1 = 1,arg2 = 1,arg3 = 1)
prueba.argumentos(arg2 = 1)
# prueba.argumentos()

# -------------------------------------------------------------------------

#' Número de palabras de longitud mayor que un valor
#'
#' @param v vector de caracteres.
#' @param l numero; palabras con un número de caracteres mayor que l
#' serán incluidas en el conteo.
#'
#' @return vector numérico, número de palabras con más de l caracteres
#' en cada elemento.
#' @export
#'
#' @examples
#' v1 <- c("este es un vector enormemente variado",
#' "en cuanto a longitud de palabras")
#' v2 <- num_palabras(v1,6)
num_palabras <- function(v = NULL, l = 0){
  # creamos el objeto que devolverá la función
  res <- NULL
  if(!is.null(v)){
    #https://stackoverflow.com/questions/33226616/
    #how-to-remove-words-of-specific-length-in-a-string-in-r
    mi.regex <- paste("\\w{",l,",}",sep="")
    # selecciona palabras mayores que l
    palabras <- stringr::str_extract_all(v, mi.regex)
    # las cuenta
    res <- sapply(palabras,length)
  }
  return(res)
}
