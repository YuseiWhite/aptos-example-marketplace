# encoding: UTF-8


class SevenPointsTieBreak
    attr_accessor :player1_name
    attr_accessor :player2_name
    attr_accessor :win_player1
    attr_accessor :win_player2 

    def initialize(player1_name="Aさん", player2_name="Bさん")
        @player1_name = player1_name
        @player2_name = player2_name
        @win_player1 = "Game set and match won by " + @player1_name + "."
        @win_player2 = "Game set and match won by " + @player2_name + "."
    end
        
    def which_player_point_acquired_is(count_player1=0, count_player2=0)
        which_point = "1か2で入力して下さい："
        print(which_point)
        get_point = gets.chomp
        if get_point == "1" || get_point == "2"
            get_point = get_point.to_i
            if get_point == 1
                count_player1 += 1
            elsif get_point == 2
                count_player2 += 1
            end
            return count_player1, count_player2
        end
    end

    def run_seven_points_tie_break
        count_player1 = 0
        count_player2 = 0
        which_player_get_point_is = "1:" + @player1_name + "がポイントを取った\n" + "2:" + @player2_name + "がポイントを取った"
        puts(which_player_get_point_is)
        while true do
            count_player1, count_player2 = self.which_player_point_acquired_is(count_player1, count_player2)
            point_of_two_players = "【Tie-break】\n" + @player1_name + ": " + count_player1.to_s \
                                   + "\n" + @player2_name + ": " + count_player2.to_s
            puts(point_of_two_players)

            dif = count_player1 - count_player2
            dif = dif.abs
            if dif == 2 && (count_player1 >= 8 || count_player2 >= 8)
                player1_tiebreak_point = count_player1
                player2_tiebreak_point = count_player2
                return player1_tiebreak_point, player2_tiebreak_point
            elsif (count_player1 == 7 || count_player2 == 7) && (count_player1 < 6 || count_player2 < 6)
                player1_tiebreak_point = count_player1
                player2_tiebreak_point = count_player2
                return player1_tiebreak_point, player2_tiebreak_point
            end
        end
    end

    def seven_points_tie_break_result
        player1_tiebreak_point, player2_tiebreak_point = self.run_seven_points_tie_break()

        if player1_tiebreak_point > player2_tiebreak_point
            player1_win_tiebreak_match = "【Tie-break】\n" + @player1_name + ": " + player1_tiebreak_point.to_s \
                                         + "\n" + @player2_name + ": " + player2_tiebreak_point.to_s + "\n" \
                                         + @win_player1
            puts(player1_win_tiebreak_match)
        elsif player1_tiebreak_point < player2_tiebreak_point
            player2_win_tiebreak_match = "【Tie-break】\n" + @player1_name + ": " + player1_tiebreak_point.to_s \
                                         + "\n" + @player2_name + ": " + player2_tiebreak_point.to_s + "\n" \
                                         + @win_player2
            puts(player2_win_tiebreak_match)
        end
    end
end


game = SevenPointsTieBreak.new("Tanaka", "Ikuta")
game.seven_points_tie_break_result