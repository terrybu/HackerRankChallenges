# Enter your code here. Read input from STDIN. Print output to STDOUT
email_regex = /\b([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\b/i

linesCounter = gets.chomp.to_i
resultEmails = []

linesCounter.times do
    oneLine = gets.chomp.force_encoding("ISO-8859-1").encode("utf-8")
    wordsArray = oneLine.split(' ')
    for word in wordsArray
        if email_regex.match(word) && !resultEmails.include?(word)
           resultEmails << email_regex.match(word).to_s
        end
    end
end

puts resultEmails.sort.join(';')