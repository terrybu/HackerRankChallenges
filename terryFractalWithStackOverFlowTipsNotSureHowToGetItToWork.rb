def printTable(matrix)
	for rowNumber in 0...63
		for columnNumber in 0...100
			cell = matrix[rowNumber][columnNumber]
            print cell
		end
        puts
	end
end

def drawTree(matrix, startPos, stopPos, line, level, count)
	if (level >= count)
		matrix[line-1][(startPos+(stopPos-startPos))/2] = '1'
		matrix[line-level][(startPos+(stopPos-startPos))/2+count] = '1'
		matrix[line-level][(startPos+(stopPos-startPos))/2-count] = '1'
		line = line - 1
		drawTree(matrix, startPos, stopPos, line, level, count+1)
	end
end

def makeMatrixAndPrintCanvas(rows, columns)
	matrix = Array.new(rows) {Array.new(columns)}
	for rowNumber in 0..62
		for columnNumber in 0..99
			matrix[rowNumber][columnNumber] = "_"
			cell = matrix[rowNumber][columnNumber]
		end
	end
    
	drawTree(matrix, 0, 100, 63, 16, 1)
    printTable(matrix)
end

makeMatrixAndPrintCanvas(63, 100)