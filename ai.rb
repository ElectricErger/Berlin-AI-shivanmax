require 'berlin-ai'         # Require the berlin-ai library.

class Berlin::AI::Player
  def self.on_turn(game)         # Implement the on_turn method of Berlin::AI::Player.
    
    # puts "----"
    # puts "#{game.current_turn}"
    # puts "----"


    #attack strategy
    game.map.foreign_nodes.reject{ |x| x.free? }.each do |enemy_node|
      game.map.controlled_nodes.each do |our_node|
        soldiers=our_node.available_soldiers
        if our_node.adjacent?(enemy_node) and (soldiers>enemy_node.available_soldiers)
            game.add_move(our_node, enemy_node, soldiers)
        end
      end
    end




    #move strategy
    game.map.controlled_nodes.each do |node|
      node.adjacent_nodes.each do |adjacent_node|
        if !adjacent_node.occupied?
          soldiers=(0.5*node.available_soldiers).round
          game.add_move(node, adjacent_node, soldiers)
        end
      end
    end
  end
end
