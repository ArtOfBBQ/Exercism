raindrops <- function(number) {

    if (number %% 3) { txt = "" } else { txt = "Pling"}

    if (!number %% 5) { txt = paste(txt, "Plang", sep="") }

    if (!number %% 7) { txt = paste(txt, "Plong", sep="") }

    if (txt == "") { 
        return(as.character(number))
    } else {
        return(txt)
    }
}
