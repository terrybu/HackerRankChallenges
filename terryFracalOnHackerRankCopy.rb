def drawTrunk(matrix, trunkRowOrigin, trunkColumnOrigin, level)
	for rowNumber in trunkRowOrigin...(trunkRowOrigin+level)
		matrix[rowNumber][trunkColumnOrigin] = "1"
	end
end



def drawBranches(matrix, branchRowOrigin, branchColumnOrigin, level, distanceFromMidPoint)
	for i in 0...level
		matrix[branchRowOrigin][branchColumnOrigin - distanceFromMidPoint] = "1"
		matrix[branchRowOrigin][branchColumnOrigin + distanceFromMidPoint] = "1"
		branchRowOrigin = branchRowOrigin - 1
		distanceFromMidPoint = distanceFromMidPoint+1
	end
end

def drawTree(matrix, rows, columns, level, n)
    drawTrunk(matrix, rows, columns, level)
	drawBranches(matrix, rows-1, columns, level, 1)
    if (n >= 2)
        level = level/2
        rows = rows - 16
        drawTrunk(matrix, (rows - level), columns - 2 * level, level)    
        drawTrunk(matrix, (rows - level), columns + 2 * level, level)
        drawBranches(matrix, rows-level-1, columns - 2 * level, level, 1)
        drawBranches(matrix, rows-level-1, columns + 2 * level, level, 1)
        if (n >= 3)
            level = level/2
            rows = rows - 16
            drawTrunk(matrix, (rows - level), columns - 6 * level, level)    
            drawTrunk(matrix, (rows - level), columns + 6 * level, level)
            drawBranches(matrix, rows-level-1, columns - 6 * level, level, 1)
            drawBranches(matrix, rows-level-1, columns + 6 * level, level, 1)
            
            drawTrunk(matrix, (rows - level), columns - 2 * level, level)    
            drawTrunk(matrix, (rows - level), columns + 2 * level, level)
            drawBranches(matrix, rows-level-1, columns - 2 * level, level, 1)
            drawBranches(matrix, rows-level-1, columns + 2 * level, level, 1)
        end
        if (n >= 4)
            level = level/2
            rows = rows - 64

            drawTrunk(matrix, rows - level*4-1, columns - 14 * level, level)    
            drawTrunk(matrix, rows - level*4-1, columns + 14 * level, level)
            drawBranches(matrix, rows-level*4-2, columns - 14 * level, level, 1)
            drawBranches(matrix, rows-level*4-2, columns + 14 * level, level, 1)
            
            drawTrunk(matrix, rows - level*4-1, columns - 10 * level, level)    
            drawTrunk(matrix, rows - level*4-1, columns + 10 * level, level)
            drawBranches(matrix, rows-level*4-2, columns - 10 * level, level, 1)
            drawBranches(matrix, rows-level*4-2, columns + 10 * level, level, 1)

            drawTrunk(matrix, rows - level*4-1, columns - 6 * level, level)    
            drawTrunk(matrix, rows - level*4-1, columns + 6 * level, level)
            drawBranches(matrix, rows-level*4-2, columns - 6 * level, level, 1)
            drawBranches(matrix, rows-level*4-2, columns + 6 * level, level, 1)
            
            drawTrunk(matrix, rows - level*4-1, columns - 2 * level, level)    
            drawTrunk(matrix, rows - level*4-1, columns + 2 * level, level)
            drawBranches(matrix, rows-level*4-2, columns - 2 * level, level, 1)
            drawBranches(matrix, rows-level*4-2, columns + 2 * level, level, 1)
        end
        if (n >= 5)
            (19...80).step(4) do |columnNumber|
                matrix[2][columnNumber] = "1"
            end
            for columnNumber in 18...81
                matrix[1][columnNumber] = "1"
            end
            for columnNumber in 18...81
                if columnNumber % 2 == 1
                    matrix[1][columnNumber] = "_"
                end
            end
      
        end
    end
end


def printTable(matrix)
	for rowNumber in 0...63
		for columnNumber in 0...100
			print matrix[rowNumber][columnNumber]
		end
        puts
	end
end


def makeMatrixAndPrintCanvas(rows, columns, level, n)
	matrix = Array.new(rows) {Array.new(columns)}
	for rowNumber in 0...rows
		for columnNumber in 0...columns
			matrix[rowNumber][columnNumber] = "_"
			cell = matrix[rowNumber][columnNumber]
		end
	end
    
	drawTree(matrix, rows - level, columns/2-1, level, n)
    printTable(matrix)
end


n = gets.chomp.to_i
makeMatrixAndPrintCanvas(63, 100, 16, n)