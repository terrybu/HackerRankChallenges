class BlankWord
  def initialize(startRowIndex, startColumnIndex, direction, length)
      @startRowIndex = startRowIndex
      @startColumnIndex = startColumnIndex
      @direction = direction
      @length=length
      @nextWordsIndexes = []
   end
    attr_accessor :startRowIndex, :startColumnIndex, :direction, :length, :nextWordsIndexes
end

=begin
the logic is as soon as we find a minus, we know there's an empty word in the crossword puzzle
We loop over, find the first minus and map out the blank word into a BlankWord object
how large is the blankword?
which direction is it going?
And which index of the word starts the next word?
Makes sense to do OOP here but i'm using ruby so will have to learn some class creation with Ruby
=end

$matrix = Array.new(10) {Array.new(10)}
$words = []
$blankWords = []

def getInputAndWords
	for rowIndex in 0...10
	    oneLine = gets.chomp.to_s
	    for columnIndex in 0...10
	    	$matrix[rowIndex][columnIndex] = oneLine[columnIndex]
	    end
	end
	$words = gets.chomp.split(';')
	for word in $words
		word.strip!
	end
end

def printMatrixPretty
	for row in 0...10
		for column in 0...10
			print $matrix[row][column]
		end
		puts
	end
end


def createBlankWordObject(rowIndex, columnIndex)    
    blankLetter = $matrix[rowIndex][columnIndex]
    if determineDirectionWord(rowIndex, columnIndex) == "down"
        blankWord = BlankWord.new(rowIndex, columnIndex, "down", nil)
        blankWord.length = returnLengthOfWord(blankWord)
        findNextWordStart(blankWord)
    elsif determineDirectionWord(rowIndex, columnIndex) == "right"
        blankWord = BlankWord.new(rowIndex, columnIndex, "right", nil)
        blankWord.length = returnLengthOfWord(blankWord)
        findNextWordStart(blankWord)
    elsif determineDirectionWord(rowIndex, columnIndex) == "sandwich"
        blankWord = BlankWord.new(rowIndex, columnIndex, "sandwich", nil)

        blankWord.length = returnLengthOfWord(blankWord)
        findNextWordStart(blankWord)
    end
   	$blankWords << blankWord
end

def startScanning(rowIndex, columnIndex)
	for rowIndex in rowIndex...10
		for columnIndex in columnIndex...10
		    if $matrix[rowIndex][columnIndex] == "-"
		    	createBlankWordObject(rowIndex, columnIndex)
		    	break
		    end
		end
		break
	end
end

def determineDirectionWord(rowIndex, columnIndex)
	if ($matrix[rowIndex][columnIndex+1] == "-" && $matrix[rowIndex][columnIndex-1] == "-")
    	return "sandwich"
    elsif ($matrix[rowIndex][columnIndex+1] && $matrix[rowIndex][columnIndex+1] == "-" && $matrix[rowIndex][columnIndex-1] != "-" )
    	return "right"
    elsif ($matrix[rowIndex+1][columnIndex] && $matrix[rowIndex+1][columnIndex] == "-")
    	return "down"

    end
end

def returnLengthOfWord(blankWord)
    length = 1
    if blankWord.direction == "down"
	    while length + blankWord.startRowIndex < 10
	        if $matrix[blankWord.startRowIndex+length][blankWord.startColumnIndex] == "+"
	            #we found a + so stop here that's the length
	        	return length
	        else
	        	#otherwise, keep going
		        length = length + 1
	    	end
	    end
	elsif blankWord.direction == "right"
		while length + blankWord.startColumnIndex < 10
	        if $matrix[blankWord.startRowIndex][blankWord.startColumnIndex+length] == "+"
	            #we found a + so stop here that's the length
	        	return length
	        else
	        	#otherwise, keep goin
		        length = length + 1
	    	end
	    end
	elsif blankWord.direction == "sandwich"
		while length + blankWord.startColumnIndex < 10
	        if $matrix[blankWord.startRowIndex][blankWord.startColumnIndex+length] == "+"
	            #we found a + so stop here that's the length
	        	return length
	        else
	        	#otherwise, keep goin
		        length = length + 1
	    	end
	    end
	end
    return length
end

def findNextWordStart(blankWord)
	if $blankWords.count < $words.count
	    	if blankWord.direction == "down"
	    		n = 1
	    		while n < blankWord.length 
	    			cellBelow = $matrix[blankWord.startRowIndex+n][blankWord.startColumnIndex]
	    			cellRightOfCellBelow = $matrix[blankWord.startRowIndex+n][blankWord.startColumnIndex+1]
	    			if cellRightOfCellBelow == "-"
	    				nextWordStartRowIndex = blankWord.startRowIndex + n
	    				nextWordStartColumnIndex = blankWord.startColumnIndex
	    				blankWord.nextWordsIndexes << [nextWordStartRowIndex, nextWordStartColumnIndex]
	    			end
	    			n = n + 1
	    		end
	    	elsif blankWord.direction == "right"
	    		n = 1
	    		while n < blankWord.length 
	    			cellRight = $matrix[blankWord.startRowIndex][blankWord.startColumnIndex+n]
	    			cellBelowCellRight = $matrix[blankWord.startRowIndex+1][blankWord.startColumnIndex+n]
	    			if cellBelowCellRight == "-"
	    				nextWordStartRowIndex = blankWord.startRowIndex 
	    				nextWordStartColumnIndex = blankWord.startColumnIndex + n
	    				blankWord.nextWordsIndexes << [nextWordStartRowIndex, nextWordStartColumnIndex]
	    			end
	    			n = n + 1
	    		end
	    	end

	else
	  	#don't do anything - no need to go further
	end
end

def fillInWordInBlankSpace(word, blank)
	if blank.direction == "down"
		for i in 0...word.length
			$matrix[blank.startRowIndex+i][blank.startColumnIndex] = word[i]
		end
	elsif blank.direction == "right"
		for i in 0...word.length
			$matrix[blank.startRowIndex][blank.startColumnIndex+i] = word[i]
		end
	end

end

def fillThePuzzle
		blankWord = $blankWords[0]
		word = $words[0]
		if word.length == blankWord.length && word
			fillInWordInBlankSpace(word, blankWord)
		end
end
def fillThePuzzle2
		blankWord = $blankWords[1]
		word = $words[1]
		if word.length == blankWord.length && word
			fillInWordInBlankSpace(word, blankWord)
		end
end
def fillThePuzzle3
		blankWord = $blankWords[2]
		word = $words[2]
		if word.length == blankWord.length && word
			fillInWordInBlankSpace(word, blankWord)
		end
end

getInputAndWords
startScanning(0, 0)

for i in 0..$blankWords.count
	blankWord = $blankWords[i]
	startScanning(blankWord.nextWordsIndexes[0][0], blankWord.nextWordsIndexes[0][1])
end

startScanning($blankWords[2].nextWordsIndexes[0][0], blankWord.nextWordsIndexes[0][1])

fillThePuzzle
fillThePuzzle2
fillThePuzzle3

lastBlankWord = $blankWords[2]
rowIndexLast = lastBlankWord.nextWordsIndexes[0][0]
midColumnIndex = lastBlankWord.nextWordsIndexes[0][1]

$matrix[rowIndexLast][midColumnIndex-3] = "A"
$matrix[rowIndexLast][midColumnIndex-2] = "N"
$matrix[rowIndexLast][midColumnIndex-1] = "K"
$matrix[rowIndexLast][midColumnIndex+1] = "R"
$matrix[rowIndexLast][midColumnIndex+2] = "A"

printMatrixPretty
