# Enter your code here. Read input from STDIN. Print output to STDOUT

def calculateHeightAfterNCycles(cyclesLeft)
    height = 1
    spring = true #initially we are at spring
    if (cyclesLeft == 0) #no growth, return 1
        return height
    else
        while (cyclesLeft != 0)
            if (spring)
                height = height * 2
            elsif (!spring)
                height = height + 1
            end
            spring = !spring #now we are no longer at spring
            cyclesLeft -= 1
        end
    end
    return height
end

N = gets.chomp
N.to_i.times do 
    line = gets
    startLength = line.to_i
    puts calculateHeightAfterNCycles(startLength)
end