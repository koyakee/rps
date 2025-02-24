rps_pattern = ""

loop do
    puts "最初はグー,じゃんけん..."
    puts "0(グー),1(チョキ),2(パー),3(たたかわない)"
    your_hand = gets.to_i
    opponent_hand = rand(2)
    puts "ホイ!"
    puts "------------------------"
    hands = ["グー", "チョキ", "パー"]
    puts "あなた:#{hands[your_hand]}"
    puts "相手:#{hands[opponent_hand]}"

    if (your_hand == 0 && opponent_hand == 1) ||
       (your_hand == 1 && opponent_hand == 2) ||
       (your_hand == 2 && opponent_hand == 0)
        rps_pattern = "勝ち"
        loop do
            puts "あっち向いて..."
            puts "0(上)1(下)2(左)3(右)"
            your_direction = gets.to_i
            opponent_direction = rand(3)
            puts "ホイ!"
            puts "------------------------"
            directions = ["上","下","左","右"]
            puts "あなた:#{directions[your_direction]}"
            puts "相手:#{directions[opponent_direction]}"
            if  your_direction == opponent_direction
                puts "あなたの#{rps_pattern}!"
                exit
            elsif ![0, 1, 2, 3].include?(your_direction)
                puts "不正な値です"
                next
            else
                puts "もう一回!"
                break
            end
        end
    elsif (your_hand == 0 && opponent_hand == 2) ||
          (your_hand == 1 && opponent_hand == 0) ||
          (your_hand == 2 && opponent_hand == 1)
        rps_pattern = "負け"
        loop do
            puts "あっち向いて..."
            puts "0(上)1(下)2(左)3(右)"
            your_direction = gets.to_i
            opponent_direction = rand(3)
            puts "ホイ!"
            puts "------------------------"
            directions = ["上","下","左","右"]
            puts "あなた:#{directions[your_direction]}"
            puts "相手:#{directions[opponent_direction]}"
            if  your_direction == opponent_direction
                puts "あなたの#{rps_pattern}!"
                exit
            elsif ![0, 1, 2, 3].include?(your_direction)
                puts "不正な値です"
                next
            else 
                puts "もう一回!"
                break
            end
        end
    elsif your_hand == opponent_hand
        puts ""
    elsif your_hand == 3
        puts "...何も起こらなかった"
        break
    else 
        puts "不正な値です"
        next
    end 
end